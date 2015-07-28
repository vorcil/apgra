%High Energy Detection - Sodium Iodide Crystal interpolator;
%github.com/vorcil/apgra;

%Import data from ocsilliscope where $filename is path to datafile and plot;
filename='ACS137RED.txt';
data = importdata(filename);
%peakfit(data);
%number of peak energies
nEnergy=2;

for i = 1:nEnergy
figure
subplot(nEnergy,1,i)
disp('i is:' + i);
plot(data(:,2));

%Find position of max
p=findpeaks(data(:,2));
LMax=max(p);
LMaxPos=find(data(:,2)==LMax);

%clear data to that peak
data=data(LMaxPos:size(data(:,2)),:);

%create subset of data 2.5%(arbitrary) of size and locate the minimum index
tempsize=floor(0.025*size(data(:,2)));

%Find next local minimum and make a subset from that point and the original
%dataset
temp=data(1:tempsize(1),2);
LMin=min(temp);
LMinPos=find(data(:,2)==LMin);
data=data(LMinPos:size(data(:,2)),:);

end