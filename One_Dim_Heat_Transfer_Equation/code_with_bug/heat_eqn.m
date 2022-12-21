% Define heat equation
function dudt = heat_eqn(t, u, x)
    dudt = (u(2) - 2*u(1) + u(end)) / (x(2) - x(1))^2;
end