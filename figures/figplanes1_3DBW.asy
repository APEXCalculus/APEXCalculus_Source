import graph3;
import apexstyle;


//ASY file for figlines_dist2.asy in Chapter 10
//ASY file for figplanes1.asy in Chapter 10

//size(200,200,IgnoreAspect);
size(200,200,Aspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic((1.92,19.3,4),(0,-0.015,0.06),(0,0,0),1);
defaultrender.merge=true;

usepackage("mathspec");
usepackage("esvect");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");

// setup and draw the axes
real[] myxchoice={-4,4};
real[] myychoice={-4,4};
real[] myzchoice={-4,4};
defaultpen(0.5mm);
pair xbounds=(-3.5,3.5);
pair ybounds=(-4.5,4.5);
pair zbounds=(-4.5,6.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0),S);
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the plane
triple f(pair t) {
  return (t.x,t.y,-2*t.x-t.y+3);
}
surface s=surface(f,(-1,-2),(2,3),4,4,Spline);
pen p=rgb(0,0,.7)+.2mm;
draw(s,emissive(surfacepen),meshpen=apexmeshpen);

//Draw points P=(1,1,0), Q=(1,2,-1), R=(0,1,2)
dotfactor=3;
dot((1,1,0));label("$P$",(1,1,0),N);
dot((1,2,-1));label("$Q$",(1,2,-1),W);
dot((0,1,2));label("$R$",(0,1,2),W);
//Draw Vectors
draw((1,1,0)--(1,2,-1),rgb(.1,.1,.1),Arrow3(size=2mm));//PQ
draw((1,1,0)--(0,1,2),rgb(.1,.1,.1),Arrow3(size=2mm));//PR
draw((1,1,0)--(3,2,1),rgb(.1,.1,.1),Arrow3(size=2mm));//P to PQxPR
label("$\vv{PQ}\times \vv{PR}$",(3,2,1),N);

//test i,j,k moved to P
//draw((1,1,0)--(2,1,0),rgb(.1,.1,.1),Arrow3(size=2mm));//P by i
//draw((1,1,0)--(1,2,0),rgb(.1,.1,.1),Arrow3(size=2mm));//P by j
//draw((1,1,0)--(1,1,1),rgb(.1,.1,.1),Arrow3(size=2mm));//P by k

// Use lines L1 1+3t,2-t,t  and L2 -2+4t,3+t,5+2t
//draw P1 (t=0) and vector d1 at P1 (t=1)
//dotfactor=3;dot((1,2,0));label("$P_1$",(1,2,0),N);
//draw((1,2,0)--(4,1,1),rgb(.3,.3,.3),Arrow3(size=2mm));
//label("$\vec{d}_1$",(4,1,1),N);
//draw P2 (t=-1.5) and vector d2 at P2 (t=-0.5)
//dotfactor=3;dot((-8,1.5,2));label("$P_2$",(-8,1.5,2),N);
//draw((-8,1.5,2)--(-4,2.5,4),rgb(.3,.3,.3),Arrow3(size=2mm));
//label("$\vec{d}_2$",(-4,2.5,4),N);

//draw vector P1 to P2
//draw((1,2,0)--(-8,1.5,2),black,Arrow3(size=2mm));
//label("$\overrightarrow{P_1 P_2}$",(-3.5,1.75,1),W);

//draw the lines 1+3t,2-t,t  and -2+4t,3+t,5+2t
//draw((-5,4,-2)--(7,0,2),rgb(.1,.1,.1));//L1
//draw((-14,0,-1)--(2,4,7),rgb(.1,.1,.1));//L2



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