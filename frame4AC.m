function [origin, x_axis, y_axis, z_axis] = frame4AC(AcLeft, AcRight,ZGravity1,ZGravity2)

% Calculate the average points for AcLeft and AcRight
avg_AcLeft = mean(AcLeft);
avg_AcRight = mean(AcRight);
avg_ZGravity1 = mean(ZGravity1);
avg_ZGravity2 = mean(ZGravity2);
% disp the results of average points
disp(['avg_AcLeft: ', num2str(avg_AcLeft)]);
disp(['avg_AcRight: ', num2str(avg_AcRight)]);
disp(['avg_ZGravity1: ', num2str(avg_ZGravity1)]);
disp(['avg_ZGravity2: ', num2str(avg_ZGravity2)]);

% ---> Compute the Center
origin = (avg_ZGravity1 + avg_ZGravity2 + avg_AcLeft + avg_AcRight)/4; 
% compute the x_axis
Vx = avg_AcRight - origin;
normVx  = sqrt(Vx(:,1).^2 + Vx(:,2).^2 + Vx(:,3).^2);
x_axis = Vx ./ normVx;
% compute the z_axis by using its projection towards the plane
% which is defined by the origin, avg_AcLeft and avg_AcRight
planeNormal = cross(avg_AcRight - origin, avg_AcLeft - origin);
planeNormal = planeNormal / norm(planeNormal); 
distance_to_plane = dot(avg_ZGravity2 - origin, planeNormal);
nearest_point_on_plane = avg_ZGravity2 - distance_to_plane * planeNormal;
z_axis = nearest_point_on_plane - avg_ZGravity2;
z_axis = - z_axis / norm(z_axis); 
% compute the y_axis
Vy = cross(x_axis,z_axis); 
normVy = sqrt(Vy(:,1).^2 + Vy(:,2).^2 + Vy(:,3).^2); 
y_axis = Vy ./ normVy; 

end
