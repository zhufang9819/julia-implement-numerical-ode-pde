% Set domain
L = 1.0;
N = 100;
x = linspace(0, L, N);

% Set initial and boundary conditions
u0 = sin(2*pi*x);

% Set time step
dt = 0.1;

% Define ODE problem
prob = ode23(@heat_eqn, [0, 1], u0, [], x);

% Extract time values and solution
t = prob.x;
u = prob.y';

% Solve ODE using MOL and RK4 method
for i = 2:length(t)
    u(i,:) = rk4(@heat_eqn, t(i-1:i), u(i-1,:), dt, x);
end

% Plot solution
plot(t, u(:, 1), 'xlabel', 'Time', 'ylabel', 'Temperature', 'title', 'Solution of 1D Heat Equation');
