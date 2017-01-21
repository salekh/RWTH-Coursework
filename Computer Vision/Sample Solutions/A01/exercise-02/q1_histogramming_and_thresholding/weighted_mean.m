function wm = weighted_mean(vec, rmin, rmax)

	range = rmin:rmax;
	wm = sum(vec(range).*range)/sum(vec(range));
					 
end
