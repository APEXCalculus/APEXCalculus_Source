import graph3;

//ASY file for figdoublepol53D.asy in Chapter 13


size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(8,-13,2.8);
defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");

// setup and draw the axes
real[] myxchoice={2,4};
real[] myychoice={2,4};
real[] myzchoice={0.5,1};
defaultpen(0.5mm);

pair xbounds=(0,5.5);
pair ybounds=(0,5.5);
pair zbounds=(0,1.25);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the surface //(z=1/(1+x^2+y^2);
triple f(pair t) {
  return (t.x,t.y,1/(1+t.x^2+t.y^2));
}
surface s=surface(f,(-0.25,-0.25),(5,5),16,16,Spline);
pen p=rgb(0,0,.7);
draw(s,rgb(.6,.6,1)+opacity(.7),meshpen=p);

//draw curves on xy plane
triple g(real t) {return (2.5*cos(t),2.5*sin(t),0);}
path3 mypath=graph(g,0,pi/2,operator ..);
draw(mypath,blue+dashed+linewidth(0.75));
label("$a$",(2.7,-0.2,0),S);

//draw curves on surface
triple g(real t) {return (2.5*cos(t),2.5*sin(t),1/(1+2.5^2));}
path3 mypath=graph(g,0,pi/2,operator ..);
draw(mypath,blue+linewidth(2));
triple g(real t) {return (t,0,1/(1+t^2));}
path3 mypath=graph(g,0,2.5,operator ..);
draw(mypath,blue+linewidth(2));
triple g(real t) {return (0,t,1/(1+t^2));}
path3 mypath=graph(g,0,2.5,operator ..);
draw(mypath,blue+linewidth(2));

//draw connecting lines
draw((2.5,0,0) -- (2.5,0,1/(1+2.5^2)),blue+dashed+linewidth(0.75));
draw((0,2.5,0) -- (0,2.5,1/(1+2.5^2)),blue+dashed+linewidth(0.75));



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
//draw(mypath,blue+linewidth(2));

//pen p=rgb(0,0,1);
//draw(s,paleblue+opacity(.5),meshpen=p,render(merge=true));
