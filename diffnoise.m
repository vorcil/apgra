%function that removes the noise from the data

%background noise data
noise='BackgroundRed.txt';
data_diff=importdata(noise);

%file to take difference
filename='ACS137RED.txt';
data=importdata(filename);

%remove the background noise from data
data2=data(:,2)-data_diff(:,2);

%show difference
figure;
subplot(3,1,1);
plot(data(:,2));
subplot(3,1,2);
plot(data_diff(:,2));
subplot(3,1,3);
plot(data2);