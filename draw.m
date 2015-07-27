%High Energy Detection - Sodium Iodide Crystal interpolator;
%github.com/vorcil/apgra;

%Import data from ocsilliscope where $filename is path to datafile and plot;
filename='ACS137RED.txt';
data = importdata(filename);
peakfit(data);
plot(data(:,2));
p=findpeaks(data(:,2));

MAX