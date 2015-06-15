import graph3;
import apexstyle;


//ASY file for figlines3.asy in Chapter 10

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(10,26,7);
defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");


// setup and draw the axes
real[] myxchoice={2,4};
real[] myychoice={10};
real[] myzchoice={-5,5};
defaultpen(0.5mm);
pair xbounds=(-1,4.5);
pair ybounds=(-1,11);
pair zbounds=(-6,6);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//draw P1 and vector d1 at P1
dotfactor=3;dot((-0.7,4.2,2.3));label("$P_1$",(-0.7,4.2,2.3),E);
//draw((-0.7,4.2,2.3)--(0.9,6.92,-1.06),black,Arrow3(size=2mm));
label("$\vec{d}_1$",(0.9+.5,6.92,-1.06),W);

//draw P2 and vector d2 at P2
//dotfactor=3;dot((5.7,15.08,-11.14));label("$P_2$",(5.7,15.08,-11.14),E);
//draw((5.7,15.08,-11.14)--(2.8,10.15,-5.05),black,Arrow3(size=2mm));
//label("$\vec{d}_2$",(2.8,10.15,-5.05),E);

dotfactor=3;dot((2.8,10.15,-5.05));label("$P_2$",(2.8,10.15,-5.05),W);
//draw((2.8,10.15,-5.05)--(-.1,5.22,1.04),black,Arrow3(size=2mm));
label("$\vec{d}_2$",(-.1-.5,5.22,1.04),E);


//draw the line L ({-0.7+1.6t},{4.2+2.72t},{2.3-3.36t}) 
draw((3.3,11,-6.1)--(-2.3,1.48,5.66),rgb(.1,.1,.1));

draw((2.8-.5,10.15,-5.05)--(-.1-.5,5.22,1.04),rgb(.3,.3,.3),Arrow3(size=2mm));
draw((-0.7+.5,4.2,2.3)--(0.9+.5,6.92,-1.06),rgb(.3,.3,.3),Arrow3(size=2mm));


// ////////////////////////////////////
//    SAMPLE CODE

// defaultpen(fontsize(10pt));

//real f(pair z) {return -z.x^4+2*z.x^2-z.y^4+2*z.y^2;}
//surface s=surface(f,(-1.5,-1.5),(1.5,1.5),Spline);

//triple f(pair t) {
//  return (cos(t.x)*1.5*cos(t.y),sin(t.x)*cos(t.y),sin(t.y));
//}
//surface s=surface(f,(0,0),(pi,2*pi),8,8,Spline);

//triple g(real t) {return (t,t,-2*t^4+4*t^2);}
//path3 mypath=graph(g,-2,2,operator ..);

//pen p=rgb(0,0,1);
//draw(s,palergb(.1,.1,.1)+opacity(.5),meshpen=p,render(merge=true));

//draw(s,palergb(.1,.1,.1));
//draw(s,lightrgb(.1,.1,.1),meshpen=black+thick(),nolight,render(merge=true));
//draw(mypath,2bp+rgb(.1,.1,.1));