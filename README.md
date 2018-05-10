# Rotation decomposition

The program "Decomp4_opt" provides four-step rotation decomposition of a given target rotation with shortest length (up to certain accuracy) with two fixed axes, z=[0,0,0], m=[sin(Theta)cos(Phi), sin(Theta)sin(Phi), cos(Theta)], where 'Theta' and 'Phi' to be defiend by users.
For example, for target rotation R(2.58, 2.18, 3.98), and m axis with Theta=0.76, Phi=0.10,  we want the 'z' rotation have positive rotation angle, 'm' rotation have negative rotation angle. One should input 

    >> x=Decomp4_opt(2.58, 2.18, 3.98, 0.76, 0.10, 'p','m')

and get
x = 
[1x4 double]    [7.0020]    'zmzm'

To get the rotation angle:

    >> x{1}
which gives
ans =
0.0042   -0.4334    4.3967   -2.1677
This means that target rotation can be decomposed as 
R(2.58,2.18,3.98)=\pm R(z,0.0042)R(m,-0.4334)R(z,4.3967)R(m,-2.1677)    
For more details on rotation decomposition, users are referred to our recent paper. 
