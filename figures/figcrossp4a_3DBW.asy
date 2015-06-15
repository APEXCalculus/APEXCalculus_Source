import graph3;
import apexstyle;


//ASY file for figcrossp4a.asy in Chapter 10
// CAN'T FILL IT IN WITH ''fill'' (only in 2d)

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
//currentprojection=orthographic(4,4,2);
currentprojection=orthographic(7.5,14,4);
defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");


// setup and draw the axes
real[] myxchoice={2,4};
real[] myychoice={2,4};
real[] myzchoice={2};
defaultpen(0.5mm);
pair xbounds=(-0.5,4.5);
pair ybounds=(-0.5,4.5);
pair zbounds=(-0.5,3.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the edges of the parallelogram with corners at (1,1,1),(2,3,2),(4,5,3),(3,3,2)
draw((1,1,1)--(2,3,2)--(4,5,3)--(3,3,2)--cycle);
label("A",(1,1,1),S);
label("B",(2,3,2),N);
label("C",(4,5,3),N);
label("D",(3,3,2),W);

// Fill in the parallelogram
//I changed the viewpoint to (1,4,1), then added://Hartman comment
 triple f(pair t) {return (1+t.x+2t.y,1+2t.x+2t.y,1+t.x+t.y);}
surface s=surface(f,(0,0),(1,1),1,1);
pen p=rgb(0,0,.7);
draw(s,emissive(surfacepen),meshpen=apexmeshpen);







// ////////////////////////////////////
//    SAMPLE CODE

// defaultpen(fontsize(10pt));

//real f(pair z) {return -z.x^4+2*z.x^2-z.y^4+2*z.y^2;}
//surface s=surface(f,(-1.5,-1.5),(1.5,1.5),Spline);

//triple f(pair t) {
//  return (cos(t.x)*1.5*cos(t.y),sin(t.x)*cos(t.y),sin(t.y));
//}
//surface s=surface(f,(0,0),(pi,2*pi),8,8,Spline);

//draw(s,palergb(.1,.1,.1));
//draw(s,lightrgb(.1,.1,.1),meshpen=black+thick(),nolight,render(merge=true));
//draw(mypath,2bp+rgb(.1,.1,.1));

//triple g(real t) {return (t,t,-2*t^4+4*t^2);}
//path3 mypath=graph(g,-1,1,operator ..);

//pen p=rgb(0,0,1);
//draw(s,palergb(.1,.1,.1)+opacity(.5),meshpen=p,render(merge=true));