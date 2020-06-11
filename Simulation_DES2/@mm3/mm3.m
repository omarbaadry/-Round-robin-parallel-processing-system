function m=mm3(n) 
m.server1=0;
m.server2=0;
m.server3=0;


m.queue=[];

m.numguestdelayed=0;
m.totaldelays=0;

m.arrival=2.5;

m.service1=5;
m.service2=5;
m.service3=5;

m.delaylimit=n;

m.t=[];
m.q=[];

m.s1=[];
m.s2=[];
m.s3=[];

m.r=randu();
d=des();
m = class(m,'mm3',d); 
