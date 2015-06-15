import graph3;

//ASY file for figspace_tangent_intro3D.asy in Chapter 12

size(200,200,IgnoreAspect);
//size(200,200,Aspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(8,8,13);
defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");


// setup and draw the axes
real[] myxchoice={2};
real[] myychoice={2};
real[] myzchoice={10};
defaultpen(0.5mm);
pair xbounds=(-0.5,3);
pair ybounds=(-0.5,3);
pair zbounds=(-0.5,11);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw surface z=-x^2-.5*(y^2)+x*y+10 //(x,y,{-x^2-.5*(y^2)+x*y+10});
triple f(pair t) {
  return (t.x,t.y,-t.x^2-.5*(t.y^2)+t.x*t.y+10);
}
surface s=surface(f,(0,0),(3,3),16,16,Spline);
pen p=rgb(0,0,.7);
draw(s,rgb(.6,.6,1)+opacity(.7),meshpen=p);

//plot point on surface
dotfactor=3;dot((2,1,7.5));

//Draw traces on the surface
triple g(real t) {return (2,t,-4-0.5*t^2+2*t+10);}//-x^2-.5*(y^2)+x*y+10
path3 mypath=graph(g,0,3,operator ..); draw(mypath,blue);
triple g(real t) {return (t,1,-t^2-0.5+t+10);}//-x^2-.5*(y^2)+x*y+10
path3 mypath=graph(g,0,3,operator ..); draw(mypath,blue);
triple g(real t) {return (t,3-t,-t^2-0.5*(3-t)^2+(3-t)*t+10);}
path3 mypath=graph(g,0,3,operator ..); draw(mypath,blue);


//Draw tangent lines on the surface with gradient (-3,1)
//L1 = (2,1,7.5)+t(1,0,-3) for t=-1,1
draw((1,1,10.5)--(3,1,4.5),red);
//L2 = (2,1,7.5)+t(0,1,1) for t=-1,1
draw((2,0,6.5)--(2,2,8.5),red);
//L3 = (2,1,7.5)+t(0.707,-0.707,-2.828) for t=-1,1
draw((1.293,1.707,10.328)--(2.707,0.293,4.672),red);


// ////////////////////////////////////
//    SAMPLE CODE

// defaultpen(fontsize(10pt));

//Draw the parabola z=y^2 for t from -2 to 2
//triple g(real t) {return (0,t,t^2);}
//path3 mypath=graph(g,-2,2,operator ..); draw(mypath,blue);


//Draw the surface z=1/(1+x^2+y^2)
//triple f(pair t) {
//  return (t.x,t.y,1/(1+(t.x)^2+(t.y)^2));
//}
//surface s=surface(f,(-2,-2),(2,2),8,8,Spline);
//pen p=rgb(0,0,.7);
//draw(s,rgb(.6,.6,1)+opacity(.7),meshpen=p);


//real f(pair z) {return -z.x^4+2*z.x^2-z.y^4+2*z.y^2;}
//surface s=surface(f,(-1.5,-1.5),(1.5,1.5),Spline);

//triple f(pair t) {
//  return (cos(t.x)*1.5*cos(t.y),sin(t.x)*cos(t.y),sin(t.y));
//}
//surface s=surface(f,(0,0),(pi,2*pi),8,8,Spline);

//triple g(real t) {return (t,t,-2*t^4+4*t^2);}
//path3 mypath=graph(g,-2,2,operator ..);

//pen p=rgb(0,0,1);
//draw(s,paleblue+opacity(.5),meshpen=p,render(merge=true));

//draw(s,paleblue);
//draw(s,lightblue,meshpen=black+thick(),nolight,render(merge=true));
//draw(mypath,2bp+blue);