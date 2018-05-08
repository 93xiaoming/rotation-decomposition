function tout = opt_pm( tin,sgn1,sgn2 )
    sz=size(tin);
    if sz(2)~=4
        error('invalid input')
    end
 
    if sgn1=='m'
        tin(:,1)=tin(:,1)-4*pi;
        tin(:,3)=tin(:,3)-4*pi;
    elseif sgn1~='p'
        error('invalid input')
    end    
    
    if sgn2=='m'
        tin(:,2)=tin(:,2)-4*pi;
        tin(:,4)=tin(:,4)-4*pi;
    elseif sgn2~='p'
        error('invalid input')
    end
    
    %%%%%%%%%%%%golbal phase
    tin=tin-2*pi*(tin>=2*pi);
    tin=tin+2*pi*(tin<=-2*pi);
    tin=tin-2*pi*(tin>=2*pi);
    tin=tin+2*pi*(tin<=-2*pi);
    %%%%%%%%%%%%
    [v,i]=min(sum(abs(tin),2));
    tout =tin(i,:);
end

