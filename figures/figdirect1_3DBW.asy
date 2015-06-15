import graph3;
import apexstyle;


//ASY file for figdirect13D.asy in Chapter 12

size(200,200,IgnoreAspect);
//size(200,200,Aspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(16,5,25);
defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");


// setup and draw the axes
real[] myxchoice={4};
real[] myychoice={4};
real[] myzchoice={10};
defaultpen(0.5mm);
pair xbounds=(-0.5,4.75);
pair ybounds=(-0.5,4.75);
pair zbounds=(0,15);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw surface z=14-x^2-y^2
triple f(pair t) {
  return (t.x,t.y,14-t.x^2-t.y^2);
}
surface s=surface(f,(0,0),(2,2.5),6,5,Spline);
pen p=rgb(0,0,.7);
draw(s,emissive(surfacepen),meshpen=apexmeshpen);

//plot point P and on curve and point Q
dotfactor=3;dot((1,2,9));
dot((1,2,0));
label("$P$",(1,2,0),N);
dot((3,4,0));
label("$Q$",(3,4,0),N);

//draw grid lines
draw((0,1,0)--(4.5,1,0),gray+linewidth(.5));
draw((0,2,0)--(4.5,2,0),gray+linewidth(.5));
draw((0,3,0)--(4.5,3,0),gray+linewidth(.5));
draw((0,4,0)--(4.5,4,0),gray+linewidth(.5));
draw((1,0,0)--(1,4.5,0),gray+linewidth(.5));
draw((2,0,0)--(2,4.5,0),gray+linewidth(.5));
draw((3,0,0)--(3,4.5,0),gray+linewidth(.5));
draw((4,0,0)--(4,4.5,0),gray+linewidth(.5));


//Draw the vectors in the plane from P
draw((1,2,0)--(1.707,2.707,0),Arrow3(size=2mm));//P to u1
label("$\vec{u}_1$",(1.707,2.707,0),E);//u1
draw((1,2,0)--(1.894,1.553,0),Arrow3(size=2mm));//P to u2
label("$\vec{u}_2$",(1.894,1.553,0),S);//u2
draw((1,2,0)--(0.552,1.106,0),Arrow3(size=2mm));//P to u3
label("$\vec{u}_3$",(0.552,1.106,0),W);//u3


//Draw the vectors on the surface above P
draw((1,2,9)--(1.707,2.707,4.76),Arrow3(size=2mm));//P to u1
draw((1,2,9)--(1.894,1.553,9),Arrow3(size=2mm));//P to u2
draw((1,2,9)--(0.552,1.106,13.47),Arrow3(size=2mm));//P to u3






// ////////////////////////////////////
//    SAMPLE CODE

// defaultpen(fontsize(10pt));

//Draw the parabola z=y^2 for t from -2 to 2
//triple g(real t) {return (0,t,t^2);}
//path3 mypath=graph(g,-2,2,operator ..); draw(mypath,rgb(.1,.1,.1));


//Draw the surface z=1/(1+x^2+y^2)
//triple f(pair t) {
//  return (t.x,t.y,1/(1+(t.x)^2+(t.y)^2));
//}
//surface s=surface(f,(-2,-2),(2,2),8,8,Spline);
//pen p=rgb(0,0,.7);
//draw(s,emissive(surfacepen),meshpen=apexmeshpen);


//real f(pair z) {return -z.x^4+2*z.x^2-z.y^4+2*z.y^2;}
//surface s=surface(f,(-1.5,-1.5),(1.5,1.5),Spline);

//triple f(pair t) {
//  return (cos(t.x)*1.5*cos(t.y),sin(t.x)*cos(t.y),sin(t.y));
//}
//surface s=surface(f,(0,0),(pi,2*pi),8,8,Spline);

//triple g(real t) {return (t,t,-2*t^4+4*t^2);}
//path3 mypath=graph(g,-2,2,operator ..);

//pen p=rgb(0,0,1);
//draw(s,palergb(.1,.1,.1)+opacity(.5),meshpen=p,render(merge=true));

//draw(s,palergb(.1,.1,.1));
//draw(s,lightrgb(.1,.1,.1),meshpen=black+thick(),nolight,render(merge=true));
//draw(mypath,2bp+rgb(.1,.1,.1));