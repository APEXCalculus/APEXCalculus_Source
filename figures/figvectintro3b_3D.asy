import graph3;

//ASY file for figvectintro3b.pdf in Chapter 10.1

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(5,9,2);
defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");

// setup and draw the axes
real[] myxchoice={2};
real[] myychoice={2};
real[] myzchoice={-2,4};
defaultpen(0.5mm);

pair xbounds=(-1,3.5);
pair ybounds=(-1,2.5);
pair zbounds=(-1,5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));




// Draw the lines for Q=(1,1,1)
draw((0,0,1)--(0,1,1)--(1,1,1)--(1,0,1)--(0,0,1), red+dashed+linewidth(.5));//top Q
draw((0,0,0)--(0,1,0)--(1,1,0)--(1,0,0)--(0,0,0), red+dashed+linewidth(.5));//bottom Q
draw((1,0,0)--(1,0,1), red+dashed+linewidth(.5));//up1 Q
draw((0,1,0)--(0,1,1), red+dashed+linewidth(.5));//up2 Q
draw((1,1,0)--(1,1,1), red+dashed+linewidth(.5));//up3 Q
label("$Q$",(1,1,1),N);
//dotfactor=3;  dot((2,1,1),blue);

// Draw the lines for Q'=(3,0,4)
draw((0,0,4)--(0,0,4)--(3,0,4)--(3,0,4)--(3,0,4), red+dashed+linewidth(.5));//top P
draw((0,0,0)--(3,0,0)--(3,0,0)--(3,0,0)--(0,0,0), red+dashed+linewidth(.5));//bottom P
draw((3,0,0)--(3,0,4), red+dashed+linewidth(.5));//up1 P
draw((0,0,0)--(0,0,3), red+dashed+linewidth(.5));//up2 P
draw((3,0,0)--(3,0,3), red+dashed+linewidth(.5));//up3 P
label("$Q'$",(3,0,4),N);
//dotfactor=3;  dot((1,4,-1),blue);

//line from P to Q
draw((1,1,1)--(3,0,4), black,Arrow3(size=2mm));


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
