import graph3;

//ASY file for figdoublesummary3D.asy in Chapter 13


size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,2);
defaultrender.merge=true;

// setup and draw the axes
real[] myxchoice={2};
real[] myychoice={-1,1};
real[] myzchoice={1};
defaultpen(0.5mm);

pair xbounds=(0,2.5);
pair ybounds=(-1.25,1.25);
pair zbounds=(0,1.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the surface//({cos(x)*(1+cos(2*x))},{sin(x)*(1+cos(2*x))},y);
triple f(pair t) {
  return (cos(t.x)*(1+cos(2*t.x)),sin(t.x)*(1+cos(2*t.x)),t.y);
}
surface s=surface(f,(-pi/2,0),(pi/2,1),16,8,Spline);
pen p=rgb(0,0,.7);
draw(s,rgb(1,.4,.7)+opacity(.7),meshpen=p);

//draw plane at z=1
triple f(pair t) {
  return (t.x,t.y,1);
}
surface s=surface(f,(-0.25,-1.5),(2.25,1.5),16,8,Spline);
pen p=rgb(0,0,.7);
draw(s,rgb(.6,.6,1)+opacity(.7),meshpen=p);


//draw curve on xy plane
triple g(real t) {return (cos(t)*(1+cos(2*t)),sin(t)*(1+cos(2*t)),0);}
path3 mypath=graph(g,-pi/2,pi/2,operator ..);
draw(mypath,blue+linewidth(2));


//draw curve on plane z=1
triple g(real t) {return (cos(t)*(1+cos(2*t)),sin(t)*(1+cos(2*t)),1);}
path3 mypath=graph(g,-pi/2,pi/2,operator ..);
draw(mypath,blue+linewidth(2));





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
