# Calculators for calories burned by
#   uphill/level hiking (var U) and downhill hiking (var D)
#
# Variables: body weight = w, pack weight = L, terrain factor = t,
# Grade(percent) = g, walking speed = s

w = 120
L = 45
t = 1
g = 15
s = 2.4  

U <- w/2.2*60/4184 * 20.1*(3.05 + (w/2.2 + L/2.2) / w*2.2 * t * (0.32 * g + 3.28 +
           (1 + 0.19 * g) * 2.66 * (s*1609/3600)*(s*1609/3600)))
U  
  
D <- w/2.2*60/4184 * 20.1*(3.05 + 0.73 * (w/2.2 + L/2.2) / w*2.2 * t * 
                             (3.28 + 2.66 * (s*1609/3600)*(s*1609/3600)))
D

#vg <- vr + (c1 * g) + vwm + (1 + (c2 * g)) * (c3 * v^2)