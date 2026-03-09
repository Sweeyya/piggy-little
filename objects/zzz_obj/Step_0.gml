y -= float_speed;
x += drift;
alpha -= 0.015;
image_alpha = alpha;
if alpha <= 0 instance_destroy();