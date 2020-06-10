function d=handle(d,e)
type=get(e,'Type');
clk=get(d.des,'CLOCK');

switch (type)
    case 'start'
        
            d.r=nextlcg(d.r,1);
            nextar=clk+nexte(d.r,1,d.arrival);
            d=AddEvent(d,event('arrival',nextar));
        
    case 'arrival'
        while(length(d.queue)<=50)
            
            d.r=nextlcg(d.r,1);
            nextar=clk+nexte(d.r,1,d.arrival);
            d=AddEvent(d,event('arrival',nextar));
            
            if(d.server1==1)
                d.queue(length(d.queue)+1)=clk;
                d.numguestdelayed=d.numguestdelayed+1;
            else
                d.server1=1;
                d.r=nextlcg(d.r,2);
                nextdep=clk+nexte(d.r,2,d.service1);
                d=AddEvent(d,event('departure1',nextdep));
            end
            if(d.server2==1)
                d.queue(length(d.queue)+1)=clk;
                d.numguestdelayed=d.numguestdelayed+1;
            else
                d.server2=1;
                d.r=nextlcg(d.r,3);
                nextdep=clk+nexte(d.r,3,d.service2);
                d=AddEvent(d,event('departure2',nextdep));
            end
            if(d.server3==1)
                d.queue(length(d.queue)+1)=clk;
                d.numguestdelayed=d.numguestdelayed+1;
            else
                d.server3=1;
                d.r=nextlcg(d.r,4);
                nextdep=clk+nexte(d.r,4,d.service3);
                d=AddEvent(d,event('departure3',nextdep));
            end    
        end
        
    case 'departure1'
    if(isempty(d.queue))
        d.server1=0;
    else
        d.totaldelays=d.totaldelays+(clk-d.queue(1));
        d.r=nextlcg(d.r,2);
        nextdep=clk+nexte(d.r,2,d.service1);
        d=AddEvent(d,event('departure1',nextdep));
        x=d.queue(2:length(d.queue));
        d.queue=x;
        
        d.r=nextlcg(d.r,1);
        nextar=clk+nexte(d.r,1,d.arrival);
        d=AddEvent(d,event('arrival',nextar));
    end
    case 'departure2'
    if(isempty(d.queue))
        d.server2=0;
    else
        d.totaldelays=d.totaldelays+(clk-d.queue(1));
        d.r=nextlcg(d.r,3);
        nextdep=clk+nexte(d.r,3,d.service2);
        d=AddEvent(d,event('departure2',nextdep));
        x=d.queue(2:length(d.queue));
        d.queue=x;
        
        d.r=nextlcg(d.r,1);
        nextar=clk+nexte(d.r,1,d.arrival);
        d=AddEvent(d,event('arrival',nextar));
    end

    case 'departure3'
    if(isempty(d.queue))
        d.server3=0;
    else
        d.totaldelays=d.totaldelays+(clk-d.queue(1));
        d.r=nextlcg(d.r,4);
        nextdep=clk+nexte(d.r,4,d.service3);
        d=AddEvent(d,event('departure3',nextdep));
        x=d.queue(2:length(d.queue));
        d.queue=x;
        
        d.r=nextlcg(d.r,1);
        nextar=clk+nexte(d.r,1,d.arrival);
        d=AddEvent(d,event('arrival',nextar));
    end
    
    
otherwise
    
end

d.t(length(d.t)+1)=clk;
d.q(length(d.q)+1)=length(d.queue);

d.s1(length(d.s1)+1)=d.server1;
d.s2(length(d.s2)+1)=d.server2;
d.s3(length(d.s3)+1)=d.server3;
