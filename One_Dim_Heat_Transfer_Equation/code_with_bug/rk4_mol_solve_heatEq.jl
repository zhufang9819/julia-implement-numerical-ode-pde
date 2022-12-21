using DifferentialEquations, Plots, FileIO

## We attempt to solve the one-dimensional heat eqation ##
## \frac{\partial u}{\partial t} = \alpha {\partial^2 u}{\partial x^2} ##
## the boundary condition for the one-dimensional heat equation is implemented using periodic boundary conditions. 
## This means that the solution is assumed to be periodic in space, 
## so the temperature at the first grid point is assumed to be equal to the temperature at the last grid point.

function heat_eqn(du, u, p, t)
    # Extract spatial grid
    x = p[2] # p = [alpha, x]

    # Compute second spatial derivative using finite differences
    du[1] = (u[2] - 2*u[1] + u[end])/(x[2] - x[1])^2
    
    for i in 2:(length(x))-1
        du[i] = (u[i+1] - 2*u[i] + u[i-1]) / (x[2] - x[1])^2
    
    du[end] = (u[1] - 2*u[end] + u[end-1])
    end

    # Multiply by thermal diffusivity to obtain time derivative
    alpha = p[1]
    du .*= alpha

end

# Define the spatial grid
x = range(0, stop=1, length=100)

# Define initial condition
u0 = ones(100)

# Set thermal diffusivity
alpha = 0.1

# Parameters of the equation
p = [alpha, x]

# Define the ODE problem
prob = ODEProblem(heat_eqn, u0, (0.0, 1.0), p)

# Solve ODE using RK method
sol = solve(prob, RK4())

# Extract temperature at final time
t_final = sol.t[end]
u_final = sol.u[end]

# Plot temperature vs. position
final_sol_fig = plot(x, u_final, xlabel="Position (m)", ylabel="Temperature (K)")
save("heat_sol_final.png", final_sol_fig)


# Animate temperature vs. position
# anim = animate(x, sol.u, xlabel="Position (m)", ylabel="Temperature (K)")

# Create empty list of plots
plots = []

# Extract time values and solution
t = sol.t
u = sol.u

# Iterate over time steps
for i in 1:length(t)
    # Extract solution at time t[i]
    u_i = u[i, :]
    
    # Create plot of solution
    pp = plot(x, u_i, xlabel="Position", ylabel="Temperature")
    
    # Add plot to list
    push!(plots, pp)
end

# Animate plots
anim = animate(plots)

# Save animation to file
save("heat_animation.gif", anim, duration=1/24)






