import graph3;
import apexstyle;


//ASY file for figwash1_3D.asy in Chapter 7


size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic((3.13,8.3,49),(0,1,0),(0,0,0),.95,(0.0148,0.00673));
defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");

// setup and draw the axes
real[] myxchoice={1};
real[] myychoice={1,2,3};
real[] myzchoice={};
defaultpen(0.5mm);

pair xbounds=(-.2,1.25);
pair ybounds=(-3.4,3.4);
pair zbounds=(-3.4,3.4);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,invisible,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
//label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//  \addplot3[domain=1:3,y domain=0:1,surf,shader=flat,colormap={mp2}{\colormapone}]
//  (x,0,{y*((2*x-1)-(x^2-2*x+2))+x^2-2*x+2});

pen p=rgb(0,0,.7);

triple f2(pair t) {return (t.x,(2*t.x+1)*cos(t.y),(2*t.x+1)*sin(t.y));}
surface s2=surface(f2,(0,0),(1,2*pi),2,16,Spline);
//draw(s2,emissive(rgb(.6,.6,1)+opacity(.5)));

triple f3(pair t) {return (t.x,cos(t.y),sin(t.y));}
surface s3=surface(f3,(0,0),(1,2*pi),2,16,Spline);
//draw(s3,rgb(.6,.6,1)+opacity(.8));

triple f4(pair t) {return (t.x,1.8*cos(t.y),1.8*sin(t.y));}
surface s4=surface(f4,(.4,0),(1,2*pi),2,16,Spline);
draw(s4,emissive(simplesurfacepen));

triple g3(real t) {return (.4,1.8*cos(t),1.8*sin(t));}
path3 p3=graph(g3,0,2*pi,operator ..);
draw(p3,rgb(.3,.3,.3)+.4mm);

triple g3(real t) {return (1,1.8*cos(t),1.8*sin(t));}
path3 p3=graph(g3,0,2*pi,operator ..);
draw(p3,rgb(.3,.3,.3)+.4mm);

draw((0,1,0)--(1,3,0)--(1,1,0)--cycle,rgb(.1,.1,.1)+.6mm);

draw((.4,1.8,0)--(1,1.8,0),rgb(.3,.3,.3)+.4mm);

triple g3(real t) {return (0,cos(t),sin(t));}
path3 p3=graph(g3,0,2*pi,operator ..);
//draw(p3,rgb(.1,.1,.1)+.4mm);

triple g3(real t) {return (1,cos(t),sin(t));}
path3 p3=graph(g3,0,2*pi,operator ..);
//draw(p3,rgb(.1,.1,.1)+.4mm);

triple g3(real t) {return (1,3*cos(t),3*sin(t));}
path3 p3=graph(g3,0,2*pi,operator ..);
//draw(p3,rgb(.1,.1,.1)+.4mm);

//triple g3(real t) {return (2,3*cos(t),3*sin(t));}
//path3 p3=graph(g3,0,2*pi,operator ..);
//draw(p3,rgb(.1,.1,.1)+.4mm);

//draw((2,2,0)--(2,3,0),purple+linetype(new real[] {4,4})+.3mm);

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






