%Program providing four-piece decomposition scheme with shortest operation
%time (up to certain accuracy). One decomposing axis is z-axis, and the 
%other one is m=[sin(Theta)cos(Phi), sin(Theta)sin(Phi), cos(Theta)]. 
%Input: target rotation R(theta,psi,phi), with theta: polar angle, psi: 
%azimuthal angle, phi: rotation angle; and Theta, Phi representing m axis;
%and sgnz='p' or 'm', sgnm='p' or 'm', the desired sgin or rotation angle
%for z and m rotation.
%Output: if x=Decomp4_opt(???), x{1} gives sequentially the rotation angle 
%of decomposition schemes, x{2} gives the sum of absolute value of those
%rotation angle (the value we have optimized), x{3} gives the decomposition
%type. 
function  output= Decomp4_opt( theta,psi,phi,Theta,Phi,sgnz,sgnm )
    tmin=1000;
    bmin=[0,0,0,0];
    type='mzmz';
    for b0=0:0.001*pi:4*pi
        ang=agl(Rot(Theta,Phi,-b0)*Rot(theta,psi,phi));
        if Bol3(ang(1),ang(2),ang(3),Theta,Phi);
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
        ang=agl(Rot(Theta,Phi,-b3)*Rot(theta,psi,4*pi-phi));
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
    
    if tmin==1000  %four piece decomposition is nonexist
        error('can not be decomposed in four steps')
    end
    
    output=[{bmin},{tmin},{type}];
end



