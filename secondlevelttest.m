% Data vector
%beta values found based on GLMattempt2 code in variable workspace
%largely credited to ChatGTP
data = [112.0940089, 131.1307227, 166.1545144, 157.6840772, ...
        161.7310338, 155.4724805, 135.4332192, 144.437026, 190.9750555];
[h, p, ci, stats] = ttest(data, 0);
fprintf('t-statistic: %.3f\n', stats.tstat);
fprintf('Degrees of freedom: %.0f\n', stats.df);
fprintf('p-value: %.4f\n', p);
fprintf('Confidence interval: [%.3f, %.3f]\n', ci(1), ci(2));

if h == 1
    disp('The test rejects the null hypothesis at the 5% significance level.');
else
    disp('The test does not reject the null hypothesis at the 5% significance level.');
end