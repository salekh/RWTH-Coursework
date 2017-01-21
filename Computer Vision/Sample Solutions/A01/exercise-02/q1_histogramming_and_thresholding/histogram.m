function hist = histogram(img)
	nbins=256;
	hist = zeros(1, nbins);

	for y = 1:size(img, 1)
		for x = 1:size(img, 2)
			idx = round(img(y, x)) + 1;
			hist(idx) = hist(idx) + 1;
		end
	end
	   	 
end
