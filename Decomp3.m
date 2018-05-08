%this function consider only the z-m-z decomposition

function beta = Decomp3( theta,psi,phi,Theta,Phi )

    b=zeros(2,3);
    %%%%%%%%%%%%%%%%%%%%%%%first solution    
    b(1,2)= 2*asin( sin(theta)*sin(phi/2)/sin(Theta) );
    
    lmb11=atan( tan(phi/2)*cos(theta) );
    if cos(phi/2)<0
        lmb11=lmb11+pi;
    end
    lmb21=atan( tan(b(1,2)/2)*cos(Theta) );
    b(1,1)= psi-Phi+lmb11-lmb21;
    if b(1,1)<0
        b(1,1)=b(1,1)+4*pi;
    end
    b(1,3)= Phi-psi+lmb11-lmb21;
    if b(1,3)<0
        b(1,3)=b(1,3)+4*pi;
    end
    if b(1,2)<0
        b(1,2)=b(1,2)+4*pi;
    end
%%%%%%%%%%%%%%%%%%%%%%%second solution
    b(2,2)=2*pi-b(1,2);
    sin(b(2,2)/2);
    sin(b(1,2)/2);
    lmb12=atan( tan(phi/2)*cos(theta) );
    if cos(phi/2)<0
        lmb12=lmb12+pi;
    end
    lmb22=atan( tan(b(2,2)/2)*cos(Theta) )+pi;    
%     [cos(b(2,2)/2),cos(Theta)*sin(b(2,2)/2)]
    
    b(2,1)= psi-Phi+lmb12-lmb22;
    if b(2,1)<0
        b(2,1)=b(2,1)+4*pi;
    end
    b(2,3)= Phi-psi+lmb12-lmb22;
    if b(2,3)<0
        b(2,3)=b(2,3)+4*pi;
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%global phase 
    gh=true;
    b = b-4*pi*(b>4*pi);
    beta=b;
end

