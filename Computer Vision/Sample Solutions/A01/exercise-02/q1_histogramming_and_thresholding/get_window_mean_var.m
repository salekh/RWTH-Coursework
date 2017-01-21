function [m, v] = get_window_mean_var(img, x, y, r)

	% get the window limits
	[height, width] = size(img);
	minX = max(1, x - r);
	minY = max(1, y - r);
	maxX = min(width, x + r);
	maxY = min(height, y + r);

	% reshape the window into a vector
	win = img(minY:maxY, minX:maxX);
	vec = reshape(win, 1, size(win, 1) * size(win, 2));

	% compute the local mean and variance
	m = mean(vec);
	v = var(vec);
		   	
end

