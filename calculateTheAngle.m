function calculateTheAngle(origin, head)
angles = zeros(406, 1);
start_point = head(1, :);
initial_vector = start_point - origin;
for i = 2:407
    current_point = head(i, :);
    current_vector = current_point - origin;
    
    % use dot to calculate the angle
    dot_product = dot(initial_vector, current_vector);
    cos_angle = dot_product / (norm(initial_vector) * norm(current_vector));
    
    % judge the type of angle
    if dot_product > 0
        % acute angle
        angles(i-1) = acosd(cos_angle);
    else
        % Obtuse angle
        angles(i-1) = 180 - acosd(cos_angle);
    end
end

% plot
time = 1:406;
plot(time, angles);
xlabel('Time');
ylabel('Angle (degrees)');
title('Angle between initial vector and subsequent vectors over time');
end
