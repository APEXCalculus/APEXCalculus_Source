import graph3;
import apexstyle;


//ASY file for figtrip53D.asy in Chapter 13


size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(8.4,6.8,12.6);
defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");

// setup and draw the axes
real[] myxchoice={-2,2};
real[] myychoice={-2,2};
real[] myzchoice={5};
defaultpen(0.5mm);

pair xbounds=(-2.5,2.5);
pair ybounds=(-2.5,2.5);
pair zbounds=(-0.5,7);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//paraboloid  6-2*t.x^2-t.y^2
triple f(pair t) {
  return (cos(t.x)*t.y,2*sin(t.x)*t.y,6-(2*(cos(t.x)*t.y)^2+(2*sin(t.x)*t.y)^2));
}
surface s=surface(f,(0,0),(2*pi,1),16,8,Spline);
pen p=rgb(0,0,.7)+.1mm;
draw(s,emissive(surfacepen),meshpen=apexmeshpen);


//parametric trough
triple f(pair t) {
  return (cos(t.x)*t.y,2*sin(t.x)*t.y,(2*(cos(t.x)*t.y)^2+2));
}
surface s=surface(f,(0,0),(2*pi,1),16,16,Spline);
pen p=rgb(.3,.3,.3)+.1mm;
draw(s,emissive(simplesurfacepen+opacity(.3)),meshpen=apexmeshpen);







//ellipse in xy plane
triple g(real t) {return (cos(t),2*sin(t),0);}
path3 mypath=graph(g,0,2*pi,operator ..);
draw(mypath,rgb(.1,.1,.1)+linewidth(2));

//ellipse up on the surface intersection
triple g(real t) {return (cos(t),2*sin(t),2*cos(t)^2+2);}
path3 mypath=graph(g,0,2*pi,operator ..);draw(mypath,rgb(.1,.1,.1)+linewidth(2));


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