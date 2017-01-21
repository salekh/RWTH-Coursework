function imgEdge = getedges2(img, sigma, theta)

	[imgMag,imgDir] = gradmag(img, sigma);

	% perform non-maximum suppression
	imgMag = nonmaxsupcanny(imgMag, imgDir);

	% compute the maximal value in the image
	maxval = max(imgMag(:));

	% define the threshold relative to this value
	theta = theta * maxval;

	% compare the gradient magnitude image to the threshold theta
	imgEdge = uint8(imgMag >= theta);
		 	 	
end
