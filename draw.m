%High Energy Detection - Sodium Iodide Crystal interpolator;
%github.com/vorcil/apgra;

%Import data from ocsilliscope where $filename is path to datafile and plot;
filename='ABa133RED.txt';
data = importdata(filename);
tempData = data;
%number of peak energies
nEnergy=2;
%matrix of peak positions in data
pos=[];
%create figure for plot - before loop
figure

%for each peak energy in data
for i = 1:nEnergy
%select a subplot for that energy
subplot(nEnergy,1,i)

%plot that data set inclusive of n peaks
plot(tempData(:,2));

%Find position of the first peak maximum
p=findpeaks(tempData(:,2));
LMax=max(p);
LMaxPos=find(tempData(:,2)==LMax);
%save position to pos array
pos(i)=LMaxPos;

%clear data to that peak
tempData=tempData(LMaxPos:size(tempData(:,2)),:);

%create subset of data 2.5%(arbitrary) of size and locate the minimum index
tempsize=floor(0.025*size(tempData(:,2)));

%Find next local minimum and make a subset from that point and the original
%dataset
temp=tempData(1:tempsize(1),2);
LMin=min(temp);
LMinPos=find(tempData(:,2)==LMin);
tempData=tempData(LMinPos:size(tempData(:,2)),:);

end
