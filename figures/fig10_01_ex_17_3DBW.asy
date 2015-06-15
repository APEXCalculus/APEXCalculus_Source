import graph3;
import apexstyle;


//ASY file for fig10_01_ex_173D.pdf in Chapter 10

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,2);
defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");

// setup and draw the axes
real[] myxchoice={-2,2};
real[] myychoice={-3,3};
real[] myzchoice={};
defaultpen(0.5mm);
pair xbounds=(-4,4);
pair ybounds=(-4,4);
pair zbounds=(-4,4);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the cylinder on top
triple f(pair t) {
  return (2*cos(t.x),3*sin(t.x),t.y);
}
surface s=surface(f,(0,-2),(2*pi,2),32,8,Spline);
pen p=rgb(0,0,.7);
draw(s,emissive(surfacepen),meshpen=apexmeshpen);

//Draw the traces (in this case vertical lines)
triple g(real t) {return (2*cos(0),3*sin(0),t);}
path3 mypath=graph(g,-2,2,operator ..); draw(mypath,rgb(.3,.3,.3));
triple g(real t) {return (2*cos(2*pi/10),3*sin(2*pi/10),t);}
path3 mypath=graph(g,-2,2,operator ..); draw(mypath,rgb(.3,.3,.3));
triple g(real t) {return (2*cos(2*2*pi/10),3*sin(2*2*pi/10),t);}
path3 mypath=graph(g,-2,2,operator ..); draw(mypath,rgb(.3,.3,.3));
triple g(real t) {return (2*cos(3*2*pi/10),3*sin(3*2*pi/10),t);}
path3 mypath=graph(g,-2,2,operator ..); draw(mypath,rgb(.3,.3,.3));
triple g(real t) {return (2*cos(4*2*pi/10),3*sin(4*2*pi/10),t);}
path3 mypath=graph(g,-2,2,operator ..); draw(mypath,rgb(.3,.3,.3));
triple g(real t) {return (2*cos(5*2*pi/10),3*sin(5*2*pi/10),t);}
path3 mypath=graph(g,-2,2,operator ..); draw(mypath,rgb(.3,.3,.3));
triple g(real t) {return (2*cos(6*2*pi/10),3*sin(6*2*pi/10),t);}
path3 mypath=graph(g,-2,2,operator ..); draw(mypath,rgb(.3,.3,.3));
triple g(real t) {return (2*cos(7*2*pi/10),3*sin(7*2*pi/10),t);}
path3 mypath=graph(g,-2,2,operator ..); draw(mypath,rgb(.3,.3,.3));
triple g(real t) {return (2*cos(8*2*pi/10),3*sin(8*2*pi/10),t);}
path3 mypath=graph(g,-2,2,operator ..); draw(mypath,rgb(.3,.3,.3));
triple g(real t) {return (2*cos(9*2*pi/10),3*sin(9*2*pi/10),t);}
path3 mypath=graph(g,-2,2,operator ..); draw(mypath,rgb(.3,.3,.3));

triple g(real t) {return (2*cos(t),3*sin(t),0);}
path3 mypath=graph(g,0,2*pi,operator ..); draw(mypath,rgb(.1,.1,.1));



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
//path3 mypath=graph(g,-1,1,operator ..);

//pen p=rgb(0,0,1);
//draw(s,palergb(.1,.1,.1)+opacity(.5),meshpen=p,render(merge=true));

//draw(s,palergb(.1,.1,.1));
//draw(s,lightrgb(.1,.1,.1),meshpen=black+thick(),nolight,render(merge=true));
//draw(mypath,2bp+rgb(.1,.1,.1));