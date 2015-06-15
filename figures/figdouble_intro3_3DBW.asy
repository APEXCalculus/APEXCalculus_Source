import graph3;
import apexstyle;


//ASY file for figdouble_intro23D.asy in Chapter 13


size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(5,5.5,1.8);
defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");

// setup and draw the axes
real[] myxchoice={2};
real[] myychoice={-1,1};
real[] myzchoice={2};
defaultpen(0.5mm);

pair xbounds=(-1,2.5);
pair ybounds=(-1.25,1.25);
pair zbounds=(0,2.25);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));


//Create a shaded slice

pen q=rgb(.3,.3,.3)+.4mm;
path3 p =  (1.6,-0.65,0)--(1.6,0.65,0) -- (1.6,0.65,1.65)..(1.6,0,1.8)..(1.6,-0.65,1.65)--cycle; 
draw(surface(p), emissive(simplesurfacepen),meshpen=invisible);
draw(p,q);


//Draw the surface//{z=-.5*(x-1)^2-.5*(y)^2+2};
triple f(pair t) {
  return (t.x,t.y,-.5*(t.x-1)^2-.5*(t.y)^2+2);
}
surface s=surface(f,(-0.221,-1),(2.2,1),12,20,vsplinetype=new splinetype[] {notaknot,notaknot,monotonic},usplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=rgb(0,0,.7);
draw(s,emissive(surfacepen),meshpen=apexmeshpen);


//Draw curve in xy plane ({cos(x)*(1+cos(2*x))},{sin(x)*(1+cos(2*x))},0);
triple g(real t) {return (cos(t)*(1+cos(2*t)),sin(t)*(1+cos(2*t)),0);}
path3 mypath=graph(g,-pi/2,pi/2,operator ..);
draw(mypath,.4mm+rgb(.1,.1,.1));
label("$R$",(0.5,0.6,0),E);

//Draw curve on the surface //{z=-.5*(cos(t)*(1+cos(2*t))-1)^2-.5*(sin(t)*(1+cos(2*t)))^2+2};
triple gg(real t) {
  return (cos(t)*(1+cos(2*t)),sin(t)*(1+cos(2*t)),-.5*(cos(t)*(1+cos(2*t))-1)^2-.5*(sin(t)*(1+cos(2*t)))^2+2);
}
path3 mypath=graph(gg,-pi/2,pi/2,operator ..);
draw(mypath,.4mm+rgb(.1,.1,.1));






//draw the edge in thick rgb(.3,.3,.3)  pen q=rgb(.9,0,0)+.4mm;
//draw((1.6,-0.65,0)--(1.6,0.65,0)--(1.6,0.65,1.625)..(1.6,0,1.825)..(1.6,-0.65,1.625)--(1.6,-0.65,0),rgb(.9,0,0)+.4mm); 



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

//pen p=rgb(0,0,1);
//draw(s,palergb(.1,.1,.1)+opacity(.5),meshpen=p,render(merge=true));