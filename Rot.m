function Rot = Rot(theta,psi,phi)
sx=[0 1;1 0];sy=[0 -i;i 0];sz=[1 0;0 -1];
Rot=expm(-i*(sin(theta)*cos(psi)*sx+sin(theta)*sin(psi)*sy+cos(theta)*sz)*phi/2);

psi22=angle(Rot(2,1)/Rot(1,2));  
if psi22<0
    psi22=psi22+2*pi;
end
psi2=psi22/2;

    phi2=2*acos(real(Rot(1,1)));
    if imag(Rot(1,1))>0
        phi2=4*pi-phi2;
    end
    theta2= atan( abs( Rot(2,1)/imag(Rot(1,1)) ) );


Rot(2,1)*i;
sin(phi/2)*sin(theta)*exp(i*psi2);

end

