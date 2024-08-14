figure;
plot(Yglm, 'o', 'MarkerSize', 5, 'MarkerFaceColor', 'b');  % Original data in blue
hold on;
plot(Y, 'r-', 'LineWidth', 2);  % Fitted values in red
hold off;

title('GLM Fit');
xlabel('Time Points');
ylabel('Yglm and Fitted Y');
legend('Original Data (Yglm)', 'GLM Fit (Yfit)');
grid on;