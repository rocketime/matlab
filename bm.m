function [bz] = bmkk(r)

%u0=4*pi*10E-7;

%bu=u0*n*i*r^2;

%B=bu/bd;
bd=zero(1,200);
 for z=-100:100;
      bd(z)=2*((r^2+z^2)^(3/2));
      
 end

end