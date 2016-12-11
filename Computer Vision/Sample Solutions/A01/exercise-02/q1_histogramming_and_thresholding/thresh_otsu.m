function res = thresh_otsu(img)

	hist = histogram(img);
	cumulative_histogram = cumsum(hist);

	minT = floor(max(2, min(img(:))));
	maxT = ceil(max(img(:)));
	N = cumulative_histogram(end);
	sig_btw = zeros(1, maxT);

	for T = minT:maxT,
		% get the number pixels in each cluster
		n1 = cumulative_histogram(T-1);
		n2 = N-n1;

		% get the cluster means
		my1 = weighted_mean(hist,1,T-1);
		my2 = weighted_mean(hist,T,maxT);

		% compute sigma_between
		sig_btw(T) = n1*n2*(my1-my2)^2;
	end

	[Smax, Tmax] = max(sig_btw);
	res = thresh(img, Tmax(1)-1);
			 	 
end
