from __future__ import division
from visual import *
from visual.graph import * #Invoke graphing routines
scene.y = 400 #Move orbit window below graph
scene.width=1024
scene.height=760
 
 
# CONSTANTS
G = 6.7e-11
mEarth = 6e24
mMoon = 7e22
distEarth2Moon = 4e8
distSpace2Earth = 6.4e7
mcraft = 15000
deltat = 60
t = 0
pscale=0.25
fscale=10000
dpscale=100
Fnet_tangent_scale = 100000
Fnet_perp_scale = 100000
 
 
#OBJECTS AND INITIAL VALUES
Earth = sphere(pos=vector(0,0,0), radius=6.4e6, color=color.cyan)
scene.range=11*Earth.radius
Moon = sphere(pos=vector(4e8,0,0), radius=1.75e6, color=color.white)
# Add a radius for the spacecraft. It should be BIG, so it can be seen.
craft = sphere(pos=vector(-76160000,-3520000,0), radius=1.0e6, color=color.yellow)
vcraft = vector(500,2000,0)
pcraft = mcraft*vcraft
pArrow=arrow(color=color.green)
fArrow=arrow(color=color.cyan)
dpArrow=arrow(color=color.red)
Fnet_tangent_arrow = arrow(color = color.yellow)
Fnet_perp_arrow = arrow(color=color.magenta)
Moon.v=vector(0,sqrt(G*mEarth/distEarth2Moon),0)
momentum_Moon=Moon.v*mMoon

 
trail = curve(color=craft.color)    # This creates a trail for the spacecraft
scene.autoscale = 0                 # And this prevents zooming in or out

U_graph = gcurve(color=color.blue) #A plot of the Potential energy
K_graph = gcurve(color=color.yellow) #A plot of the Kinetic energy
Energy_graph = gcurve(color=color.green) #A plot of the Total energy
 
print("p=", pcraft)
# CALCULATIONS
while t < 5000000000:
    rate(200000)   # This slows down the animation (runs faster with bigger number)
    #scene.center=craft.pos
    #scene.range=craft.radius*60
 
 
   
    rEarth=Earth.pos-craft.pos
    rMoon = Moon.pos-craft.pos
    rmagEarth=mag(rEarth)
    rmagMoon = mag(rMoon)
    FmagEarth=(G*mEarth*mcraft)/(rmagEarth**2)
    FmagMoon = (G*mMoon*mcraft)/(rmagMoon**2)
    rhatEarth=norm(rEarth)
    rhatMoon = norm(rMoon)
    FnetEarth = FmagEarth*rhatEarth
    FnetMoon = FmagMoon*rhatMoon
    Fnet = FnetEarth+FnetMoon
    #print("Fnet =",Fnet)
    pcraft_i=pcraft+vector(0,0,0)
    p_init=mag(pcraft_i)
    pcraft = pcraft+Fnet*deltat
    p_final = mag(pcraft)
    deltap=pcraft-pcraft_i
    phat = norm(pcraft)
    Fnet_tangent = ((p_final-p_init)/deltat)*phat
    Fnet_perp = (Fnet - Fnet_tangent)
    vcraft = (pcraft/mcraft)
    craft.pos= craft.pos+(vcraft *deltat)
    #pArrow.pos=craft.pos
    #pArrow.axis=pcraft*pscale
    #fArrow.pos=craft.pos
    #fArrow.axis=Fnet*fscale
    #dpArrow.pos=craft.pos
    #dpArrow.axis=deltap*dpscale
    Fnet_tangent_arrow.pos = craft.pos
    Fnet_tangent_arrow.axis = Fnet_tangent*Fnet_tangent_scale
    Fnet_perp_arrow.pos = craft.pos
    Fnet_perp_arrow.axis = Fnet_perp*Fnet_perp_scale
    #print("Magnitude is", mag(pcraft))
    #print("Velocity is", mag(vcraft))
    #print("Perpindicular is", mag(Fnet_perp))
    #print("Distance is", mag(rEarth))

    r_EarthMoon = Moon.pos-Earth.pos#Relative position vector from Earth to Moon
    r_craftMoon = Moon.pos-craft.pos#Relative position vector from spacecraft to Moon
    Force_EarthMoon = -(G*mEarth*mMoon)/(mag(r_EarthMoon)**2)*norm(r_EarthMoon)#Force on Moon due to Earth
    Force_craftMoon = -(G*mEarth*mMoon)/(mag(r_EarthMoon)**2)*norm(r_craftMoon)#Force on Moon due to spacecraft
    Fnet_Moon = Force_EarthMoon+Force_craftMoon#Net force on Moon
    momentum_Moon = Fnet_Moon*deltat+momentum_Moon#Update momentum of Moon
    Moon.v=momentum_Moon/mMoon
    Moon.pos = Moon.pos+(Moon.v*deltat)#Update momentum of Moon
    

    K_craft=0.5*mcraft*mag(vcraft)**2
    U_craft_Earth=-(G*mcraft*mEarth)/rmagEarth
    U_craft_Moon=-(G*mcraft*mMoon)/rmagMoon
    E=K_craft+U_craft_Earth+U_craft_Moon

    U_graph.plot(pos=(t,U_craft_Earth+U_craft_Moon)) #Potential energy as a function of time
    K_graph.plot(pos=(t,K_craft)) #Kinetic energy as a function of time
    Energy_graph.plot(pos=(t,E)) #Total energy as a function of time
    
    if rmagEarth < Earth.radius:
        break
    if rmagMoon < Moon.radius:
        break
    
 
    #trail.append(pos=craft.pos)
    trail.append(pos=Moon.pos,color=color.cyan)
    t = t+deltat
print("Velocity of craft=", vcraft," and final position =", craft.pos," and Gravitational Force is", Fnet)
print("Calculations finished after ",t, "seconds")
print("Moon momentum ",momentum_Moon)
