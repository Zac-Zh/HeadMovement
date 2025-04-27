function plotAnatomicalThorax(x_axis, y_axis, z_axis, Origin, AcLeft, AcRight, ZGravity1, ZGravity2)
    % Create a new figure window
    figure;

    % Calculate average points for AcLeft, AcRight, ZGravity1 & ZGravity2
    avg_AcLeft = mean(AcLeft);
    avg_AcRight = mean(AcRight);
    avg_ZGravity1 = mean(ZGravity1);
    avg_ZGravity2 = mean(ZGravity2);

    % Plot the Origin point
    hold on;
    plot3(Origin(1), Origin(2), Origin(3), 'ro', 'MarkerSize', 8);

    % Plot the average AcLeft point
    plot3(avg_AcLeft(1), avg_AcLeft(2), avg_AcLeft(3), 'mo', 'MarkerSize', 8, 'MarkerFaceColor', 'm');

    % Plot the average AcRight point
    plot3(avg_AcRight(1), avg_AcRight(2), avg_AcRight(3), 'co', 'MarkerSize', 8, 'MarkerFaceColor', 'c');

    % Plot the average ZGravity1 point
    plot3(avg_ZGravity1(1), avg_ZGravity1(2), avg_ZGravity1(3), 'yo', 'MarkerSize', 8, 'MarkerFaceColor', 'y');

    % Plot the average ZGravity2 point
    plot3(avg_ZGravity2(1), avg_ZGravity2(2), avg_ZGravity2(3), 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'b');

    % Plot x-axis
    quiver3(Origin(1), Origin(2), Origin(3), ...
        x_axis(1), x_axis(2), x_axis(3), 'r', 'LineWidth', 2, 'MaxHeadSize', 0.5);

    % Plot y-axis
    quiver3(Origin(1), Origin(2), Origin(3), ...
        y_axis(1), y_axis(2), y_axis(3), 'g', 'LineWidth', 2, 'MaxHeadSize', 0.5);

    % Plot z-axis
    quiver3(Origin(1), Origin(2), Origin(3), ...
        z_axis(1), z_axis(2), z_axis(3), 'b', 'LineWidth', 2, 'MaxHeadSize', 0.5);

    % Label Origin point
    text(Origin(1), Origin(2), Origin(3), ' Origin', 'HorizontalAlignment', 'right');

    % Label average AcLeft point
    text(avg_AcLeft(1), avg_AcLeft(2), avg_AcLeft(3), ' avg\_AcLeft', 'HorizontalAlignment', 'right');

    % Label average AcRight point
    text(avg_AcRight(1), avg_AcRight(2), avg_AcRight(3), ' avg\_AcRight', 'HorizontalAlignment', 'right');

    % Label average ZGravity1 point
    text(avg_ZGravity1(1), avg_ZGravity1(2), avg_ZGravity1(3), ' avg\_ZGravity1', 'HorizontalAlignment', 'right');

    % Label average ZGravity2 point
    text(avg_ZGravity2(1), avg_ZGravity2(2), avg_ZGravity2(3), ' avg\_ZGravity2', 'HorizontalAlignment', 'right');

    % Set legend and labels
    legend('x axis', 'y axis', 'z axis', 'Location', 'northoutside');
    xlabel('X');
    ylabel('Y');
    zlabel('Z');

    axis equal;
    grid on;
    
    all_points = [Origin; avg_AcLeft; avg_AcRight; avg_ZGravity1; avg_ZGravity2];
    axis([min(all_points(:,1)) , max(all_points(:,1)) , ...
          min(all_points(:,2)) , max(all_points(:,2)) , ...
          min(all_points(:,3)) , max(all_points(:,3)) ]);
    hold off;
end
