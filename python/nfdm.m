function retVal = nfdm(fstr, ystr, a, b, h, Alpha, Beta)
	syms x u v 
	% f = symfun((1/8)*(32 + 2*x^3 - u*v), [x, u, v]); % define f(x,y,y')
	% a = 1; b = 3; h = .1; Alpha = 17; Beta = 43/3; %parameters
	% y = symfun(x^2 + 16/x, x); % define actual solution equation
	f =  symfun(str2sym(fstr), [x, u, v]);
	y = symfun(str2sym(ystr), x);
	iterations = 10; %total number of iterations
	xi = a:h:b; % x values
	n = length(xi); % value for n for this function

	w0 = symfun(Alpha + (Beta-Alpha)/(b-a)*(x - a), x); % define initial approximation linear equation
	wi(:,1) = double(w0(xi)); % define initial approximation

	W = sym('w', [1 n]); %declare vector of symbolic variables for w0, w1, w2,...,wn+1
	F = sym(zeros(n-2,1)); % declare vector of symbolic functions Fi

	for i=3:n-2 % this loop will create Fi functions
		F(i-1) = symfun(-W(i-1) + 2*W(i) - W(i+1) + (h^2)*f(xi(i), W(i), (W(i+1) - W(i-1))/(2*h)),[W(i-1), W(i), W(i+1)]);
	end

	%initialize the first and last Fi functions
	F(1) = symfun(2*W(2)- W(3) +  (h^2)*f(xi(2), W(2), (W(3) - Alpha)/(2*h)) - Alpha,[W(2), W(3)]);
	F(n-2) = symfun(-W(i) + 2*W(i+1) +  (h^2)*f(xi(i+1), W(i+1), (Beta - W(i))/(2*h)) - Beta,[W(i), W(i+2)]);

	for i =1:iterations % this loop finds all the approximations 
		Jw = double(subs(jacobian(F, W),W ,wi(:,i)')); %find the jacobian matrix and plug in wi
		Fw = double(subs(F, W, wi(:,i)')); % plug in wi into Fi
		wi(:,i+1) = wi(:,i) -  Jw\Fw; % find next approximation
	end

	retVal = {xi, wi(:,i)', double(y(xi))};
end