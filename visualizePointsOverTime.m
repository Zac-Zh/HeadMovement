function visualizePointsOverTime(points)
    % points is a 407x3 matrix where each row represents the coordinates of a point at a time step

    % Get the number of time steps
    num_steps = size(points, 1);

    % Create a new figure window
    figure;

    % Define color gradient as rainbow colors
    gradient_colors_rainbow = jet(num_steps);

    % Plot the points at each time step with rainbow color gradient
    for t = 1:num_steps
        % Get color based on rainbow gradient
        color = gradient_colors_rainbow(t, :);
        
        % Plot the point with the computed color and smaller size
        scatter3(points(t,1), points(t,2), points(t,3), 20, color, 'filled'); % Change the last argument (20) to adjust the size of the points
        hold on;
    end

    % Plot the trajectory by connecting consecutive points
    for t = 1:num_steps-1
        plot3(points(t:t+1,1), points(t:t+1,2), points(t:t+1,3), '-', 'Color', [0.5, 0.5, 0.5]);
    end

    % Set the title and axis labels of the graph
    title('Trajectory Over Time (Rainbow Gradient)');
    xlabel('X');
    ylabel('Y');
    zlabel('Z');

end
