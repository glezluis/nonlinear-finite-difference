import matlab.engine

ml = matlab.engine.start_matlab()

fstr = '(1/8)*(32 + 2*x^3 - u*v)'
ystr = 'x^2 + 16/x'
a = 1
b = 3
h = .1
α = 17
β = 43/3
sol = ml.nfdm(fstr, ystr, a, b, h, α, β)


x, w, y = tuple(sol)
print(type(x), type(w), type(y))


for xi, wi, yi in zip(x[0], w[0], y[0] ) :
	print(xi, wi, yi)