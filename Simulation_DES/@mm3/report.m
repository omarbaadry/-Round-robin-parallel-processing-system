function report(d)
avg=d.totaldelays/d.numguestdelayed;

avgq1=0;
avgq2=0;
avgq3=0;

avgs1=0;
avgs2=0;
avgs3=0;

for i=2:length(d.t)
    avgq1=avgq1+d.q1(i)*(d.t(i)-d.t(i-1));
    avgq2=avgq2+d.q2(i)*(d.t(i)-d.t(i-1));
    avgq3=avgq3+d.q3(i)*(d.t(i)-d.t(i-1));

    avgs1=avgs1+d.s1(i)*(d.t(i)-d.t(i-1));
    avgs2=avgs2+d.s2(i)*(d.t(i)-d.t(i-1));
    avgs3=avgs3+d.s3(i)*(d.t(i)-d.t(i-1));
end
avgq1=avgq1/d.t(length(d.t));
avgq2=avgq2/d.t(length(d.t));
avgq3=avgq3/d.t(length(d.t));

avgs1=avgs1/d.t(length(d.t));
avgs2=avgs2/d.t(length(d.t));
avgs3=avgs3/d.t(length(d.t));

fprintf('Average Delay =%0.4f\n',avg);
fprintf('Average queue1 length =%0.4f\n',avgq1);
fprintf('Average queue2 length =%0.4f\n',avgq2);
fprintf('Average queue3 length =%0.4f\n',avgq3);

fprintf('Average Server1 Utilization =%f %%\n',100*avgs1);
fprintf('Average Server2 Utilization =%f %%\n',100*avgs2);
fprintf('Average Server3 Utilization =%f %%\n',100*avgs3);

plot(d.t,d.q1);
figure
plot(d.t,d.q2);
figure
plot(d.t,d.q3);
figure
plot(d.t,d.s1);
figure
plot(d.t,d.s2);
figure
plot(d.t,d.s3);


