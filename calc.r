# Calculators for calories burned by
#   uphill/level hiking (var U) and downhill hiking (var D)
#
# Variables: body weight = w, pack weight = L, terrain factor = t,
# Grade(percent) = g, walking speed = s

w <- as.numeric(readline(prompt = "Enter Body Weight: "))
L <- as.numeric(readline(prompt = "Enter Pack Weight: "))
t <- as.numeric(readline(prompt = "Enter Terrain Factor: "))
g <- as.numeric(readline(prompt = "Enter Grade (Percent): "))
s <- as.numeric(readline(prompt = "Enter Walking Speed: "))  

if (g >= 0) {
  U <- w/2.2*60/4184 * 20.1*(3.05 + (w/2.2 + L/2.2) / w*2.2 * t * (0.32 * g + 3.28 +
           (1 + 0.19 * g) * 2.66 * (s*1609/3600)*(s*1609/3600)))
  cat("Calories burned: ", as.character(round(U, digits = 2)))  
} else {
  
  D <- w/2.2*60/4184 * 20.1*(3.05 + 0.73 * (w/2.2 + L/2.2) / w*2.2 * t * 
                             (3.28 + 2.66 * (s*1609/3600)*(s*1609/3600)))
  cat("Calories Burned hiking downhill: ", as.character(round(D, digits = 2)))
}
#vg <- vr + (c1 * g) + vwm + (1 + (c2 * g)) * (c3 * v^2)