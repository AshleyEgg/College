from __future__ import division                 ## treat integers as real numbers in division
from visual import *
scene.width=600
scene.height = 760


## constants and data
g = 9.8
mball = 0.1365
L0 = 0.3
ks = 12
epsilon = 0.7378


## objects
ceiling = box(pos=(0,0,0), size = (0.2, 0.01, 0.2))
ball = sphere(pos=(0.1092, -0.222, 0), radius=0.025, color=color.orange)
spring = helix(pos=ceiling.pos, color=color.cyan, thickness=.003, coils=40, radius=0.015)
spring.axis = ball.pos - ceiling.pos
trail  = curve(color=ball.color)

## initial values
ball.p = mball*vector(-0.369, 0.258, 0)

#time
t = 0
deltat = 5e-5


## improve the display
scene.autoscale = 0             ## don't let camera zoom in and out as ball moves
scene.center = vector(0,-L0,0)   ## move camera down to improve display visibility

## calculation loop

while t < 9.00005:
    rate(1000000)

    L_vector=ball.pos-ceiling.pos
    s=mag(L_vector)-L0

    Fspringmag= ks*s + epsilon*s**3
    Fspring=-Fspringmag*norm(L_vector)

    Fgrav=mball*g*vector(0,-1,0)

    Fnet=Fgrav+Fspring

## apply momentum principle (compute the magnitude of the components of the net force)
    pi=ball.p+vector(0,0,0)
    pinitial=mag(pi)
    
    ball.p=ball.p+Fnet*deltat
    pfinal=mag(ball.p)

    Fpara=(pfinal-pinitial)/deltat*norm(ball.p)
    Fperp=Fnet-Fpara

## update position

    ball.pos=ball.pos+ball.p/mball * deltat 

## update axis of spring

    spring.axis=ball.pos-ceiling.pos
    trail.append(pos=ball.pos)

## update time   
    t = t + deltat
print("Final position=", ball.pos)
print("Final velocity=", ball.p/mball)
print("Fparallel=", mag(Fpara))
print("Fperp=", mag(Fperp))
