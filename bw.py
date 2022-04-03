import colorsys
# convert rgb values from 0-255 to %
r = 120/255.0
g = 29/255.0
b = 200/255.0
h, l, s = colorsys.rgb_to_hls(r, g, b)
if l >= .5:
    # color is lighter
    result_rgb = (255, 255, 255)
elif l < .5:
    # color is darker
    result_rgb = (0,0,0)

print(result_rgb)