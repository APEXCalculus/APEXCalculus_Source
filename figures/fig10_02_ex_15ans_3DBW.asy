import graph3;
import apexstyle;


//ASY file for fig10_02_ex_15ans.pdf in Chapter 10

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,2);
defaultrender.merge=true;

// setup and draw the axes
real[] myxchoice={};
real[] myychoice={};
real[] myzchoice={};
defaultpen(0.5mm);
pair xbounds=(-1.5,2);
pair ybounds=(-1.5,2);
pair zbounds=(-1.5,2);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

// Draw the vectors
draw((0,0,0)--(0,0,1), rgb(.1,.1,.1)+linewidth(2),Arrow3(size=3mm));//u
draw((0,0,0)--(0,1,0), rgb(.1,.1,.1)+linewidth(2),Arrow3(size=3mm));//v
label("$\vec{u}$",(0,0,1),W);
label("$\vec{v}$",(0,1,0),S);

//Draw the sum and difference
draw((0,0,0)--(0,1,1), rgb(.1,.1,.1)+linewidth(2),Arrow3(size=3mm));//u+v
draw((0,1,0)--(0,0,1), rgb(.1,.1,.1)+linewidth(2),Arrow3(size=3mm));//u-v
label("$\vec{u}+\vec{v}$",(0,1,1),N);
label("$\vec{u}-\vec{v}$",(0,1,0),NE);

// ////////////////////////////////////
//    SAMPLE CODE

// defaultpen(fontsize(10pt));

//real f(pair z) {return -z.x^4+2*z.x^2-z.y^4+2*z.y^2;}
//surface s=surface(f,(-1.5,-1.5),(1.5,1.5),Spline);

//triple f(pair t) {
//  return (cos(t.x)*1.5*cos(t.y),sin(t.x)*cos(t.y),sin(t.y));
//}
//surface s=surface(f,(0,0),(pi,2*pi),8,8,Spline);

//draw(s,palergb(.1,.1,.1));
//draw(s,lightrgb(.1,.1,.1),meshpen=black+thick(),nolight,render(merge=true));
//draw(mypath,2bp+rgb(.1,.1,.1));

//triple g(real t) {return (t,t,-2*t^4+4*t^2);}
//path3 mypath=graph(g,-1,1,operator ..);

//pen p=rgb(0,0,1);
//draw(s,palergb(.1,.1,.1)+opacity(.5),meshpen=p,render(merge=true));