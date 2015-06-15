import graph3;
import apexstyle;

import labelpath3;
//ASY file for figmass2.asy in Chapter 13


size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(2.9,-4.6,5.2);
defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");

// setup and draw the axes
real[] myxchoice={1};
real[] myychoice={1};
real[] myzchoice={2,4};
defaultpen(0.5mm);

pair xbounds=(-0.25,1.25);
pair ybounds=(-0.25,1.25);
pair zbounds=(0,4.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the plane z=3 with thick line
triple f(pair t) {
  return (t.x,t.y,3);
}
surface s=surface(f,(0,0),(1,1),4,4,Spline);
pen q=rgb(.3,.3,.3)+.2mm;
draw(s,emissive(simplesurfacepen),meshpen=q);
draw((0,0,3)--(1,0,3)--(1,1,3)--(0,1,3)--cycle,rgb(.3,.3,.3)+linewidth(1));
label("$z=3$",(1,0.5,3),S);
path3 gg=(1,0,2.8)--(1,1,2.8);
//draw(labelpath("$z=3$",subpath(gg,.35,.65),angle=-90));



//draw plane z=x+y+2
triple f(pair t) {
  return (t.x,t.y,t.x+t.y+2);
}
surface s=surface(f,(0,0),(1,1),8,8,Spline);
pen p=rgb(0,0,.7);
draw(s,emissive(surfacepen),meshpen=apexmeshpen);
draw((0,0,2)--(1,0,3)--(1,1,4)--(0,1,3)--cycle,rgb(.1,.1,.1)+linewidth(1));
label("$z=x+y+2$",(.5,0,2.5),S);

draw((1,0,3)--(0,1,3),black+dashed+linewidth(1));






// ////////////////////////////////////
//    SAMPLE CODE

// defaultpen(fontsize(10pt));

//real f(pair z) {return -z.x^4+2*z.x^2-z.y^4+2*z.y^2;}
//surface s=surface(f,(-1.5,-1.5),(1.5,1.5),Spline);
//pen p=rgb(0,0,.7);
//draw(s,emissive(surfacepen),meshpen=apexmeshpen);

//triple f(pair t) {
//  return (cos(t.x)*1.5*cos(t.y),sin(t.x)*cos(t.y),sin(t.y));
//}
//surface s=surface(f,(0,0),(pi,2*pi),8,8,Spline);
//pen p=rgb(0,0,.7);
//draw(s,emissive(surfacepen),meshpen=apexmeshpen);

//draw(s,palergb(.1,.1,.1));
//draw(s,lightrgb(.1,.1,.1),meshpen=black+thick(),nolight,render(merge=true));
//draw(mypath,2bp+rgb(.1,.1,.1));

//triple g(real t) {return (t,t,-2*t^4+4*t^2);}
//path3 mypath=graph(g,-1,1,operator ..);
//draw(mypath,rgb(.1,.1,.1)+linewidth(2));

//pen p=rgb(0,0,1);
//draw(s,palergb(.1,.1,.1)+opacity(.5),meshpen=p,render(merge=true));