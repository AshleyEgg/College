% DO NOT CHANGE THIS LINE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function ABCs_surfacePlotting(x1, y1, r1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ABCs of Surface Plotting
%
whitebg([1,1,1])
% Directions:
%   Follow the steps specified below and fill in the blanks to complete
%   this plotting code.

% 1. Use meshgrid() to output a "grid" of values, using the data stored in 
%    the given variables x1 and y1.
    [A, B]=meshgrid(x1,y1);


% 2. Continue using the output values above to create another output
%    that associates the x and y variables according to the equation: 
%    z = x^2 + 3y^2 + 1.
   [C]=A.^2 +3.*B.^2+1;


% 3. Create a 3x2 subplot and begin plotting at the top left corner
subplot(3,2,1);

% 4. Use all of the previous outputs and the mesh() function to create a
%    3D "mesh" of the data.

mesh(A,B,C);
% 5. Continue with the 3x2 subplot, but plot in the top right corner.
subplot(3,2,2);

% 6. Now use the same outputs as before and the surf() function to create a
%    3D "surface" of the data.
surf(A,B,C);

% 5. Continue with the 3x2 subplot, but plot in the middle left.
subplot(3,2,3);

% 7. Use the sphere() function to create the new x, y, and z data for a 
%    sphere consisting of 50 data points, of radius 5.
    [D, E, F]=sphere(50);
    
r=5;




% 8. Use the sphere outputs to make a 3D "surface" of the sphere.
surf(D*r,E*r,F*r);

% 9. Continue with the 3x2 subplot, but plot in the middle right.
subplot(3,2,4)

% 10. Use the cylinder() function to create the new x, y, and z data for a 
%     cylinder of 50 data points using the given variable r1 
%     (which contains a vector of radii).
     [G, H, I]=cylinder(r1,50);


% 11. Use the cylinder outputs to make a 3D "surface" of the cylinder.
surf(G,H,I);

% 12. Continue with the 3x2 subplot, but plot in the bottom left corner.
subplot(3,2,5)

% 13. Use the sphere function make a flat disk consisting of 50 data 
%     points, of radius 1.
     [J, K, L]=sphere(50);



% 14. Use the disk outputs to make a 3D "surface" of the disk.
surf(J,K,L*0)

% 15. Continue with the 3x2 subplot, but plot in the bottom right corner.
subplot(3,2,6);

% 16. Use the data for the cylinder you made in part 10 and the disk you 
%     made in part 13 to make a 3D "surface" of a closed cylinder.
%     Set the view to the default 3D view
hold on
surf(G,H,I)
surf(J,K,L*0+1)
surf(J,K,L*0)



 view(3)
hold off

end
