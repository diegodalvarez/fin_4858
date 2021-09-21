%load data
load AAPL.mat;

%then make set a variable for the data
data = AAPL;

%then slice the data in this case we want the 5th column for close
p = data(:,5);

%there probably is a way to calculate log via method or function but we can
%do it mannually

%make on series slice from 2nd spot to end with intervals of size 1
p_0 = p(2:end,1);

%make another series sliced rightly to make the log  
p_1 = p(1:end-1,1);

%then take the log returns
r = log(p_0./p_1);

%because matlab doesn't index values and works solely in matrix we need to
%index the data so we have to define this index. And we also have to define
%a variable to keep track of the length of the points
n = size(r,1);

%then for t
t = (1:1:n);

%now make the plot

%set figure for future assignment
figure(1)

%add in the series to plot
plot(t,r)

%set these grid values
box off
grid off

%then add in the information for the plot
xlabel("Time Index")
ylabel("Log returns")
title("Log returns of AAPL")

%then for part b 

%we can set these simple method of moments

%mean
mu_hat = mean(r);

%sigma
sigma2_tilde = (1/(n-1))*sum( (r-mean(r)).^2);

%volatility
volat = sqrt(sigma2_tilde)

%pack variables into vector
MME = [mu_hat, sigma2_tilde volat]; 

%display it
disp(MME)

%for the last part I wasn't sure what is being asked but I think it
%supposed to be similar to the forecasted price series example

%define EP_hat
EP_hat = exp(log(p_1(1)) + mu_hat * t + 0.5 * sigma2_tilde*t); 

%now plot the forecasted

%set figure
figure(3)

%plot 
plot(t, EP_hat, t, p_1)

%now set graph settings
box off
grid off

%set label 
xlabel("Time index")
ylabel("Forecast of expected price")
title("AAPL forecasted price series")
