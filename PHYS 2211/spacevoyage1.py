from __future__ import division
from visual import *
scene.width=1024
scene.height=760


# CONSTANTS
G = 6.7e-11
mEarth = 6e24
mcraft = 15e3
deltat = 60
t = 0
pscale=0.25
fscale=10000
dpscale=100


#OBJECTS AND INITIAL VALUES
Earth = sphere(pos=vector(0,0,0), radius=6.4e6, color=color.cyan)
scene.range=11*Earth.radius
# Add a radius for the spacecraft. It should be BIG, so it can be seen.
craft = sphere(pos=vector(-6.144e+07,5.952e+06,0), radius=1.0e6, color=color.yellow)
vcraft = vector(970,2829,0)
pcraft = mcraft*vcraft
pArrow=arrow(color=color.green)
fArrow=arrow(color=color.cyan)
dpArrow=arrow(color=color.red)

trail = curve(color=craft.color)    # This creates a trail for the spacecraft
scene.autoscale = 0                 # And this prevents zooming in or out


print("p=", pcraft)
# CALCULATIONS
while t < 1513728:#10*365*24*60*60:
    rate(2000)   # This slows down the animation (runs faster with bigger number)

    
    r=Earth.pos-craft.pos
    rmag=sqrt(r.x**2+r.y**2+r.z**2)
    Fmag=(G*mEarth*mcraft)/(rmag**2)
    rhat=r/rmag
    Fnet = Fmag*rhat
    #print("Fnet =",Fnet)
    pcraft_i=pcraft+vector(0,0,0)
    pcraft = pcraft+Fnet*deltat
    deltap=pcraft-pcraft_i
    vcraft = (pcraft/mcraft)
    craft.pos= craft.pos+(vcraft *deltat)
    pArrow.pos=craft.pos
    pArrow.axis=pcraft*pscale
    fArrow.pos=craft.pos
    fArrow.axis=Fnet*fscale
    dpArrow.pos=craft.pos
    dpArrow.axis=deltap*dpscale

    if rmag < Earth.radius: 
        break

    trail.append(pos=craft.pos)  
    t = t+deltat
print("Velocity of craft=", vcraft," and final position =", craft.pos)
print("Calculations finished after ",t, "seconds")
