from __future__ import division
from visual import *

#Constants
mcart = 0.2214 #mass in kg

#Objects
track = box(pos=vector(0,-0.05,0), size=vector(2.0,0.05,0.10), color=color.white)
cart = box(pos=vector(0.065,0,0), size=vector(0.1,0.04,0.06), color=color.red)

#Initial Conditions
vcart =vector(-0.192,0.251,0)
pcart=mcart*vcart
print("cart momentum =", pcart)

deltat = 0.01
t=0
Fnet=vector(-0.247,0,0)

#Calculation loop
while t<=5.38:
    rate(100)
    pcart=pcart+Fnet*deltat
    cart.pos = cart.pos+(pcart/mcart)*deltat
    #print("The position is",cart.pos)
    vcart=vcart+(Fnet/mcart)*deltat
    t = t+deltat
print("After the loop the position is",cart.pos)
print("After the loop the velocity is",vcart)
print("After the loop the momentum is",pcart)
