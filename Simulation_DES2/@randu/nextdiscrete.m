function u=nextdiscrete(r,x,stream)
u=r.zrng(stream)/2147483647
s=size(x);
l=s(2);
x(3,1)=x(2,1);
for i=2:l,
    x(3,i)=x(3,i-1)+x(2,i);
end;
idx=find(x(3,:)>u,1);
x
u=x(1,idx);


