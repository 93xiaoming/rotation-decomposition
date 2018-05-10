%Input: roation matrix R
%Output: angles representing such rotation. theta: polar angle, 
%psi: azimuthal, phi: rotation angle.  


function ag = ag( R )

if abs(imag(i*R(2,1))-0)<1e-6
    psi=0;
    theta=angle(-imag(R(1,1)-R(2,1)));
    if abs(theta-pi/2)<1e-6
        phi=2*angle(R(1,1)-R(2,1));
    else
        phi=2*angle( real(R(1,1))-i*imag(R(1,1))/cos(theta) );
    end
    
elseif imag(i*R(2,1))>0
    psi=angle(i*R(2,1));
    phi=2*acos(real(R(1,1)));
    if phi==1e-6||(phi-2*pi)==0
        theta=0;
    else
        theta=acos( -imag(R(1,1))/sin(phi/2) );
    end
elseif imag(i*R(2,1))<0
    psi=angle(-i*R(2,1));
    phi=4*pi-2*acos(real(R(1,1)));
    if phi==0||(phi-2*pi)==0
        theta=0;
    else
        theta=acos( -imag(R(1,1))/sin(phi/2) );
    end
end

ag=[theta psi phi];
    
    
    
end



