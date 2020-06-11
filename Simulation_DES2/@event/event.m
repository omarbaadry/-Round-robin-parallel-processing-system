function e=event(t,c)
 %e.type=t;
 %e.time=c;
 attrib=attribute('Type',t);
 e.attribs(1)=attrib;
 e = class(e,'event');
 e=set(e,'Time',c);
 