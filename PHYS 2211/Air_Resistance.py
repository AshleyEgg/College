from __future__ import division
from visual import *
from visual.graph import *
scene.y=400

# Turn off autoscaling
autoscale=0

# Create objects: ground, cliff, cannon
# Ground is at y=0
# Ball initial position is initialPos
# Ball initial velocity is initialVel
# Ball size is enlarged for viewing.  For calculations, consider it to be 2 m diameter

# Initial Conditions
initialPos = vector(-69.1,60.3,0)
initialVel = vector(36.6,30.7,0)

# Setup the scene
ground = box(pos=(0,0,0), length = 1200, height = 1, width = 10, color=color.green)
cliff = box(pos=(initialPos.x-40,initialPos.y/2,0), length = ground.length/2+initialPos.x, height = initialPos.y, width = 10, color=color.green)

# Make Cannon
L=10
wheel = cylinder(pos=initialPos, axis=vector(0,0,1),radius=5, color=color.blue)
cannon = cylinder(pos=initialPos, axis=L*initialVel/mag(initialVel), radius=1)

# Setup ball and trail
ball = sphere(pos=initialPos, radius = 2, color=color.red)
trail = curve(color=ball.color)

# Constants
ball.m = 72.1		# ball's mass (10 kg)
g = 9.8			# gravitational acceleration
pScale = 0.05	        # scale for momentum arrow
fScale = 0.1	        # scale for force arrow
fnet_perp_scale=0.5
fnet_tan_scale=0.5

# Drag constants
airDensity = 1.3		# density of air near the surface of the Earth
areaBall = pi*1**2		# cross-sectional area of the ball (diameter 2m)
dragCoeff = 0.1043         	# drag coefficient for this ball

# Initialize ball's momentum
ball.p=ball.m*initialVel

# Time Setup
t=0
deltat=1e-2

#Setup Force and momentum Arrows
pArrow = arrow(pos=initialPos, color=color.red)
fArrow = arrow(pos=initialPos, color=color.white)
fperpArrow = arrow(pos=initialPos, color=color.blue)
fparaArrow = arrow(pos=initialPos, color=color.green)

# The while loop below models the motion of the ball after it leaves the cannon
# Motion coninues until the ball's height reaches zero.

# MODIFY THE CODE IN THIS LOOP according to the instructions in the lab instructions.

Kgraph=gcurve(color=color.red)
Ugraph=gcurve(color=color.cyan)
KplusUgraph=gcurve(color=color.yellow)

while t<=5.22:#ball.pos.y>0:
	
    rate(50)
    # Calculate the net force on the ball
    Fair = -0.5 * dragCoeff * airDensity * areaBall * mag(ball.p/ball.m)**2 * norm(ball.p/ball.m)
    fnet=vector(0,-ball.m*g,0) + Fair
        
    # Update the momentum of the ball
    p_initial=mag(ball.p)
    ball.p=ball.p+fnet*deltat

        
    # Update the position of the ball
    ball.pos=ball.pos+ball.p/ball.m*deltat
    
        
    
    # Update the trails of the ball
    trail.append(pos=ball.pos)
        
        
        
    # Calculate the force components
    p_final=mag(ball.p)
    fnet_tan= ((p_final-p_initial)/deltat)*norm(ball.p)
    fnet_perp = fnet- fnet_tan
        
        
        
    # Update the arrows representing the momentum, force and force components
    fparaArrow.pos=ball.pos
    fparaArrow.axis=fnet_tan*fnet_tan_scale
    fperpArrow.pos=ball.pos
    fperpArrow.axis=fnet_perp*fnet_perp_scale

    K = 0.5 * ball.m * mag(ball.p/ball.m)**2
    U = ball.m * g * ball.pos.y

    Kgraph.plot(pos=(t,K))
    Ugraph.plot(pos=(t,U))
    KplusUgraph.plot(pos=(t,K+U))



    # Update time
    t=t+deltat 		

print("Package hit the ground")
print("time=", t, "s")
vel=ball.p/ball.m
# In addition to time, print the final values of the following quantities:
# magnitude of ball's velocity
# x-component of ball's velocity
# y-component of ball's velocity
# x-position of ball
#print("Velocity is ",mag(vel),"X-Vel",vel.x,"y-vel",vel.y,"X-pos",ball.pos.x)
print("Final pos",ball.pos,"Final Vel",vel,"Parallel",mag(fnet_tan),"Perp",mag(fnet_perp))    
