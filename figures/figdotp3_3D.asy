import graph3;

//ASY file for figdotp3.asy in Chapter 10

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(23,7.4,3.8);
defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");

// setup and draw the axes
real[] myxchoice={-5,5};
real[] myychoice={2,4};
real[] myzchoice={-2,2,4};
defaultpen(0.5mm);
pair xbounds=(-5.5,5.5);
pair ybounds=(-1,4.5);
pair zbounds=(-2.5,4.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

// Draw the lines for vec{u}=<1,1,1>
draw((0,0,1)--(0,1,1)--(1,1,1)--(1,0,1)--(0,0,1), dashed+linewidth(.5)+blue);//top 
draw((0,0,0)--(0,1,0)--(1,1,0)--(1,0,0)--(0,0,0), dashed+linewidth(.5)+blue);//bottom 
draw((1,0,0)--(1,0,1), dashed+linewidth(.5)+blue);//up1 
draw((0,1,0)--(0,1,1), dashed+linewidth(.5)+blue);//up2 
draw((1,1,0)--(1,1,1), dashed+linewidth(.5)+blue);//up3 
draw((0,0,0)--(1,1,1), blue,Arrow3(size=2mm));
label("$\vec{u}$",(1,1,1),E);
//dotfactor=3;  dot((2,1,1),blue);

// Draw the lines for \vec{v}=<-1,3,-2>
draw((0,0,-2)--(0,3,-2)--(-1,3,-2)--(-1,0,-2)--(0,0,-2), dashed+linewidth(.5)+red);//top 
draw((0,0,0)--(0,3,0)--(-1,3,0)--(-1,0,0)--(0,0,0), dashed+linewidth(.5)+red);//bottom 
draw((-1,0,0)--(-1,0,-2), dashed+linewidth(.5)+red);//up1 
draw((0,3,0)--(0,3,-2), dashed+linewidth(.5)+red);//up2
draw((-1,3,0)--(-1,3,-2), dashed+linewidth(.5)+red);//up3 
draw((0,0,0)--(-1,3,-2),red,Arrow3(size=2mm));
label("$\vec{v}$",(-1,3,-2),E);

// Draw the lines for \vec{w}=<-5,1,4>
draw((0,0,4)--(0,1,4)--(-5,1,4)--(-5,0,4)--(0,0,4), dashed+linewidth(.5)+orange);//top 
draw((0,0,0)--(0,1,0)--(-5,1,0)--(-5,0,0)--(0,0,0), dashed+linewidth(.5)+orange);//bottom 
draw((-5,0,0)--(-5,0,4), dashed+linewidth(.5)+orange);//up1 
draw((0,1,0)--(0,1,4), dashed+linewidth(.5)+orange);//up2
draw((-5,1,0)--(-5,1,4), dashed+linewidth(.5)+orange);//up3 
draw((0,0,0)--(-5,1,4), orange,Arrow3(size=2mm));
label("$\vec{w}$",(-5,1,4),E);


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
