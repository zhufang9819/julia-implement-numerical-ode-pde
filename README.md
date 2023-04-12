## Julia Implement Numerical Differential Equations
### 0. Brief Introduction
Julia Implementation of some numerial ode/pde methods with examples.


### 1. ODE

#### 1.1 Euler Methods
- Add Forward Euler. (Completed) 
- Add Backward(Implicit) Euler. (Completed, maybe need to give a non-stiff problem with fixed point method)
- Add Improved Euler. (Completed)
- Add Modified Euler. (Completed, A "simple version" of Runge-Kutta)
#### 1.2 Runge-Kutta Methods
- Add 4th Order Runge Kutta. (Completed)
- Add Adaptive Runge Kutta (RK23). (Completed)
#### 1.3 Multistep Methods
- Add 4th-order Adams–Bashforth. (Completed)
- Add 2th-order Adams-Moulton. (Completed)
- Add a stiff problem example to test the AB4 (explicit) vs AM2 (implicit).

### 2. PDE
#### 2.1 Finite difference method
#### 2.2 Finite volume method
#### 2.3 Finite element method
#### 2.4 Spectral methd
### 3. Examples
1. How to use *Method of Lines* and *4th Order Runge Kutta* to solve one-dimensional heat transfer equations. (Completed)
2. How to use *Forward Euler Method* to solve ode systems. (Completed)
3. How to use `solve` to solve *FitzHugh-Nagumo* model. (Completed)


### Note
- We first solve the *[Initial Value Problem](https://en.wikipedia.org/wiki/Initial_value_problem#:~:text=In%20multivariable%20calculus%2C%20an%20initial,solving%20an%20initial%20value%20problem.)* (which we also call *Cauchy Initial Value Problem*). 
- We define the Initial Value Problem by the library [DifferentialEquations.jl](https://docs.sciml.ai/DiffEqDocs/stable/) rather than define from scratch.

### Acknowledgement
- Some of the examples and code in this repository are derived from [ Fundamentals of Numerical Computation](https://tobydriscoll.net/fnc-julia/frontmatter.html), which is an outstanding resource for scientific computing. It not only provides comprehensive content, but also offers clear explanations and reliable `Julia` implementations.