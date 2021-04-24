%                     short transmission line modelling
%|vs| =|1 Z|* |vr|
%|is|  |0 1|  |ir|
%given :
%R=0.12 ohm/km, L=1.326 mH/km (transmission line resistance & inductance)
%length of transmission line= 40km
%receiving end line voltage=220kv
%short transmission line supplies a load of 350 MVA @ 0.8 power factor ((i)lead & (ii)lag) 
clc;
length=40;
res=0.12;
ind=1.326*10^-3;
f=50;
mva=350;
vrline=220;
pf=0.8;
r=res*length;
l=ind*length;
xl=2*pi*f*l;
disp('Transmission line impedance')
z=r+i*xl % z=transmission line impedance
disp('Receiving end voltage & current')
vrph=vrline/sqrt(3)
disp('Before incorporating power factor angle ')
irmag=mva/(3*vrph)%mva=3*vph*iph 
for lag=0:1
if(lag==1)
disp('FOR LOAD POWER FACTOR LAGGING')
disp('Receiving end power factor angle')
theta=acos(pf)*(-1) % theta is in radian
else
disp('FOR LOAD POWER FACTOR LEADING')
disp('Receiving end power factor angle)')
theta=acos(pf) %theta is in radian
end
disp('After incorporating power factor angle ')
ir=irmag.*exp(i*theta)% converting  mag*angle(theta) -> a+ib 
disp('       Sending end voltage & current')
vs=vrph+ir*z
[theta,mag]=cart2pol(real(vs),imag(vs));% converting a+ib-> mag*angle(theta)
is=ir
[theta,mag]=cart2pol(real(is),imag(is));
inpow=3*abs(vs)*abs(is)*cos(angle(vs)-theta)%i/p power=3*|vs|*|is|*cos(sending voltage angle-sending current angle); |is|=|ir|(sending end power)
outpow=3*vrph*irmag*pf%o/p power=3*|vr|*|ir|*power factor ; (receiving end power)
efficiency=(outpow/inpow)*100
regulation=(abs(vs)-vrph)*100/vrph
end

