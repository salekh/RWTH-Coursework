function res = thresh_niblack(img, r, k)
	res = zeros(size(img));

	for y = 1:size(img, 1)
		for x = 1:size(img, 2)

			[m, v] = get_window_mean_var(img, x, y, r);
			T = m + k*sqrt(v);
			if img(y, x) >= T
				res(y, x) = 1;
			end
		end
 			  
	end

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% Alternative implementation (very fast and without loops)
	%
	% wsize = 2 * r + 1;
	% m = filter2(ones(wsize), img)/(wsize*wsize); % local mean
	% v = filter2(ones(wsize), img.^2)/(wsize*wsize) - m.^2; % local variance
	% s = sqrt(v); % standard deviation
	% T = m + k * s; % Niblack's local threshold selection method
	% res = (img > T);
end
