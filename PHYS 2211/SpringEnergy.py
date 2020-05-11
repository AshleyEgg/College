from __future__ import division                 ## treat integers as real numbers in division
from visual import *
from visual.graph import *
scene.width=600
scene.height = 760

## Setup graphing windows
gdisplay(width=500, height=250, x=600, y=1)
#ygraph = gcurve(color=color.yellow)
gdisplay(width=500, height=250, x=600, y=300)
#pgraph = gcurve(color=color.yellow)
Kgraph=gcurve(color=color.red)
Ugraph=gcurve(color=color.cyan)
KplusUgraph=gcurve(color=color.green)
## constants and data
g = 9.8
mball = .1   ## change this to the Mass you used in the lab for the oscillation experiments
L0 = 0.3   ## use the relaxed length from your previous lab
ks = 12    ## change this to the spring constant you measured (in N/m)
deltat = 1e-3  ## change this to be about 1/1000 of your measured period when you used Mass 2
fscale=.1
pscale=1
n=0.081 #viscosity
r= 0.025 #stokes radius
t = 0       ## start counting time at zero
## objects
ceiling = box(pos=vector(0,0,0), size = vector(0.2, 0.01, 0.2))         ## origin is at ceiling
ball = sphere(pos=vector(-0.2253,-0.0645,-0.2175), radius=0.025, color=color.orange) ## note: spring initially compressed
spring = helix(pos=ceiling.pos, color=color.cyan, thickness=.003, coils=40, radius=0.015) ## change the color to be your spring color
spring.axis = ball.pos - ceiling.pos
trail = curve(color=ball.color)
## initial values
vball=vector(.316,.441,.247)
ball.p = mball*vball
b=6*pi*n*r
## improve the display
scene.autoscale = 0             ## don't let camera zoom in and out as ball moves
scene.center = vector(0,-L0,0)   ## move camera down to improve display visibility
fnetArrow = arrow(pos = (ball.pos), color = color.green)
pArrow = arrow(pos = (ball.pos), axis= (ball.p * pscale), color = color.red)
               
## calculation loop
while t < 8.14:           ## make this short to read period off graph
    rate(700)
    
## calculate force on ball by spring (note: requires calculation of L_vector)
    L=ball.pos-spring.pos
    Lmag=mag(L)
    Lhat=L/Lmag
    s=Lmag-L0
    Fspring=-1*ks*s*Lhat
    Fviscous=-b*vball
    
## calculate net force on ball (note: has two contributions)
    Fmagy=g*mball
    Fgrav=vector(0,-1*Fmagy,0)
    Fnet=Fspring+Fgrav+Fviscous
## apply momentum principle
    ball.p=ball.p+Fnet*deltat
## update velocity
    vball=ball.p/mball
## update position
    ball.pos= ball.pos+(ball.p/mball)*deltat
    #ygraph.plot(pos=(t, ball.pos.y))
    #pgraph.plot(pos=(t, ball.p.y))
    fnetArrow.pos = ball.pos
    fnetArrow.axis = Fnet * fscale
    pArrow.pos = ball.pos
    pArrow.axis = ball.p *pscale
## update axis of spring
    spring.axis=ball.pos-ceiling.pos
#Calculating Energy
    K_ball = 0.5*mball*(mag(ball.p/mball))**2   
    U_ball = mball*g*ball.pos.y + 0.5*ks*s**2
    E= K_ball+U_ball
    #Graph Updates
    Kgraph.plot(pos=(t,K_ball))
    Ugraph.plot(pos=(t,U_ball))
    KplusUgraph.plot(pos=(t,E))
    
## update time   
    t = t + deltat
    trail.append(pos=ball.pos)
    
print("The balls position is ",ball.pos)
print("The craft's velocity is ",(ball.p/mball))

