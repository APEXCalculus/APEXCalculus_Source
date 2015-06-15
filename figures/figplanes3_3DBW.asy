import graph3;
import apexstyle;


//ASY file for figplanes3.asy in Chapter 10

size(200,200,Aspect);
//size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,2);
defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");


// setup and draw the axes
real[] myxchoice={-3,3};
real[] myychoice={-3,3};
real[] myzchoice={-3,3};
defaultpen(0.5mm);
pair xbounds=(-4,4);
pair ybounds=(-4,4);
pair zbounds=(-4,4);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the plane z=-(x+1)/2-y+1
triple f(pair t) {
  return (t.x,t.y,(-1/2)*(t.x+1)-t.y+1);
}
surface s=surface(f,(-3,-3),(3,3),4,4,Spline);
pen p=rgb(0,0,.7)+.1mm;
draw(s,emissive(surfacepen),meshpen=apexmeshpen);

//Draw points P=(-1,0,1)
dotfactor=3;dot((-1,0,1));label("$P$",(-1,0,1),N);

//draw the line -1+t,2t,1+2t 
draw((1,4,5)--(-3,-4,-3),rgb(.1,.1,.1));//L t=2 to t=-2




//Draw normal vector at P, n=(1,2,2)
//draw((-1,3,0)--(4,7,-7),black,Arrow3(size=2mm));//n at P
//label("$\vec{n}$",(4,7,-7),W);


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
//draw(s,palergb(.1,.1,.1)+opacity(.5),meshpen=p,render(merge=true));

//draw(s,palergb(.1,.1,.1));
//draw(s,lightrgb(.1,.1,.1),meshpen=black+thick(),nolight,render(merge=true));
//draw(mypath,2bp+rgb(.1,.1,.1));