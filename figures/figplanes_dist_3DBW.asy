import graph3;
import apexstyle;


//ASY file for figplanes_dist3D.asy in Chapter 10

size(200,200,Aspect);
//size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4.5,4.5,1.5);
defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");


// setup and draw the axes
real[] myxchoice={-4,4};
real[] myychoice={-4,4};
real[] myzchoice={2};
defaultpen(0.5mm);
pair xbounds=(-5,5);
pair ybounds=(-5,5);
pair zbounds=(-5,5);

//xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
//yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
//zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

//label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
//label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
//label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the plane xy-plane
triple f(pair t) {
  return (t.x,t.y,0);
}
surface s=surface(f,(-2,-1),(2,1.5),1,1,Spline);
pen p=rgb(0,0,0);
//pen p=rgb(0,0,.7);
draw(s,rgb(1,1,1)+opacity(0),meshpen=p+thick(),nolight,render(merge=true));
//draw(s,rgb(.6,.6,1)+opacity(.7),meshpen=p,nolight,render(merge=true));

//Draw origin point and P=(1,1,1)
dotfactor=3;dot((0,0,0),black);dot((0,1,0),black);label("$P$",(0,1,0),E);

//Draw the normal at P
draw((0,1,0)--(0,1,1),linewidth(.75),Arrow3(size=2mm));label("$\vec{n}$",(0,1,1),E);

//Draw the dashed line from origin to Q=(0,0,2) with label h
draw((0,0,0)--(0,0,2),dashed+linewidth(.75));dot((0,0,2),black);label("$Q$",(0,0,2),W);
label("$h$",(0,0,1),W);

//Draw the vector PQ stopping just short of Q
draw((0,1,0)--(0,.05,1.95),linewidth(.75),Arrow3(size=2mm));//label("$\vec{n}$",(0,1,1),E);

//Draw the perpendicular symbol as two small lines
draw((0,0,0.2)--(0,0.2,0.2),linewidth(.75));
draw((0,0.2,0)--(0,0.2,0.2),linewidth(.75));






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