import matlab.engine
from tkinter import *
from sympy import sympify

ml = matlab.engine.start_matlab()

def run():
	vals = ()
	for i in range(len(entries)):
		buff = entries[i].get()
		if i > 1:
			buff = float(sympify(buff))
		vals += (buff,)

	fstr, ystr, a, b, h, α, β = vals
	x, w, y = tuple(ml.nfdm(fstr, ystr, a, b, h, α, β))

	for xi, wi, yi in zip(x[0], w[0], y[0]):
		print(xi, wi, yi)


root = Tk()
height = 300
width = 600
root.minsize(width, height)

params = ['f(x,y,y\')', 'y', 'a', 'b', 'h', 'α', 'β']

Label(root, text='Nonlinear Finite difference method').grid(row=0, columnspan=width, sticky=W)

for i in range(len(params)):
	lstr = ' %s = ' % params[i]
	Label(root, text=lstr).grid(row=i+1,column=0, sticky=E)

entries = []
for i in range(len(params)):
	w = [25, 5][i > 1]
	entries.append(Entry(root, width=w))
	entries[i].grid(row=i+1, column=1, sticky=W)

Button(root, text='run', command=run).grid(row=i+2, column=1, sticky=E)

mainloop()