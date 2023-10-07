using Plots
using Plots.PlotMeasures
using .SymRegMethods

bronze_data = load_data("data/bronze.txt")

expr = random_expression()

x_values = [x for (x, y) in bronze_data]
y_values = [y for (x, y) in bronze_data]
y_values_pred = evaluate_expr(expr, x_values)
mse = mean_squared_error(y_values, y_values_pred)
mse = round(mse, digits=2)

# plot the data
plot(x_values, y_values, label="Actual Data (Bronze)",lw=3)
plot!(x_values, y_values_pred, label="Predicted Data",lw=3)
xlabel!("X")
ylabel!("Y")
annotate!(0.5, 15, text("Expression: $expr", 9, :left))
plot!(left_margin = 20px, topmargin = 15px, ylim=(-18, 25))
title!("\nMean Squared Error: $mse", titlefontsize=12)
