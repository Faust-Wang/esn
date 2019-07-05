flight_data = csvread('flight_data_pitch.csv');
plot(flight_data, 'k', 'LineWidth', 3);
hold;
plot(flight_data, 'k');

xlabel('Time (s)', 'FontSize', 24);
ylabel('Pitch Doublet', 'FontSize', 24);

%ylabel('Input Signal vs Teacher Signal (Roll)');
%legend('teacher signal: d(n)', 'output signal: y(n)');

%x = [0, 0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5];
%y = [57,57,57,57,57,57,57,57,57,57,57];
%plot(x, y, 'k', 'LineWidth', 3);

%a = [-0.5572,-0.7814;0.7814,0];
%b = [1,-1;0,3];
%c = [2,7];
%sys = ss(a,b,c,0);
%step(sys)