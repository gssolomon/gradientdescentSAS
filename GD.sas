/*Creating the Gradient Descent Algorithm to Calculate theta0 and theta1.*/

proc iml;
/*Creating a dataset for living area and corresponding housing prices.*/
	dataset = {	2104 400000,
				1600 330000,
				2400 369000,
				1416 232000,
				3000 540000,
				1500 254000,
				2112 311200,
				1410 220000,
				1110 123000,
				4500 540000,
				5714 591000,
				3600 421000,
				3800 380020};
	
	theta = {0.5, 
			1.5};   /*Taking some initial values of theta0 and theta1.*/
	alpha = {0.0001}; /*Taking value of learning rate.*/
	length = nrow(dataset);
	h = j(length, 1, 0); /*Creating a matrix for calucating hypothesis function h(x)*/
	do i=1 to nrow(dataset);
		h[i,1] = theta[1,1] + (theta[2,1]*dataset[i,1]);
	end;
	
	
	/*----------Calculating theta0 and theta1---------*/

	l = j(2, 1, 0);
	do i=1 to nrow(dataset);
		l[1,1] = l[1,1] + (h[i,1] - dataset[i,1]);
		l[2,1] = l[2,1] + (h[i,1] - dataset[i,1])*dataset[i,1];
	end;
	print l;
	
	temp0 = j(1,1,0);
	temp1 = j(1,1,0);

	do i=1 to 1000;
		temp0 = theta[1,1] - (alpha[1,1] * l[1,1] / length);
		temp1 = theta[2,1] - (alpha[1,1] * l[2,1] / length);

		theta[1,1] = temp0[1,1];
		theta[2,1] = temp1[1,1];
	end;

	/*Printing the values.*/
	print h;
	print theta;
	print dataset;
quit;



