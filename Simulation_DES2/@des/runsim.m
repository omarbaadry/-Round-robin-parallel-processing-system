function d=runsim(d)
 while (~iseos(d))
    if (isempty(d.events))
        break;
    end

    e=d.events(1);
    temp=d.events(2:length(d.events));
    d.events=temp;
    c=get(e,'Time');
    t=get(e,'Type');
    %fprintf('An event of type %s happened on %0.2f\n',t,c);
    d.clock=c;
    d=handle(d,e);
    
 end
 report(d);