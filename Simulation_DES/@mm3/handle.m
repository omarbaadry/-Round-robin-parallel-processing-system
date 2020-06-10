function d=handle(d,e)
type=get(e,'Type');
clk=get(d.des,'CLOCK');

switch (type)
case 'start'
    d.r=nextlcg(d.r,1);
    nextar=clk+nexte(d.r,1,d.arrival1);
    d=AddEvent(d,event('arrival1',nextar));
    
case 'arrival1'
    d.r=nextlcg(d.r,1);
    nextar=clk+nexte(d.r,1,d.arrival1);
    d=AddEvent(d,event('arrival1',nextar)); 

    if(d.server1==1)
     d.queue1(length(d.queue1)+1)=clk;
     d.numguestdelayed=d.numguestdelayed+1;

    else
     d.server1=1;
     d.r=nextlcg(d.r,2);
     nextdep=clk+nexte(d.r,2,d.service1);
     d=AddEvent(d,event('departure1',nextdep));

    end
    
case 'arrival2'
    d.r=nextlcg(d.r,5);
    nextar=clk+nexte(d.r,5,d.arrival2);
    d=AddEvent(d,event('arrival2',nextar));

    if(d.server2==1)
     d.queue2(length(d.queue2)+1)=clk;
     d.numguestdelayed=d.numguestdelayed+1;

    else
     d.server2=1;
     d.r=nextlcg(d.r,3);
     nextdep=clk+nexte(d.r,3,d.service2);
     d=AddEvent(d,event('departure2',nextdep));

    end

case 'arrival3'
    d.r=nextlcg(d.r,6);
    nextar=clk+nexte(d.r,6,d.arrival3);
    d=AddEvent(d,event('arrival3',nextar));

    if(d.server3==1)
     d.queue3(length(d.queue3)+1)=clk;
     d.numguestdelayed=d.numguestdelayed+1;

    else
     d.server3=1;
     d.r=nextlcg(d.r,4);
     nextdep=clk+nexte(d.r,4,d.service3);
     d=AddEvent(d,event('departure3',nextdep));

    end

case 'departure1'
    if(isempty(d.queue1))
        d.server1=0;
    else
        if(d.r<=d.service1)
            d.totaldelays=d.totaldelays+(clk-d.queue1(1));
            d.r=nextlcg(d.r,2);
            nextdep=clk+nexte(d.r,2,d.service1);
            d=AddEvent(d,event('departure1',nextdep));
            x=d.queue1(2:length(d.queue1));
            d.queue1=x;
        else
            d.r=nextlcg(d.r,5);
            nextar=clk+nexte(d.r,5,d.arrival2);
            d=AddEvent(d,event('arrival2',nextar)); 
        end
    end

case 'departure2'
    if(isempty(d.queue2))
        d.server2=0;
    else
        if(d.r<=d.service2)
            d.totaldelays=d.totaldelays+(clk-d.queue2(1));
            d.r=nextlcg(d.r,3);
            nextdep=clk+nexte(d.r,3,d.service2);
            d=AddEvent(d,event('departure2',nextdep));
            x=d.queue2(2:length(d.queue2));
            d.queue2=x;
            
        elseif(d.r<=d.service1+d.service2)
            d.r=nextlcg(d.r,6);
            nextar=clk+nexte(d.r,6,d.arrival3);
            d=AddEvent(d,event('arrival3',nextar)); 
        
         end
     end
    
case 'departure3'
    if(isempty(d.queue3))
        d.server3=0;
    else
            d.totaldelays=d.totaldelays+(clk-d.queue3(1));
            d.r=nextlcg(d.r,4);
            nextdep=clk+nexte(d.r,4,d.service3);
            d=AddEvent(d,event('departure3',nextdep));
            x=d.queue3(2:length(d.queue3));
            d.queue3=x;
        
            
        
    end
    
otherwise
    
end

d.t(length(d.t)+1)=clk;

d.q1(length(d.q1)+1)=length(d.queue1);
d.q2(length(d.q2)+1)=length(d.queue2);
d.q3(length(d.q3)+1)=length(d.queue3);

d.s1(length(d.s1)+1)=d.server1;
d.s2(length(d.s2)+1)=d.server2;
d.s3(length(d.s3)+1)=d.server3;
