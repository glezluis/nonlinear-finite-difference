# nonlinear-finite-difference
This Matlab script will solve bounded problems for non-linear differential equations. It solves by using Newton's method for iteration. All programs found for solving these were done by explecity inputing each line of code for different examples. This program uses symbolic functions in Matlab and the Jacobian command. It can solve for any  non-linear differential equations ```f(x,y,y')``` given an interval ```[a,b]```, change in x ```h```, and bounds ```y(a) = alpha``` and ```y(b) = beta```. 

## Prerequisites 
Matlab must be installed on This script will on Matlab R2017b and newer but has not been tested on older versions. 

# Usage
First Download the repository to a local folder 
```
$ git clone https://github.com/glezluis/nonlinear-finite-difference.git
```
## Parameters 

The following lines are the paramaters for the differential equation and program. You can change them to run a different example
```
5   f = symfun((1/8)*(32 + 2*x^3 - u*v), [x, u, v]); % define f(x,y,y')
6   a = 1; b = 3; h = .1; Alpha = 17; Beta = 43/3; %parameters
7   y = symfun(x^2 + 16/x, x); % define actual solution equation
8
9   iterations = 4; %total number of iterations
```
They can be changed 

## On Matlab
Open the file with matlab and run 
```
>> newtons_nonlinear
```
## On Linux command line
1. Navigate to the cloned repository.
2. Run matlab on the command line
```
$ matlab -nojvm -nodisplay -nosplash
```
3. Run the script
```
>> newtons_nonlinear
```
Once the scritpt is ran it will display the following table
```
     x            w                   y                 difference
    ___    ________________    ________________    ____________________

      1                  17                  17                       0
    1.1    15.7545025348806    15.7554545454545    0.000952010573993078
    1.2    14.7717396528941    14.7733333333333     0.00159368043923358
    1.3    13.9956774363522    13.9976923076923     0.00201487134010492
    1.4    13.3862965613205    13.3885714285714     0.00227486725093051
    1.5     12.914252412004    12.9166666666667     0.00241425466264999
    1.6    12.5575382273176               12.56     0.00246177268238412
    1.7    12.2993262825566    12.3017647058824     0.00243842332579014
    1.8    12.1265288673655    12.1288888888889     0.00236002152343318
    1.9    12.0288138100689    12.0310526315789     0.00223882151005661
      2    11.9979154223669                  12     0.00208457763314129
    2.1    12.0271423706924    12.0290476190476     0.00190524835526418
    2.2    12.1110198035408    12.1127272727273      0.0017074691864547
    2.3    12.2450248665952    12.2465217391304     0.00149687253528086
    2.4    12.4253883624251    12.4266666666667     0.00127830424155384
    2.5    12.6489440305196               12.65     0.00105596948036712
    2.6    12.9130126236737    12.9138461538462     0.00083353017246246
    2.7    13.2153117565926    13.2159259259259    0.000614169333314152
    2.8    13.5538850809074    13.5542857142857    0.000400633378312421
    2.9    13.9270461189438    13.9272413793103    0.000195260366577799
      3    14.3333333333333    14.3333333333333                       0

```
```x```: the values for x. 

```w```: the approximation for y

```y```: the values for the actual solutions for y

```difference```: the absolute value for the diffrence between w and y

