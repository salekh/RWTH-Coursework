function imgEdge = getedges(img, sigma, theta)

	[imgMag,imgDir] = gradmag(img, sigma);
	
	% compare the gradient magnitude image to the threshold theta
	imgEdge = uint8(imgMag >= theta);
				  
end
