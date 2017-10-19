
lim=1e-3;
len=length(cx);
md=(len+1)/2;
pr(len,len)=zeros;
de(len,len)=zeros;
bool(len,len)=zeros;
for i=1:len
    de(i:i,:)=abs(cx(i:i,:)-cx(md,md));
    pr(i:i,:)=abs(cx(i:i,:)-cx(md,md))/cx(md,md);
    bool(i:i,:)=pr(i:i,:)<1e-3;
end    
contour(xplot,yplot,bool)
%spy(bool)