import graph3;
import apexstyle;


//ASY file for figparcalc8_3D.asy in Chapter 9


size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,-8,2);
defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");

// setup and draw the axes
real[] myxchoice={1};
real[] myychoice={};
real[] myzchoice={};
defaultpen(0.5mm);

pair xbounds=(-0.25,1.25);
pair ybounds=(-.25,.25);
pair zbounds=(-.25,.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice));//,Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
//label("$x$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$y$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

label("\ ",(0,0,1.5));
label("\ ",(0,-1.5,0));

//surface r=cos(2 theta) revolved around x axis // ({cos(y)*(cos(2*y))},{(sin(y)*(cos(2*y)))*cos(x)},{(sin(y)*(cos(2*y)))*sin(x)});
triple f(pair t) {
  return (cos(t.y)*cos(2*t.y),sin(t.y)*cos(2*t.y)*cos(t.x),sin(t.y)*cos(2*t.y)*sin(t.x));
}
surface s=surface(f,(0,0),(2pi,pi/4),8,16,Spline);
pen p=rgb(0,0,.7);
draw(s,emissive(surfacepen),meshpen=apexmeshpen);


//curve on the surfaces  //({cos(x)*cos(2*x)},{0},{sin(x)*cos(2*x)});
triple g(real t) {return (cos(t)*cos(2*t),0,sin(t)*cos(2*t));}
path3 mypath=graph(g,0,pi/4,operator ..);draw(mypath,rgb(.1,.1,.1)+linewidth(2));





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