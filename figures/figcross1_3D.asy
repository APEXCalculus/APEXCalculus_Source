import graph3;

//ASY file for figcross1.asy in Chapter 7


size(100,100,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(3.4,5.4,.9);
defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");

// setup and draw the axes
real[] myxchoice={1,2};
real[] myychoice={1,2,3};
real[] myzchoice={1};
defaultpen(0.5mm);

pair xbounds=(-0.25,2.5);
pair ybounds=(-0.25,2.5);
pair zbounds=(-0.25,1.5);

//xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
//yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
//zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

//label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
//label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
//label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));


triple f(pair t) {
  return (t.y*(cos(t.x)*(1.5+.5*cos(t.x)*sin(3*t.x))+.5*sin(t.x)*(1.5+.5*cos(t.x)*sin(3*t.x))),t.y*(sin(t.x)*(1.5+.5*cos(t.x)*sin(3*t.x))),0);
}
surface s=surface(f,(0,0),(2*pi,1),16,2,Spline);
pen p=rgb(0,0,.7);
draw(s,rgb(.2,.2,1)+opacity(.7),meshpen=p);

triple f(pair t) {
  return (cos(t.x)*(1.5+.5*cos(t.x)*sin(3*t.x))+.5*sin(t.x)*(1.5+.5*cos(t.x)*sin(3*t.x)),sin(t.x)*(1.5+.5*cos(t.x)*sin(3*t.x)),t.y);
}
surface s=surface(f,(0,0),(2*pi,1),16,2,Spline);
pen p=rgb(0,0,.7);
draw(s,rgb(.6,.6,1)+opacity(.4),meshpen=p);

triple f(pair t) {
  return (t.y*(cos(t.x)*(1.5+.5*cos(t.x)*sin(3*t.x))+.5*sin(t.x)*(1.5+.5*cos(t.x)*sin(3*t.x))),t.y*(sin(t.x)*(1.5+.5*cos(t.x)*sin(3*t.x))),1);
}
surface s=surface(f,(0,0),(2*pi,1),16,2,Spline);
pen p=rgb(0,0,.7);
draw(s,rgb(.6,.6,1)+opacity(.7),meshpen=p);

triple g(real t) {return (cos(t)*(1.5+.5*cos(t)*sin(3*t))+.5*sin(t)*(1.5+.5*cos(t)*sin(3*t)),sin(t)*(1.5+.5*cos(t)*sin(3*t)),1);}
path3 mypath=graph(g,0,2*pi,operator ..);
draw(mypath,blue+linewidth(2));

triple g(real t) {return (cos(t)*(1.5+.5*cos(t)*sin(3*t))+.5*sin(t)*(1.5+.5*cos(t)*sin(3*t)),sin(t)*(1.5+.5*cos(t)*sin(3*t)),0);}
path3 mypath=graph(g,0,2*pi,operator ..);
draw(mypath,blue+linewidth(2));

label("base area $= A$",(2,2,-.1));
label("Volume $=A\cdot h$",(2,2,-.4));
label("$h$",(-1.9,0,.5));

// ////////////////////////////////////
//    SAMPLE CODE

// defaultpen(fontsize(10pt));

//real f(pair z) {return -z.x^4+2*z.x^2-z.y^4+2*z.y^2;}
//surface s=surface(f,(-1.5,-1.5),(1.5,1.5),Spline);
//pen p=rgb(0,0,.7);
//draw(s,rgb(.6,.6,1)+opacity(.7),meshpen=p);

//triple f(pair t) {
//  return (cos(t.x)*1.5*cos(t.y),sin(t.x)*cos(t.y),sin(t.y));
//}
//surface s=surface(f,(0,0),(pi,2*pi),8,8,Spline);
//pen p=rgb(0,0,.7);
//draw(s,rgb(.6,.6,1)+opacity(.7),meshpen=p);

//draw(s,paleblue);
//draw(s,lightblue,meshpen=black+thick(),nolight,render(merge=true));
//draw(mypath,2bp+blue);

//triple g(real t) {return (t,t,-2*t^4+4*t^2);}
//path3 mypath=graph(g,-1,1,operator ..);
//draw(mypath,blue+dashed+linewidth(2));

//pen p=rgb(0,0,1);
//draw(s,paleblue+opacity(.5),meshpen=p,render(merge=true));
