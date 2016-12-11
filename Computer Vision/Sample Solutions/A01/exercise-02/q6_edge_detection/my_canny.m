function edge_image = my_canny(img, sigma, theta_low, theta_high)

	global visited;
	global img_res;
	img_res = zeros(size(img));

	% Filter image with derivative of Gaussian to get gradient magnitudes
	[imgMag, imgDir] = gradmag(img, sigma);

	% Perform non-maximum suppression
	imgMax = nonmaxsupcanny(imgMag, imgDir);

	% compute the maximal value in the image
	maxval = max(imgMax(:));

	% define the threshold relative to this value
	theta_low = theta_low * maxval;
	theta_high = theta_high * maxval;

	% Initialize flags
	visited = imgMax < theta_low; % Declare all pixels below the low threshold as visited
	high = imgMax >= theta_high;
 	  	 
	% Create boundary around visited flag
	visited(:,1) = true;
	visited(:,end) = true;
	visited(1,:) = true;
	visited(end,:) = true;

	% Start at the high pixels and follow the edges
	for x=1:size(high,1)
		for y=1:size(high,2)
			if((high(x, y) == true) && (visited(x, y) == false))
				follow_edge(x, y);
			end
		end
	end

	edge_image = img_res;
 	  	 
end
