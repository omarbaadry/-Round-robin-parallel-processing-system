function report(d)
avg=d.totaldelays/d.numguestdelayed;

avgq=0;

avgs1=0;
avgs2=0;
avgs3=0;

for i=2:length(d.t)
    avgq=avgq+d.q(i)*(d.t(i)-d.t(i-1));

    avgs1=avgs1+d.s1(i)*(d.t(i)-d.t(i-1));
    avgs2=avgs2+d.s2(i)*(d.t(i)-d.t(i-1));
    avgs3=avgs3+d.s3(i)*(d.t(i)-d.t(i-1));
end
avgq=avgq/d.t(length(d.t));

avgs1=avgs1/d.t(length(d.t));
avgs2=avgs2/d.t(length(d.t));
avgs3=avgs3/d.t(length(d.t));

fprintf('Average Delay =%0.4f\n',avg);
fprintf('Average queue length =%0.4f\n',avgq);

fprintf('Average Server Utilization =%f %%\n',100*avgs1);
fprintf('Average Server Utilization =%f %%\n',100*avgs2);
fprintf('Average Server Utilization =%f %%\n',100*avgs3);

plot(d.t,d.q);
figure
plot(d.t,d.s1);
figure
plot(d.t,d.s2);
figure
plot(d.t,d.s3);


