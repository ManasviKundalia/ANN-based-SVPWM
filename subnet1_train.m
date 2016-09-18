%subnet 1 training data
alpha=0:1:360;
i=1;
mat=zeros(size(alpha,2),3);
for alpha=0:1:360
    if alpha<=60
            %da_on=0.5+(sqrt(3)/pi)*m*(-sind(60-alpha)-sind(alpha));
            %db_on=0.5+(sqrt(3)/pi)*m*(-sind(alpha));
        h10=-sind(60-alpha)-sind(alpha);
        h20=-sind(alpha);
    elseif alpha<=120
            %da_on=0.5+(sqrt(3)/pi)*m*(-sind(60-alpha))
            %db_on=0.5+(sqrt(3)/pi)*m*(-sind(60-alpha)-sind(alpha))
        h10=-sind(60-alpha);
        h20=-sind(60-alpha)-sind(alpha);
    elseif alpha<=180
            %da_on=0.5+(sqrt(3)/pi)*m*sind(alpha)
            %db_on=0.5+(sqrt(3)/pi)*m*(-sind(60-alpha))
        h10=sind(alpha);
        h20=-sind(60-alpha);
    elseif alpha<=240
            %da_on=0.5+(sqrt(3)/pi)*m*(sind(60-alpha)+sind(alpha))
            %db_on=0.5+(sqrt(3)/pi)*m*sind(alpha)
        h10=sind(60-alpha)+sind(alpha);
        h20=sind(alpha);
    elseif alpha<=300
            %da_on=0.5+(sqrt(3)/pi)*m*sind(60-alpha)
            %db_on=0.5+(sqrt(3)/pi)*m*(sind(60-alpha)+sind(alpha))
        h10=sind(60-alpha);
        h20=sind(60-alpha)+sind(alpha);
    elseif alpha<=360
            %da_on=0.5+(sqrt(3)/pi)*m*(-sind(alpha))
            %db_on=0.5+(sqrt(3)/pi)*m*sind(60-alpha)
        h10=-sind(alpha);
        h20=sind(60-alpha);
    end
    
    c=[alpha,h10,h20];
    mat(i,:)=c;
    i=i+1;
end

%csvwrite('C:/Users/DELL/Documents/btp/subnet1_train.csv',mat);