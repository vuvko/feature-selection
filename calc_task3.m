run task3.m

log_file = "task3.log";
fid = fopen(log_file, "a");

iters = 10;
load task3.out opt;
min = cost_func(opt, X, y);

while (1)
	start_time = time();
	fprintf("---------------\n");
	fprintf("Calculating with max %d iterations\n", iters);
	fprintf("---------------\n");
	
	fprintf(fid, "---------------\n");
	fprintf(fid, "Start caclulation with %d iterations at %s", iters, ctime(start_time));

	run find_opt.m
	end_time = time();

	fprintf(fid, "End calculation at %s\n", ctime(end_time));

	if cost_func(opt, X, y) < min
		fprintf("*************\n");
		fprintf("New minimum - %.4f\n", m);
		fprintf("*************\n");
		
		fprintf(fid, "Found new minimum - %.4f\n", m);
	
		save task3.out opt;
		min = m;
	endif;
	calc_time = gmtime(end_time - start_time);
	fprintf(" ]| Done calculations in %d s %d m, %d h\n", ...
	    calc_time.sec, calc_time.min, calc_time.hour);
	fprintf(fid, "Done calculations in %d s %d m, %d h\n", ...
	    calc_time.sec, calc_time.min, calc_time.hour);
	fprintf(fid, "---------------\n");
	fflush(stdout);
	fflush(fid);
	
	%iters = iters + 10;
end;
	
fclose(fid);