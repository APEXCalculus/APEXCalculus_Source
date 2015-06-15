import graph3;
import apexstyle;


//ASY file for figwasher_idea_a_3D.asy in Chapter 7


size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic((13.6,14.55,43),(0,1,0),(0,0,0),1,(0,0));
defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");

// setup and draw the axes
real[] myxchoice={1};
real[] myychoice={1};
real[] myzchoice={};
defaultpen(0.5mm);

pair xbounds=(-1.2,1.2);
pair ybounds=(-.2,1.2);
pair zbounds=(-1.2,1.2);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,invisible,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
//label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple g1(real t) {return (t,1/(1+t^2),0);}
path3 p1=graph(g1,0,1,operator ..);
draw(p1--(1,0,0),rgb(.1,.1,.1)+.4mm);
//draw(surface(p1 -- (1,0,0)--(0,0,0)--cycle), emissive(rgb(.6,.6,1)+opacity(0.5)));

//  \filldraw [bottom color=colormaptwobottom,top color=colormaptwotop] 
//  (axis cs:.6,0,0) -- (axis cs:.7,0,0) -- (axis cs:.7,0,.7) -- (axis cs:.6,0,.7) -- cycle;

pen p=rgb(0,0,.7);

triple f(pair t) {
  return (cos(t.x),t.y,sin(t.x));}
surface s=surface(f,(0,0),(2*pi,.5),16,2,Spline);
draw(s,emissive(simplesurfacepen+opacity(.5)),meshpen=apexmeshpen);

triple f(pair t) {
  return (cos(t.x)*t.y,1/(1+t.y^2),t.y*sin(t.x));}
surface s=surface(f,(0,0),(2*pi,1),16,16,Spline);
draw(s,emissive(simplesurfacepen+opacity(.5)),meshpen=apexmeshpen);



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
//draw(mypath,rgb(.1,.1,.1)+dashed+linewidth(2));

//pen p=rgb(0,0,1);
//draw(s,palergb(.1,.1,.1)+opacity(.5),meshpen=p,render(merge=true));






