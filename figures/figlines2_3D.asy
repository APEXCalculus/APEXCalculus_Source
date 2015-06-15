import graph3;

//ASY file for figlines2.asy in Chapter 10

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
real[] myxchoice={-5,5};
real[] myychoice={-5,5};
real[] myzchoice={-5,5};
defaultpen(0.5mm);
pair xbounds=(-5.5,5.5);
pair ybounds=(-5.5,5.5);
pair zbounds=(-1,6);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//draw P1 and vector d1 at P1
dotfactor=3;dot((1,2,0));label("$P_1$",(1,2,0),S);
draw((1,2,0)--(4,1,1),black,Arrow3(size=2mm));
label("$\vec{d}_1$",(4,1,1),N);

//draw P2 and vector d2 at P2
dotfactor=3;dot((-2,3,5));label("$P_2$",(-2,3,5),N);
draw((-2,3,5)--(2,4,7),black,Arrow3(size=2mm));
label("$\vec{d}_2$",(2,4,7),S);

//draw the line L1 ({1+3t},{2-t},{t}) in two parts, before P1 and after P1+d1
draw((-2,3,-1)--(1,2,0),blue);
draw((4,1,1)--(7,0,2),blue);
label("$\ell_1$",(7,0,2),S);

//draw the line L2 ({-2+4t},{3+t},{5+2t}) in two parts, before P2 and after P2+d2
draw((-6,2,3)--(-2,3,5),blue);
draw((2,4,7)--(6,5,9),blue);
label("$\ell_2$",(-6,2,3),S);


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