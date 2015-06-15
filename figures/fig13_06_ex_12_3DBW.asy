import graph3;
import apexstyle;


//ASY file for fig13_06_ex_123D.asy in Chapter 13


size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(12.1,-7.1,16);
defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");

// setup and draw the axes
real[] myxchoice={-2,-1,1,2};
real[] myychoice={1,2,3,4};
real[] myzchoice={2,4,6,8};
defaultpen(0.5mm);

pair xbounds=(-2.5,2.5);
pair ybounds=(-0.25,5);
pair zbounds=(-0.25,10);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));


//parabola in plane
triple g(real t) {return (t,4-t^2,0);}
path3 mypath=graph(g,-2,2,operator ..);draw(mypath,rgb(.3,.3,.3)+linewidth(2));
triple g(real t) {return (t,4-t^2,2*(4-t^2));}
path3 mypath=graph(g,-2,2,operator ..);draw(mypath,rgb(.1,.1,.1)+linewidth(2));

//shade object
import three;
int k=12;
for (int i=-2*k; i<2*k; ++i)
{
path3 p=(i/k,4-(i/k)^2,0)--((i+1)/k,4-((i+1)/k)^2,0)--((i+1)/k,4-((i+1)/k)^2,2*(4-((i+1)/k)^2))--((i)/k,4-((i)/k)^2,2*(4-((i)/k)^2));
draw(surface(p -- cycle), emissive(simplesurfacepen));
path3 p=(i/k,0,0)--(i/k,4-(i/k)^2,2*(4-(i/k)^2))--((i+1)/k,4-((i+1)/k)^2,2*(4-((i+1)/k)^2))--((i+1)/k,0,0);
draw(surface(p -- cycle), emissive(simplesurfacepen));
}


//label and arrow
label("$z=2y$",(-2,2,7));
draw((-1.8,2,6.8)--(-1,2,4.1),Arrow3(size=2mm));
label("$y=4-x^2$",(2.5,2,0));
draw((2.3,2.5,0.2)--(1.55,2.25,2.5),Arrow3(size=2mm));

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