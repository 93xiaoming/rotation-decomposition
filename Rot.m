%Input: polar angle, azimuthal, and rotation angle
%Output: rotation matrix
function Rot = Rot(theta,psi,phi)
sx=[0 1;1 0];sy=[0 -i;i 0];sz=[1 0;0 -1];
Rot=expm(-i*(sin(theta)*cos(psi)*sx+sin(theta)*sin(psi)*sy+cos(theta)*sz)*phi/2);
end

