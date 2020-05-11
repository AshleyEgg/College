from __future__ import division                 ## treat integers as real numbers in division
from visual import *
from visual.graph import *
scene.width=600
scene.height = 760


## Setup graphing windows
gdisplay(width=500, height=250, x=600, y=1)
gdisplay(width=500, height=250, x=600, y=300)

## constants and data
g = 9.8
mball = 0.4765   ## change this to the Mass you used in the lab for the oscillation experiments
L0 = 0.3  ## use the relaxed length from your previous lab
ks = 12     ## change this to the spring constant you measured (in N/m)
deltat = 1e-3  ## change this to be about 1/1000 of your measured period when you used Mass 2
pscale= 5
fscale=0.1

t = 0       ## start counting time at zero

## objects
ceiling = box(pos=(0,0,0), size = (0.2, 0.01, 0.2))         ## origin is at ceiling
ball = sphere(pos=(0.0579,-0.2178,-0.2211), radius=0.025, color=color.orange) ## note: spring initially compressed
spring = helix(pos=ceiling.pos, color=color.cyan, thickness=.003, coils=40, radius=0.015) ## change the color to be your spring color
spring.axis = ball.pos - ceiling.pos
gdisplay(width=500, height=250, x=600, y=1)
gdisplay(width=500, height=250, x=600, y=300)
##ygraph = gcurve(color=color.yellow)
##pgraph = gcurve(color=color.yellow)
pArrow=arrow(color=color.yellow)
fnetArrow=arrow(color=color.cyan)
trail = curve(color=ball.color)


## initial values
ball.p = mball*vector(0.164,0.067,0.444)

## improve the display
scene.autoscale = 0             ## don't let camera zoom in and out as ball moves
scene.center = vector(4,-L0,0)   ## move camera down to improve display visibility

## calculation loop

while t < 7.96:           ## make this short to read period off graph
    rate(1000)
    L=ball.pos-spring.pos
    Lhat=norm(L)
    s=mag(L)-L0
## calculate force on ball by spring (note: requires calculation of L_vector)
    fSpring=-(ks*s)*Lhat
## calculate net force on ball (note: has two contributions)
    fNet=fSpring+vector(0,-mball*g,0)
## apply momentum principle
    ball.p=fNet*deltat+ball.p
## update position
    ball.pos=(ball.p/mball)*deltat+ball.pos
## update axis of spring
    spring.axis=ball.pos-ceiling.pos

    pArrow.pos=ball.pos
    pArrow.axis=ball.p*pscale

    fnetArrow.pos=ball.pos
    fnetArrow.axis=fNet*fscale
## update time   
    t = t + deltat
    ##ygraph.plot(pos=(t, fNet.y))
    ##pgraph.plot(pos=(t, ball.p.y))
    trail.append(pos=ball.pos)
    

print("final pos is ", ball.pos,"final velocity is",ball.p/mball)
