% training data generation based on the paper "Six- Space Vector Pulse
% Width Modulation of Four Switch Voltage Source Inverter feeding Three
% Phase Inducton Motor"

data=[]
for m=0:0.05:1
    for alpha=0:5:360
        t1=abs(1.732*m*sind(60-alpha)/(pi));
        t2=abs((1.732*m*sind(alpha))/pi);
        t0=abs(0.5-t1-t2);
        if alpha<=60
            ta=t0/2;
            tb=t1/2;
            tc=t2+t1/2+t0/2;
        elseif alpha<=120
            ta=t0/2;
            tb=t2/2;
            tc=t1+ta+tb;
        elseif alpha<=180
            ta=t0/2+t2/2;
            tb=t1/2+t2/2;
            tc=t1/2+t0/2;
        elseif alpha<=240
            ta=t2+t1/2+t0/2;
            tb=t1/2;
            tc=t0/2;
        elseif alpha<=300
            ta=t1+t2/2+t0/2;
            tb=t2/2;
            tc=t0/2;
        elseif alpha<=360
            ta=t1/2+t0/2;
            tb=t1/2+t2/2;
            tc=t2/2+t0/2;
        end
        data=[data;[m,alpha,ta,tb,tc]];
    end
end