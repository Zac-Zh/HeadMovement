function head = Computingthehead(R, TH1, TH2, TH3, TH4)
    % compute the average point O representing head
    head.O = (TH1 + TH2 + TH3 + TH4) / 4;

    % time step
    num_steps = size(TH1, 1);

    % compute the coodinate of head after rotation
    head.O_rotated = zeros(num_steps, 3);

    % for each time
    for t = 1:num_steps
        head.O_rotated(t, :) = R * head.O(t, :)';
    end
end
