function  output= Decomp4_opt( theta,psi,phi,Theta,Phi,sgnz,sgnm )
    tmin=1000;
    bmin=[0,0,0,0];
    type='mzmz';
    for b0=0:0.001*pi:4*pi
        ang=ag2(Rot(Theta,Phi,-b0)*Rot(theta,psi,phi));
        if Bol3(ang(1),ang(2),ang(3),Theta,Phi);
            b0;
            bi=Decomp3(ang(1),ang(2),ang(3),Theta,Phi);
            b=pm([b0,bi(1,:);b0,bi(2,:)],sgnm,sgnz);
            t=sum(abs(b));
            
            if t<tmin
                tmin=t;
                bmin=b;
            end


        end
    end
    %%%%%%%%%%%%%%%%%%%%
    for b3=0:0.001*pi:4*pi
        ang=ag(Rot(Theta,Phi,-b3)*Rot(theta,psi,4*pi-phi));
        if Bol3(ang(1),ang(2),ang(3),Theta,Phi)
            bi=Decomp3(ang(1),ang(2),ang(3),Theta,Phi);
            
            b=pm(4*pi-[fliplr(bi(1,:)),b3;fliplr(bi(2,:)),b3],sgnz,sgnm);
            t=sum(abs(b));
            if t<tmin
                type='zmzm';
                tmin=t;
                bmin=b;
            end
        end
    end
    
    if tmin==1000
        error('can not be decomposed in four steps')
    end
    
    output=[{bmin},{tmin},{type}];
end



