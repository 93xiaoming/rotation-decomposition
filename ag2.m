function ag = ag( R )

%given a matrix, calculate the corresponding rotation angle     

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%azimuthal angle    
    if imag(R(2,1)*i)>0        
        psi=angle(R(2,1)*i);
    elseif imag(R(2,1)*i)<0
        psi=angle(-R(2,1)*i);
    else 
        psi=0;
    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%rotation angle
    phi=2*acos(real(R(1,1))); 
    imag(R(2,1)*i);
    if imag(R(2,1)*i)<0
        phi=4*pi-phi;
    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%polar angle
    if abs(sin(phi/2))<10e-8
        theta=0;
    else 
        theta=acos((-imag(R(1,1))/sin(phi/2)));
    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    ag=[theta psi phi];
end

