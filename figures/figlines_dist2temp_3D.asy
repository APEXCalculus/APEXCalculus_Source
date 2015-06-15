import graph3;

//ASY file for figlines_dist2temp3D.asy in Chapter 10
//  TRYING TO FIGURE OUT HOW BEST TO CREATE figlines_dist23D.asy


//size(200,200,IgnoreAspect);
size(200,200,Aspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,2);
defaultrender.merge=true;

// setup and draw the axes
//real[] myxchoice={};
//real[] myychoice={};
//real[] myzchoice={};
defaultpen(0.5mm);
//pair xbounds=(-1,4.5);
//pair ybounds=(-1,11);
//pair zbounds=(-5.5,5.5);

//xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
//yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
//zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

//label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
//label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
//label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));


//draw the lines L1 <1,2,1>+t<2,-1,1>  and L2 <3,3,3>+t<4,2,-2>
//draw((-5,5,-2)--(7,-1,4),blue);//L1  t=-3 to t=3
//draw((-9,-3,9)--(15,9,-3),blue);//L2  t=-3 to t=3
draw((-1,3,0)--(9,-2,5),blue);//L1  t=-1 to t=4
draw((-1,1,5)--(19,11,-5),blue);//L2  t=-1 to t=4

//draw vector P1 (t=2) to P2 (t=2)
draw((5,0,3)--(11,7,-1),black,Arrow3(size=3mm));
label("$\overrightarrow{P_1 P_2}$",(7,4,1),N);
dotfactor=3;dot((5,0,3));label("$P_1$",(5,0,3),N);dot((11,7,-1));label("$P_2$",(11,7,-1),S);

//draw d_1 and d_2 at P_1, P_2 resp.
draw((5,0,3)--(7,-1,4),red+linewidth(2),Arrow3(size=3mm));label("$\vec{d_1}$",(7,-1,4),N);//d1
draw((11,7,-1)--(15,9,-3),red+linewidth(2),Arrow3(size=3mm));label("$\vec{d_2}$",(15,9,-3),N);//d2

//draw the vector c = d1 cross d2 = <0,8,8> to show the closest approach between lines
//draw();// GUESS: try putting c/8 at point on with L1 with t=0.75
//NEVERMIND, JUST FUDGE IT BETWEEN THE LINES WITH TWO POINTS, L1 w t=0.75, L2 w t=-0.15
draw((2.5,1.25,1.75)--(2.4,2.7,3.3),dashed+linewidth(0.75)); //from L1 to L2
label("$h$",(2.425,2.3375,2.9125),W); //
draw((2.5,1.25,1.75)--(2.45,1.975,2.525),red+linewidth(2),Arrow3(size=3mm));// c
label("$\vec{c}$",(2.45,1.975,2.525),E); //




// ////////////////////////////////////
//    SAMPLE CODE

// defaultpen(fontsize(10pt));

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