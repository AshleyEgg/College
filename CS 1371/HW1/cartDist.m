function dist = cartDist (x1, y1, x2, y2)
% Distance formula for the distance between two points
distx = x2-x1;
disty = y2-y1;
dist = sqrt(distx^2+disty^2);
dist = round(dist,2);
end