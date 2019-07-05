% number of epoch periods (training iterations)
t = 10;

% current epoch period
i = 1;

% number of nurons
n = 5;

% number of input signals
k = 1;

% number of output signals
l = 1;

leak_rate = 0.4;

% percentage of connected neurons
sparsity = 0.10;

% get flight parameters
run('setup_flight_params');

% initialize flight data
flight_data = get_flight_data();

% generate teacher signal (nxl)
d = generate_teacher_signal(l,t);
%d(i) = flight_data(roll,i);
%d(i+1) = flight_data(roll,i);
%d(i+2) = flight_data(roll,i);

d(i) = 60;
d(i+1) = 60;
d(i+2) = 60;

% generate input signal
u = generate_input_signal(t,k);

% generate output signal
y = generate_output_signal(t,l);

% input weight matrix
w_in = rand(n,k);

% feedback weight matrix
w_fb = rand(n,l);

% reservior weight matrix
w = sprand(n, n, sparsity);

% setup reservior matrix
x = zeros(n,t);

%setup w_out
w_out = [];

for train=1:10 % run the training algorithm for 3 epochs
    x(:,i) = recompute_reservior(u, w_in, x, w, y, w_fb, i);

    % harvest neurons into an extended system state matrix
    z = [x(1:n,i);u(i)];

    % create collection matrices
    S = transpose(z); % fill z row-wise
    D = transpose(d(i)); % fill d row-wise

    % create correlation matrices
    R = transpose(S)*S;
    P = transpose(S)*D;

    % generate output weight matrix (w_out) through 
    % linear regression
    w_out = transpose(pinv(R)*P);

    % read-out phase (generate output signals)
    y(i) = w_out(1,1:(n+k))*z;

    % transition to next epoch
    i = i + 1;
end

% plotting

% plot roll
u_plot = [u(1,1), u(1,2), u(1,3)];


d_plot = [d(1), d(2), d(3), 60, 60, 60, 60, 60];
y_plot = [0, 56, 60, 60, 62, 61, 60];


%axis = [0,0,0];

%plot(u_plot, 'b--o');
plot(d_plot, 'b--o');
hold;
plot(y_plot, 'r--o');

%plotyy(d,axis,y,axis);

ylabel('Input Signal vs Teacher Signal (Roll)', 'FontSize', 24);
legend('teacher signal: d(n)', 'output signal: y(n)', 'FontSize', 24);
