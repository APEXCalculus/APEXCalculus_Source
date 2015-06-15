import graph3;

//ASY file for figcrossp6.asy in Chapter 10


size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,2);
defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");


// setup and draw the axes
real[] myxchoice={1};
real[] myychoice={2};
real[] myzchoice={0.5,1};
defaultpen(0.5mm);

pair xbounds=(-1.5,1.5);
pair ybounds=(0,3);
pair zbounds=(-0.5,1.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the parallelepiped with u=<1,1,0>, v=<-1,1,0>, w=<0,1,1>
draw((0,0,0)--(1,1,0), Arrow3(size=3mm));// u
label("$\vec{u}$",(1,1,0),W);
draw((0,0,0)--(-1,1,0), Arrow3(size=3mm));// v
label("$\vec{v}$",(-1,1,0),N);
draw((0,0,0)--(0,1,1), Arrow3(size=3mm));// w
label("$\vec{w}$",(0,1,1),W);
//shifted u to get the other edges of the box
draw((-1,1,0)--(0,2,0),blue);// u shifted to v
draw((0,1,1)--(1,2,1),blue);// u shifted to w
draw((-1,2,1)--(0,3,1),blue);// u shifted to v+w
//shifted v to get the other edges of the box
draw((1,1,0)--(0,2,0),blue);// v shifted to u
draw((0,1,1)--(-1,2,1),blue);// v shifted to w
draw((1,2,1)--(0,3,1),blue);// v shifted to u+w
//shifted w to get the other edges of the box
draw((1,1,0)--(1,2,1),blue);// w shifted to u
draw((-1,1,0)--(-1,2,1),blue);// w shifted to v
draw((0,2,0)--(0,3,1),blue);// w shifted to u+v




//my try at shading.
import three;
path3 p =  (0,0,0)-- (1,1,0) -- (0,2,0) -- (-1,1,0); //Left
draw(surface(p -- cycle), emissive(rgb(.6,.6,1)+opacity(0.5)));
path3 p =  (0,0,0)-- (1,1,0) -- (1,2,1) -- (0,1,1); //bottom
draw(surface(p -- cycle), emissive(rgb(.6,.6,1)+opacity(0.5)));
path3 p =  (-1,1,0)-- (0,2,0) -- (0,3,1) -- (-1,2,1); //right
draw(surface(p -- cycle), emissive(rgb(.6,.6,1)+opacity(0.5)));
path3 p =  (0,0,0)-- (-1,1,0) -- (-1,2,1) -- (0,1,1); //back
draw(surface(p -- cycle), emissive(rgb(.6,.6,1)+opacity(0.5)));
path3 p =  (1,1,0)-- (0,2,0) -- (0,3,1) -- (1,2,1); //front
draw(surface(p -- cycle), emissive(rgb(.6,.6,1)+opacity(0.5)));
path3 p =  (0,1,1)-- (1,2,1) -- (0,3,1) -- (-1,2,1); //top
draw(surface(p -- cycle), emissive(rgb(.6,.6,1)+opacity(0.5)));




// ////////////////////////////////////
//    SAMPLE CODE

// defaultpen(fontsize(10pt));

//real f(pair z) {return -z.x^4+2*z.x^2-z.y^4+2*z.y^2;}
//surface s=surface(f,(-1.5,-1.5),(1.5,1.5),Spline);

//triple f(pair t) {
//  return (cos(t.x)*1.5*cos(t.y),sin(t.x)*cos(t.y),sin(t.y));
//}
//surface s=surface(f,(0,0),(pi,2*pi),8,8,Spline);

//draw(s,paleblue);
//draw(s,lightblue,meshpen=black+thick(),nolight,render(merge=true));
//draw(mypath,2bp+blue);

//triple g(real t) {return (t,t,-2*t^4+4*t^2);}
//path3 mypath=graph(g,-1,1,operator ..);

//pen p=rgb(0,0,1);
//draw(s,paleblue+opacity(.5),meshpen=p,render(merge=true));
