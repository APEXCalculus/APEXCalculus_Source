import graph3;

//ASY file for figdoublepol43D.asy in Chapter 13


size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,2);
defaultrender.merge=true;

// setup and draw the axes
real[] myxchoice={};
real[] myychoice={};
real[] myzchoice={};
defaultpen(0.5mm);

pair xbounds=(-2,2);
pair ybounds=(-2,2);
pair zbounds=(-2,2);

//xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
//yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
//zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

//label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
//label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
//label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//plane is z=1-x+0.1y
//Draw the surface
//({cos(3*x)*cos(x)},{cos(3*x)*sin(x)},{(1-cos(3*x)*cos(x)+.1*cos(3*x)*sin(x))*y});
triple f(pair t) {
  return (cos(3*t.x)*cos(t.x),cos(3*t.x)*sin(t.x),(1-cos(3*t.x)*cos(t.x)+.1*cos(3*t.x)*sin(t.x))*t.y);
}
surface s=surface(f,(0,0),(2*pi,1),32,32,Spline);
pen p=rgb(0,0,.7);
draw(s,rgb(.6,.6,1)+opacity(.7),meshpen=p);

//draw curve on xy plane //({cos(3*x)*cos(x)},{cos(3*x)*sin(x)},{0})
triple g(real t) {return (cos(3*t)*cos(t),cos(3*t)*sin(t),0);}
path3 mypath=graph(g,0,pi,operator ..);
draw(mypath,blue+linewidth(2));


//draw curves on surface
triple g(real t) {return (cos(3*t)*cos(t),cos(3*t)*sin(t),1-(cos(3*t)*cos(t))+0.1*(cos(3*t)*sin(t)));}
path3 mypath=graph(g,0,pi,operator ..);
draw(mypath,blue+linewidth(2));


//Shade the bottom
import three;
path3 p =  (0,0,0)..(.175,0.064,0)..(.264,.119,0)..(0.683,0.183,0)..(.916,0.121,0)..(1,0,0)..(.916,-0.121,0)..(0.683,-0.183,0)..(.264,-.119,0)..(.175,-0.086,0); 
draw(surface(p -- cycle), emissive(rgb(.6,.6,1)+opacity(0.7)));

path3 p = (0,0,0)..(-0.1429, 0.1196,0)..(-0.2351, 0.1691,0)..(-0.5000, 0.5000,0)..(-0.5628, 0.7328,0)..(-0.5000, 0.8660,0)..(-0.3532, 0.8538,0)..(-0.1830, 0.6830,0)..(-0.0289, 0.2881,0)..(-0.0130, 0.1946,0);
draw(surface(p -- cycle), emissive(rgb(.6,.6,1)+opacity(0.7)));

path3 p = (0,0,0)..(-0.0321,-0.1836,0)..(-0.0289,-0.2881,0)..(-0.1830,-0.6830,0)..(-0.3532,-0.8538,0)..(-0.5000,-0.8660,0)..(-0.5628,-0.7328,0)..(-0.5000,-0.5000,0)..(-0.2351,-0.1691,0)..(-0.1620,-0.1086,0);
draw(surface(p -- cycle), emissive(rgb(.6,.6,1)+opacity(0.7)));

//Shade the top
path3 p = (0,0,1.0000)..(-0.1429,0.1196,1.1549)..(-0.2351,0.1691,1.2520)..(-0.5000,0.5000,1.5500)..(-0.5628,0.7328,1.6361)..(-0.5000,0.8660,1.5866)..(-0.3532,0.8538,1.4386)..(-0.1830 ,0.6830 ,1.2513)..(-0.0289,0.2881,1.0578)..(-0.0130,0.1946,1.0325);

draw(surface(p -- cycle), emissive(rgb(.6,.6,1)+opacity(0.7)));
path3 p = (0 ,        0  ,  1.0000)..(-0.0321 ,  -0.1836 ,   1.0137)..(-0.0289,   -0.2881,    1.0001)..(-0.1830,   -0.6830,    1.1147)..(-0.3532  , -0.8538 ,   1.2678)..(-0.5000,   -0.8660 ,   1.4134)..(-0.5628 ,  -0.7328,    1.4895)..(-0.5000 ,  -0.5000 ,   1.4500)..(-0.2351 ,  -0.1691 ,   1.2181)..(-0.1620 ,  -0.1086,    1.1511);
draw(surface(p -- cycle), emissive(rgb(.6,.6,1)+opacity(0.7)));

path3 p = (0 ,        0,    1.0000)..( 0.1750,    0.0640 ,   0.8314)..( 0.2640,    0.1190 ,   0.7479)..( 0.6830,    0.1830 ,   0.3353)..( 0.9160,    0.1210 ,   0.0961)..( 1.0000,         0 ,        0)..( 0.9160,   -0.1210 ,   0.0719)..( 0.6830,   -0.1830 ,   0.2987)..( 0.2640,   -0.1190 ,   0.7241)..( 0.1750,   -0.0860 ,   0.8164);
draw(surface(p -- cycle), emissive(rgb(.6,.6,1)+opacity(0.7)));



//path3 p =  (0,0,0)-- (1,1,0) -- (1,2,1) -- (0,1,1); //bottom
//draw(surface(p -- cycle), emissive(rgb(.6,.6,1)+opacity(0.7)));
//path3 p =  (-1,1,0)-- (0,2,0) -- (0,3,1) -- (-1,2,1); //right
//draw(surface(p -- cycle), emissive(rgb(.6,.6,1)+opacity(0.7)));
//path3 p =  (0,0,0)-- (-1,1,0) -- (-1,2,1) -- (0,1,1); //back
//draw(surface(p -- cycle), emissive(rgb(.6,.6,1)+opacity(0.7)));
//path3 p =  (1,1,0)-- (0,2,0) -- (0,3,1) -- (1,2,1); //front
//draw(surface(p -- cycle), emissive(rgb(.6,.6,1)+opacity(0.7)));
//path3 p =  (0,1,1)-- (1,2,1) -- (0,3,1) -- (-1,2,1); //top
//draw(surface(p -- cycle), emissive(rgb(.6,.6,1)+opacity(0.7)));


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
