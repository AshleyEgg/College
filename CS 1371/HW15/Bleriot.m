function Bleriot
% Global functions definitions
global fx
global fy
global fz
global cloud
global nc
global rotation
% Create limits for the plot (frame).  Fill in the values
lowerlim =  -75;
upperlim =  75;
lowerx =    -75;
upperx =    75;
%        1  2  3  4  5  6  7  8  9  0 
 fx = [  0  4 25 25 30 32 42 42 30 24 ...
         4  0 24 30 42.1];
 fy = [  0  1  2  4  4  2  3  3  4  4 ...
         1  0  2  2  0 ];
 fz = [ 10 10 13 10 10 12 10  3  3  3 ...
         3  3  0  0 6.5];
% Create your objects using the functions at the bottom
pilot=makePilot();
prop=makeProp();
w=makeWheel();
wing=makeWing();

% Number of faces for the cloud
nc = 5;    % YOU SHOULD DECIDE THIS NUMBER

% Make a cloud (use make_clouds function)

[minx, maxx] =  make_clouds;

% Give the clouds starting positions

px=10;
pz=10;
draw_clouds(px,pz)

% Initializations (make any initializations you may need here... you may
% need more than the 3 listed here)
roll = 0;
pitch = 0;
yaw = 0;
frames=0;
andx=0;

% MAIN LOOP:
while true
    % Create your rotation matrices here.  Note... Roll deals
    aboutx = [1, 0, 0; 0, cosd(roll), -sind(roll); 0, sind(roll), cosd(roll)]; % the "angle" will be roll... ex cos(roll)
    abouty = [cosd(pitch), 0, sind(pitch); 0, 1, 0; -sind(pitch), 0, cosd(pitch)]; % the "angle" will be pitch... ex cos(pitch)
    aboutz = [cosd(yaw), -sind(yaw), 0; sind(yaw), cosd(yaw), 0; 0, 0, 1]; % the "angle" will be yaw.... ex cos(yaw)

    % Update Rotation
    rotation = aboutz * abouty * aboutx;
    % Increment frames
    frames = frames + 1;
    % Increment andx.  Will be used to change the view for later
    andx = andx + 0.3;
    % Update the position of the clouds

    px=px+0.5;
    pz=pz+0.5;

    % Make sure that your cloud didn't go off screen.  If it did, you
    % need to redraw a cloud and initialize starting point again
    if minx<lowerx || maxx>upperx
        draw_clouds(px,pz)
    end
     

    % Change the azimuth
    az = 20 * cosd(andx);
    % Actually draw the parts.  Everything should be on the same screen.
    hold on
    drawProp(prop)
    drawPilot(pilot)
    drawWheels(w)
    drawTail(wing)
    drawWings(wing)
    drawBody()
    hold off
     
     
    % Add any visual enhancements you need/want to here
    
     grid off%Turns of gridlines
     axis off%Turns off axises
     axis([lowerlim,upperlim,lowerlim,upperlim,lowerlim,upperlim])
     whitebg([0,0,1])%Sets background color to blue
     
     
    
    % Ensure your view is set properly
    
     view(az,3)
    
    % Remove the excess stuff on the screen
    
     
    
    % Pause, and get ready to draw next frame    
     pause(0.03)
     
    
    %  Update your plane to make it fly.  You can use roll, pitch, and yaw
    %  to make your plane do rolls and flips on the screen.  Experiment and
    %  think about how to make your plane do this.  You need to have your
    %  plane follow the directions (you have a rubric to see what your
    %  plane needs to do.

   if frames>15 && roll<=360 
       roll=roll+10;%Rotates the plane by 10 degrees 
       cla%Gets rid of previous iterations
       px=px+0.5;
       pz=pz+0.5;
   elseif frames>60 && pitch>=-360
       pitch=pitch-5;
       cla
       px=px-0.5;
       pz=pz+0.5;
   else
       px=px+0.5;
       pz=pz+0.5;
       
   end   
    
end
end

function drawProp(prop)
% draws the propeller of the plane, given the data of the propeller.
     s1 = rsurf(prop.xx, prop.yy, prop.zz, prop.clr);
     set(s1, 'FaceAlpha', 0.2)
end

function drawPilot(pilot)
% draws the pilot of the plane, given the data of the pilot
     plx = 28;
     ply = 0;
     plz = 12.5;
     plsc = 1.6;
     rsurf(pilot.xx*plsc+plx, pilot.yy*plsc+ply, pilot.zz*plsc+plz, pilot.clr);
end

function drawWheels(wheel)
% draws the wheels of the plane, given the data of a single wheel
     whx = 32;
     why = 8;
     whz = -3;
     rsurf(wheel.xx+whx,  wheel.yy+why, wheel.zz+whz, wheel.clr);
     rplot3([whx whx],[why 0], [whz 5],'k', 'LineWidth', 3)
     rsurf(wheel.xx+whx, -wheel.yy-why, wheel.zz+whz, wheel.clr);
     rplot3([whx whx],[-why 0], [whz 5],'k', 'LineWidth', 3)
     rwx = 2;
     rwz = 1;
     rsurf(wheel.xx/2+rwx, wheel.yy/2, wheel.zz/2+rwz, wheel.clr);
     rplot3([rwx rwx+4],[0 0], [rwz rwz+5],'k', 'LineWidth', 2)
end


function drawTail(wing)
% creates a tail based on a wing's data. Scales the wing down, and draws it
% as a tail to the plane.
     tailx = 5;
     taily = 0;
     tailz = 7;
     tailvz = 10;
     sc = 0.3;  % tail scale factor
     xsc = sc*3;  % tail scale factor
     rsurf(wing.xx*xsc+tailx,  wing.zz*sc+taily, wing.yy*sc+tailvz, wing.clr);
     rsurf(wing.xx*xsc+tailx,  wing.yy*sc+taily, wing.zz*sc+tailz, wing.clr);
     rsurf(wing.xx*xsc+tailx, -wing.yy*sc-taily, wing.zz*sc+tailz, wing.clr);
end

function drawWings(wing)
% draws the wings of the plane, given a single wing's data
     lowerx = 30;
     lowery = 0;
     lowerz = 5;
     upperx = lowerx + 2;
     upperz = lowerz + 12;
     rsurf(wing.xx+lowerx,  wing.yy+lowery, wing.zz+lowerz, wing.clr);
     rsurf(wing.xx+lowerx, -wing.yy-lowery, wing.zz+lowerz, wing.clr);
     rsurf(wing.xx+upperx,  wing.yy+lowery, wing.zz+upperz, wing.clr);
     rsurf(wing.xx+upperx, -wing.yy-lowery, wing.zz+upperz, wing.clr);
end

function drawBody
% function call to draw the body of the plane
     plane([6 5 9 14], [7 7 8 8], [])
     plane([7 7 8 8], [15 15 15 15], [])
     plane([3 4 10 13], [6 5 9 14], [1 8 9])
     plane([2 2 11 11], [3 4 10 13], [])
     plane([1 1 12 12], [2 2 11 11], [])
end

function plane(rear, front, nans)%Used in draw body to make a plane
    % helper function to draw the body of the plane
    global fx
    global fy
    global fz
    xx(:,1) = [fx(rear)  fx(rear(end:-1:1))   fx(rear(1))];
    xx(:,2) = [fx(front) fx(front(end:-1:1))  fx(front(1))];
    yy(:,1) = [fy(rear)  -fy(rear(end:-1:1))  fy(rear(1))];
    yy(:,2) = [fy(front) -fy(front(end:-1:1)) fy(front(1))];
    zz(:,1) = [fz(rear)  fz(rear(end:-1:1))   fz(rear(1))];
    zz(:,2) = [fz(front) fz(front(end:-1:1))  fz(front(1))];
    if length(nans) > 0
        xx(nans,:) = NaN;
    end
    [r, c] = size(xx);
    clr = zeros(r, c, 3);
    clr(:,:,2) = 0.4;
    rsurf(xx, yy, zz, clr);
end

function h = rsurf(xx, yy, zz, clr)
% An enhanced surf using rotation.  Output used for enhancement features of
% drawings.
    global rotation
    [r, c] = size(xx);
    P1(1,:) = reshape(xx, 1, r*c);
    P1(2,:) = reshape(yy, 1, r*c);
    P1(3,:) = reshape(zz, 1, r*c);
    P2 = rotation * P1;
    h = surf(reshape(P2(1,:),r,c), ...
         reshape(P2(2,:),r,c), ...
         reshape(P2(3,:),r,c), ...
         clr);
end

function rplot3(x, y, z, p1, p2, p3)
% An enhanced plot3 using rotation
    global rotation
    P1(1,:) = x;
    P1(2,:) = y;
    P1(3,:) = z;
    P2 = rotation * P1;
    plot3(P2(1,:),P2(2,:),P2(3,:),p1, p2, p3)
end

function pilot = makePilot
% Outputs an array that contains the data points for a pilot
    [pilot.xx, pilot.yy, pilot.zz] = sphere(20);
    [pr, pc] = size(pilot.xx);
    pilot.clr = zeros(pr, pc, 3);
    pilot.clr(:,:,1) = 0.5;
end

function w = makeWheel
% Outputs an array that contains the data points for a single wheel
    th = linspace(0, pi, 12);
    R = 2.5;
    r = 1;
    v = r .* sin(th);
    u = R + r .* cos(th);
    u(end) = 0;
    v(end) = r/2;
    v = [v -v(end:-1:1)];
    u = [u u(end:-1:1)];
    th = linspace(0, 2*pi);
    [uu, tth] = meshgrid(u, th);
    vv = meshgrid(v, th);
    w.yy = vv;
    rr = uu;
    w.xx = rr .* cos(tth);
    w.zz = rr .* sin(tth);
    [r, c] = size(w.xx);
    w.clr = zeros(r, c, 3);
end

function prop = makeProp
% Outputs an array that contains the data points for a propeller
    th = linspace(-pi, pi, 100);
    u = [1, 0, 2, 2];
    v = [ 0, 4, 12, 0];

    [xx, tth] = meshgrid(u, th);
    rr = meshgrid(v, th);
    [rows, cols] = size(xx);
    prop.clr = ones(rows, cols, 3)/1.5;
    wd = floor(100/15);
    for st = ceil(linspace(1, 300/4, 4))
       prop.clr(st:st+wd,:,:) = 0; 
    end
    prop.clr(1:wd,:,:) = 0;
    prop.xx = xx + 42.2;
    prop.yy = rr .* sin(tth);
    prop.zz = rr .* cos(tth) + 6.5;
end

function wing = makeWing()
% Outputs an array that contains the data points for a single wing
    th = linspace(0, pi);
    r = 1.1;
    g = 0.1;
    cx = sqrt(r.^2 - g.^2) - 1;
    cy = g;
    x = r.*cos(th) + cx;
    y = r.*sin(th) + cy;
    z = complex(x, y);
    w = z + 1./z;
    x = real(w);
    y = imag(w)/2;
    x = [x, x(end:-1:1)]*2;
    y = [y, -y(end:-1:1)]*3; 
    z = [0 35];
    [wing.xx, wing.yy] = meshgrid(x, z);
    wing.zz = meshgrid(y, z);
    [pr, pc] = size(wing.xx);
    wing.clr = zeros(pr, pc, 3);
    wing.clr(:,:,2) = 0.2;
end

function [minx, maxx] =  make_clouds
% Uses the number of faces defined above to draw clouds.  It outputs the
% minimum x-position and the maximium x-position
global cloud
global nc

    [cloud(1).xx, cloud(1).yy, cloud(1).zz] = sphere(nc);
    rn = rand(1,10);
    xscale = (40 * rn(1) + 40);
    cloud(1).xx = cloud(1).xx * xscale;
    cloud(1).yy = cloud(1).yy / 3 + 59;
    cloud(1).zz = cloud(1).zz * xscale * (0.5 * rn(2) + 0.5);
    cloud(1).clr = ones( nc+1, nc+1, 3);
    cloud(2) = cloud(1);
    xscale = (rn(3) + 0.5);
    zscale = (rn(5) + 0.5);
    cloud(2).xx = cloud(2).xx * xscale + (60 * rn(4) -30);
    cloud(2).zz = cloud(2).zz * zscale + (60 * rn(6) - 30);
    cloud(3) = cloud(1);
    xscale = (rn(7) + 0.5);
    zscale = (rn(9) + 0.5);
    cloud(3).xx = cloud(2).xx * xscale + (60 * rn(8) -30);
    cloud(3).zz = cloud(2).zz * zscale + (60 * rn(10) - 30);
    for ndx = 1:3
        it = cloud(ndx);
        mx(ndx) = max(max(it.xx)); 
        mn(ndx) = min(min(it.xx)); 
    end
    minx = min(mn);
    maxx = max(mx);
end

function draw_clouds(px, pz)
% Takes in a position of the cloud and draws it. Used after make_clouds
global cloud
    for it = cloud
     xv = it.xx+px;
     zv = it.zz+pz;
     s2 = surf(xv, it.yy, zv, it.clr);
     set(s2, 'FaceAlpha', 0.6)
    end
end
