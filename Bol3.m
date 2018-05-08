%given a rotation R(theta,psi,phi), determine whether it can be decomposed
%as Rz(*)Rm(*)Rz(*).
function Bol = Bol3( theta,psi,phi,Theta,Phi )
    Bol=abs(sin(theta)*sin(phi/2))<=abs(sin(Theta));
end

