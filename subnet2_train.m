k1=sqrt(3);
k2=(k1/pi)*0.907;
alpha=0:1:360;
mat2=zeros(size(alpha,2),5);
i=1;
for alpha=0:1:360
        A=sind(60-alpha);
        B=sind(alpha);
        C=(k1*cosd(alpha)-sind(alpha))/(k1*cosd(alpha)+sind(alpha));
        if alpha<=60
            h11a=0.5-k2*(A+B);
            h21a=-0.5+k2*(A+B);
            h11b=0.5-k2*B;
            h21b=-0.5+k2*B+0.5*C;
        elseif alpha<=120
            h11a=0.5-k2*alpha;
            h21a=k2*A-0.5*C;
            h11b=0.5-k2*(A+B);
            h21b=-0.5+k2*(A+B);
        elseif alpha<=180
            h11a=0.5+k2*B;
            h21a=0.5-k2*B-0.5*C;
            h11b=0.5-k2*A;
            h21b=k2*A-0.5*C;
        elseif alpha<=240
            h11a=0.5+k2*(A+B);
            h21a=0.5-k2*(A+B);
            h11b=0.5+k2*B;
            h21b=0.5-k2*B-0.5*C;
        elseif alpha<=300
            h11a=0.5+k2*A;
            h21a=-k2*A+0.5*C;
            h11b=0.5+k2*(A+B);
            h21b=0.5-k2*(A+B);
        elseif alpha<=360
            h11a=0.5-k2*B;
            h21a=-0.5*k2*B+0.5*C;
            h11b=0.5+k2*A;
            h21b=-k2*A+0.5*C;
        end
    if h21a>10^7||h21a<-10^5
        continue
    else
        c=[alpha,h11a,h21a,h11b,h21b];
        mat2(i,:)=c;
        i=i+1;
    end
end
 
%csvwrite('C:/Users/DELL/Documents/btp/subnet2_train.csv',mat2);