function [angle_z, angle_x, angle_y, R_z, R_x, R_y, R] = calculate_rotation_angles(x_axis, y_axis, z_axis)
  
    Z = [0, 0, 1];
    X = [1, 0, 0];
    Y = [0, 1, 0];

    % Calculate the rotation angle and rotation matrix relative to the Z axis
    angle_rad_z = acos(dot(Z, z_axis) / (norm(Z) * norm(z_axis)));
    angle_z = rad2deg(angle_rad_z);
    direction_z = cross(Z, z_axis);
    if direction_z(3) > 0
        angle_z = -angle_z;
    end
    R_z = axang2rotm([direction_z, angle_rad_z]);

    % Rotate the x_axis vector after rotation about the Z axis
    x_axis_rotated = R_z * x_axis';

    % Calculate the rotation angle and rotation matrix relative to the X axis
    angle_rad_x = acos(dot(X, x_axis_rotated) / (norm(X) * norm(x_axis_rotated)));
    angle_x = rad2deg(angle_rad_x);
    direction_x = cross(X, x_axis_rotated);
    if direction_x(3) < 0
        angle_x = -angle_x;
    end
    R_x = axang2rotm([direction_x, angle_rad_x]);

    % Rotate the y_axis vector after rotation about the X and Z axes
    y_axis_rotated = R_x * R_z * y_axis';

    % Calculate the rotation angle and rotation matrix relative to the Y axis
    angle_rad_y = acos(dot(Y, y_axis_rotated) / (norm(Y) * norm(y_axis_rotated)));
    angle_y = rad2deg(angle_rad_y);
    direction_y = cross(Y, y_axis_rotated);
    if direction_y(1) > 0
        angle_y = -angle_y;
    end
    R_y = axang2rotm([direction_y, angle_rad_y]);

    % Calculate the combined rotation matrix R = Rz * Rx * Ry
    R = R_z * R_x * R_y;
    disp(R);
    disp(['Z rotation angle：', num2str(angle_z)]);
    disp(['X rotation angle：', num2str(angle_x)]);
    disp(['Y rotation angle：', num2str(angle_y)]);
end
