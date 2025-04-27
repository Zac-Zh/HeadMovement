function visualizeMotionAndVelocity(points)
    % points is a 407x3 matrix where each row represents the coordinates of a point at a time step

    % Get the number of time steps
    num_steps = size(points, 1);

    % Create a new figure window
    figure;

    % Plot X coordinate motion
    subplot(3, 2, 1);
    plot(1:num_steps, points(:, 1));
    title('X Coordinate Motion');
    xlabel('Time Step');
    ylabel('X Coordinate');

    % Plot Y coordinate motion
    subplot(3, 2, 2);
    plot(1:num_steps, points(:, 2));
    title('Y Coordinate Motion');
    xlabel('Time Step');
    ylabel('Y Coordinate');

    % Plot Z coordinate motion
    subplot(3, 2, 3);
    plot(1:num_steps, points(:, 3));
    title('Z Coordinate Motion');
    xlabel('Time Step');
    ylabel('Z Coordinate');

    % Compute velocity
    velocity = sqrt(sum(diff(points).^2, 2));

    % Plot velocity
    subplot(3, 2, 4);
    plot(1:num_steps-1, velocity);
    title('Velocity');
    xlabel('Time Step');
    ylabel('Velocity');

    % Compute total distance from the origin (or starting point)
    total_distance = sqrt(sum(points.^2, 2));

    % Plot total distance
    subplot(3, 2, [5, 6]);
    plot(1:num_steps, total_distance);
    title('Total Distance from Origin');
    xlabel('Time Step');
    ylabel('Total Distance');

    % Adjust layout
    sgtitle('Motion, Velocity, and Total Distance Over Time');

    % Save the graph (optional)
    % saveas(gcf, 'motion_velocity_distance.png');
end
