function [Tsa,Tsb]=gentimeseries(m1,tp,num_cycles)
num_angles=(360/5)+1;
ts=tp/(num_angles*50);
ts
tsa=[];
tsb=[];
alpha1=0;
ta1=0;
tb1=0;
tsa=[tsa;[ta1,0]];
tsb=[tsb;[tb1,0]];
while alpha1<=360
    [wa,da,wb,db]=svp(m1,alpha1);
    da=da*ts/100;
    db=db*ts/100;
    wa=wa*ts/100;
    wb=wb*ts/100;
    i=1;
    
    
    while i<=50
        ta1=ta1+da;
        tsa=[tsa;[ta1,1]];
        ta1=ta1+wa;
        tsa=[tsa;[ta1,0]];
        ta1=ta1+da;
        tsa=[tsa;[ta1,0]];
        i=i+1;
    end
    
    i=1;
    while i<=50
        tb1=tb1+db;
        tsb=[tsb;[tb1,1]];
        tb1=tb1+wb;
        tsb=[tsb;[tb1,0]];
        tb1=tb1+db;
        tsb=[tsb;[tb1,0]];
        i=i+1;
    end
    alpha1=alpha1+5;
end
x=tsa(:,2);
y=tsa(:,1);
plot(y,x,'.')
Tsa=timeseries(tsa(:,2),tsa(:,1));
Tsb=timeseries(tsb(:,2),tsb(:,1));
n_cycle=1;
while n_cycle<=num_cycles
    tta=Tsa;
    tta.time=tta.time+ta1;
    Tsa=Tsa.append(tta);
    ttb=Tsb;
    ttb.time=ttb.time+tb1;
    Tsb=Tsb.append(ttb);
    ta1=ta1+ta1;
    tb1=tb1+tb1;
    n_cycle=n_cycle+1;
end
end
