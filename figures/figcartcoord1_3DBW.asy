import graph3;
import apexstyle;


//ASY file for figcartcoord1.pdf in Chapter 10.1

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(11,5,2.8);
defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");

// setup and draw the axes
real[] myxchoice={-1,1,2,3};
real[] myychoice={-2,-1,1,2};
real[] myzchoice={-2,-1,1,2};
defaultpen(0.5mm);
pair xbounds=(-3,3.5);
pair ybounds=(-2.5,2.5);
pair zbounds=(-2.5,2.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$z$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$x$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$y$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

// Draw the lines
draw((0,0,1)--(0,2,1)--(3,2,1)--(3,0,1)--(0,0,1), rgb(.3,.3,.3)+dashed+linewidth(.5));//top
draw((0,0,0)--(0,2,0)--(3,2,0)--(3,0,0)--(0,0,0), rgb(.3,.3,.3)+dashed+linewidth(.5));//bottom
draw((3,0,0)--(3,0,1), rgb(.3,.3,.3)+dashed+linewidth(.5));//up1
draw((0,2,0)--(0,2,1), rgb(.3,.3,.3)+dashed+linewidth(.5));//up2
draw((3,2,0)--(3,2,1), rgb(.3,.3,.3)+dashed+linewidth(.5));//up3
label("$P$",(3,2,1),E);
dotfactor=3;  dot((3,2,1),rgb(.1,.1,.1));


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