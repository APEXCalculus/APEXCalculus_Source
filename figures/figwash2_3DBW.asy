import graph3;
import apexstyle;


//ASY file for figwash1_3D.asy in Chapter 7


size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic((10.17,5.3,46),(0,1,0),(0,0,0),1,(-0.0999,0.0072));
defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");

// setup and draw the axes
real[] myxchoice={1,2,3};
real[] myychoice={};
real[] myzchoice={};
defaultpen(0.5mm);

pair xbounds=(-.2,3.3);
pair ybounds=(-4.5,4.5);
pair zbounds=(-4.5,4.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,invisible,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
//label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//  \addplot3[domain=1:3,y domain=0:1,surf,shader=flat,colormap={mp2}{\colormapone}]
//  (x,0,{y*((2*x-1)-(x^2-2*x+2))+x^2-2*x+2});


triple g1(real t) {return (t,(2*t-1),0);}
path3 p1=graph(g1,1,3,operator ..);
draw(p1,rgb(.1,.1,.1)+.4mm);

triple g2(real t) {return (t,(t^2-2*t+2),0);}
path3 p2=graph(g2,3,1,operator ..);
draw(p2,rgb(.3,.3,.3)+.4mm);

path3 p3=p1--p2;
draw(surface(p3 -- cycle), emissive(simplesurfacepen+opacity(0.2)));


triple f2(pair t) {return (2,cos(t.x)*t.y,sin(t.x)*t.y);}
surface s2=surface(f2,(0,2),(2*pi,3),16,1,Spline);
draw(s2,emissive(simplesurfacepen+opacity(.5)));

triple g3(real t) {return (2,2*cos(t),2*sin(t));}
path3 p3=graph(g3,0,2*pi,operator ..);
draw(p3,rgb(.3,.3,.3)+.4mm);

triple g3(real t) {return (2,3*cos(t),3*sin(t));}
path3 p3=graph(g3,0,2*pi,operator ..);
draw(p3,rgb(.1,.1,.1)+.4mm);

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




