% NSF Twin Engine Doublet Data

clc
clear

% Read log file
Data = xlsread('Fri May 24 14-54-11 2013e.xlsx');

% Read in time (ms) 
t = Data(:,1)-27081;

% Convert milli seconds to seconds
tsec = t./1000;

% Convert seconds to minutes
tmin = tsec./60;

% Determine the point at which 1 Hz recording to 10 Hz recording
tdiff = diff(tsec);

%Change time set to only contain 10 Hz data
tsec2 = tsec(829:4557);

%Roll Rate
P = Data(:,32).*(180/pi());
Pflight = P(829:4557);

% Pitch Rate
Q = Data(:,33).*(180/pi());
Qflight = Q(829:4557);

% Yaw Rate
R = Data(:,34).*(180/pi());
Rflight = R(829:4557);

% Roll
Roll = Data(:,38).*(180/pi());
Roll_flight = Roll(829:4557);

% Pitch
Pitch = Data(:,39).*(180/pi());
Pitch_flight = Pitch(829:4557);

% Yaw
Yaw = Data(:,40).*(180/pi());
Yaw_flight = Yaw(829:4557);

% Acknowledgement Ratio
AckRatio = Data(:,49);
AckRatio_flight = AckRatio(829:4557);

% RSSI
RSSI = Data(:,50);
RSSI_flight = RSSI(829:4557);

% Surface 0
% Aileron
Surface0 = Data(:,51);
Sur0_flight = Surface0(829:4557).*(180/pi());

% Looking for constant surface deflection
Aileron1_diff = diff(Sur0_flight);

% Surface 1
% Elevator
Surface1 = Data(:,52).*(180/pi());
Sur1_flight = Surface1(829:4557);

% Looking for constant surface deflection
Elevator1_diff = diff(Sur1_flight);

% Surface 2
% Throttle
Surface2 = Data(:,53);
Sur2_flight = Surface2(829:4557);

% Looking for constant surface deflection
Throttle1_diff = diff(Sur2_flight);

% Surface 3
Surface3 = Data(:,54).*(180/pi());
Sur3_flight = Surface3(829:4557);

% Looking for constant surface deflection
Sur3_diff = diff(Sur3_flight);

% Surface 4
Surface4 = Data(:,55).*(180/pi());
Sur4_flight = Surface4(829:4557);

% Looking for constant surface deflection
Sur4_diff = diff(Sur3_flight);

% Surface 5
% Aileron
Surface5 = Data(:,56).*(180/pi());
Sur5_flight = Surface5(829:4557);

% Looking for constant surface deflection
Aileron2_diff = diff(Sur5_flight);

% Surface 6
% Elevator
Surface6 = Data(:,57).*(180/pi());
Sur6_flight = Surface6(829:4557);

% Looking for constant surface deflection
Elevator2_diff = diff(Sur6_flight);

% Surface 7
% Throttle
Surface7 = Data(:,58);
Sur7_flight = Surface7(829:4557);

% Looking for constant surface deflection
Throttle2_diff = diff(Sur7_flight);

% Roll 3-2-1-1
% 1567-1624 No Elevator Movement
subplot(3,2,1)
plot(tsec2(1567:1624),Sur0_flight(1567:1624))
xlabel('time (seconds)')
ylabel('deflection (degrees)')
title('Roll 3-2-1-1')

subplot(3,2,2)
plot(tsec2(1567:1624),Roll_flight(1567:1624))
title('Roll Response')
xlabel('time (seconds)')
ylabel('roll angle (degrees)')

% 1733-1805 No Elevator Movement
subplot(3,2,3)
plot(tsec2(1733:1805),Sur0_flight(1733:1805))
xlabel('time (seconds)')
ylabel('deflection (degrees)')

subplot(3,2,4)
plot(tsec2(1733:1805),Roll_flight(1733:1805))
xlabel('time (seconds)')
ylabel('roll angle (degrees)')
% 2563-2628 No Elevator Movement

subplot(3,2,5)
plot(tsec2(2563:2628),Sur0_flight(2563:2628))
xlabel('time (seconds)')
ylabel('deflection (degrees)')

subplot(3,2,6)
plot(tsec2(2563:2628),Roll_flight(2563:2628))
xlabel('time (seconds)')
ylabel('roll angle (degrees)')

% Pitch 3-2-1-1
% 908 - 980 No Aileron Movement
figure
subplot(3,2,1)
plot(tsec2(908:980),Sur1_flight(908:980))
xlabel('time (seconds)')
ylabel('deflection (degrees)')
title('Pitch 3-2-1-1')

subplot(3,2,2)
plot(tsec2(908:980),Pitch_flight(908:980))
title('Pitch Response')
xlabel('time (seconds)')
ylabel('roll angle (degrees)')

% 1068 - 1148 No Aileron Movement
subplot(3,2,3)
plot(tsec2(1068:1148),Sur1_flight(1068:1148))
xlabel('time (seconds)')
ylabel('deflection (degrees)')

subplot(3,2,4)
plot(tsec2(1068:1148),Pitch_flight(1068:1148))
xlabel('time (seconds)')
ylabel('roll angle (degrees)')

% 2380 - 2437 No Aileron Movement
subplot(3,2,5)
plot(tsec2(2380:2437),Sur1_flight(2380:2437))
xlabel('time (seconds)')
ylabel('deflection (degrees)')

subplot(3,2,6)
plot(tsec2(2380:2437),Roll_flight(2380:2437))
xlabel('time (seconds)')
ylabel('roll angle (degrees)')

figure (3), subplot(2,1,1),plot(tsec2(1567:1624),Sur0_flight(1567:1624),'k-','linewidth',3)
grid
ylabel('Aileron (deg)','fontsize',25)
title('Roll Doublet','fontsize',25),set(gca,'fontsize',25)
subplot(2,1,2),plot(tsec2(1567:1624),Roll_flight(1567:1624),'k-','linewidth',3)
ylabel('Roll Angle (deg)','fontsize',25),grid,set(gca,'fontsize',25)
xlabel('Time (sec)')


