from __future__ import division
from visual import *

baseball=sphere(pos=vector(-4,2,5),radius=0.4,color=color.red)
tennisball=sphere(pos=vector(3,1,-2),radius=0.15,color=color.green)
bt=arrow(pos=baseball.pos, axis=tennisball.pos-baseball.pos, color=color.cyan)

xpart=arrow(pos=bt.pos, axis=vector(bt.axis.x,0,0), color=color.yellow)
ypart=arrow(pos=bt.pos, axis=vector(0,bt.axis.y,0), color=color.yellow)
zpart=arrow(pos=bt.pos, axis=vector(0,0,bt.axis.z), color=color.yellow)
