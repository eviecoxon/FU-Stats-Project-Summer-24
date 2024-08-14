%based on previous with group level
% Data vector (first column only)
data = [95.071862979024940;
        116.0968000004990;
        141.2634366887351;
        123.3303665622995;
        107.8699554691243;
        134.1445707504457;
        128.4112033816402;
        122.4923133625708;
        152.6184532704320];

% Perform one-sample t-test on the first column
[h, p, ci, stats] = ttest(data, 0);

% Display the results
fprintf('t-statistic: %.3f\n', stats.tstat);
fprintf('Degrees of freedom: %.0f\n', stats.df);
fprintf('p-value: %.4f\n', p);
fprintf('Confidence interval: [%.3f, %.3f]\n', ci(1), ci(2));

if h == 1
    disp('The test rejects the null hypothesis at the 5% significance level.');
else
    disp('The test does not reject the null hypothesis at the 5% significance level.');
end