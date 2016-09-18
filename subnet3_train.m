alpha=0:1:360;
mat3=zeros(size(alpha,2),5);
i=1;
k1=sqrt(3);
k2=(k1/pi)*0.907;
for alpha=0:1:360
        C=(k1*cosd(alpha)-sind(alpha))/(k1*cosd(alpha)+sind(alpha));
        
        if alpha<30
            h12a=0;
            h22a=0;
            h12b=C/2;
            h22b=0.5-C/2;
        elseif alpha<=60
            h12a=0;
            h22a=0;
            h12b=C/2;
            h22b=-0.5*C;
        elseif alpha<90
            h12a=0.5-C/2;
            h22a=-h12a;
            h12b=0;
            h22b=0;
        elseif alpha<=120
            h12a=0.5-C/2;
            h22a=C/2;
            h12b=0;
            h22b=0;
        elseif alpha<150
            h12a=1.0-C/2;
            h22a=-0.5+C/2;
            h12b=0.5-C/2;
            h22b=h22a;
        elseif alpha<=180
            h12a=1.0-C/2;
            h22a=C/2;
            h12b=0.5-C/2;
            h22b=C/2;
        elseif alpha<210
            h12a=1;
            h22a=0;
            h12b=1.0-C/2;
            h22b=-0.5+C/2;
        elseif alpha<=240
            h12a=1;
            h22a=0;
            h12b=0.5-C/2;
            h22b=C/2;
        elseif alpha<270
            h12a=0.5+C/2;
            h22a=0.5-C/2;
            h12b=1;
            h22b=0;
        elseif alpha<=300
            h12a=0.5+C/2;
            h22a=-C/2;
            h12b=1;
            h22b=0;
        elseif alpha<330
            h12a=C/2;
            h22a=0.5-C/2;
            h12b=0.5+C/2;
            h22b=0.5-C/2;
        elseif alpha<=360
            h12a=C/2;
            h22a=-C/2;
            h12b=0.5+C/2;
            h22b=-C/2;
        end
    if h12a>10^5||h12a<-10^5
        continue
    else
        c=[alpha,h12a,h22a,h12b,h22b];
        mat3(i,:)=c;
        i=i+1;
    end
end

%csvwrite('C:/Users/DELL/Documents/btp/subnet3_train.csv',mat3)