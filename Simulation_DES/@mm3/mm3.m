function m=mm3(n) 
m.server1=0;
m.server2=0;
m.server3=0;


m.queue1=[];
m.queue2=[];
m.queue3=[];

m.numguestdelayed=0;
m.totaldelays=0;

m.arrival1=0;
m.arrival2=0;
m.arrival3=0;

m.service1=3;
m.service2=2.5;


m.delaylimit=n;

m.t=[];

m.q1=[];
m.q2=[];
m.q3=[];

m.s1=[];
m.s2=[];
m.s3=[];

m.r=randu();
d=des();
m = class(m,'mm3',d);
