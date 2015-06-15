import graph3;

//ASY file for figdotp4b.asy in Chapter 10

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);

// The text calls for two viewpoints of this picture to show orthogonality
// The two projections below give those two views
//  view "b", saved as figdotp4b_3D
//currentprojection=orthographic(8,2,5);

//  view "c", saved as figdotp4c_3D
currentprojection=orthographic(2,8,6);
defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");


// setup and draw the axes
real[] myxchoice={2};
real[] myychoice={2};
real[] myzchoice={2};
defaultpen(0.5mm);
pair xbounds=(-0.5,2.5);
pair ybounds=(-1,2.5);
pair zbounds=(-0.5,3);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

// Draw the lines for vec{x}=<1,1,1>
//draw((0,0,1)--(0,1,1)--(1,1,1)--(1,0,1)--(0,0,1), dashed+linewidth(.5));//top 
draw((0,0,0)--(0,1,0)--(1,1,0)--(1,0,0)--(0,0,0), dashed+linewidth(.5));//bottom 
//draw((1,0,0)--(1,0,1), dashed+linewidth(.5));//up1 
//draw((0,1,0)--(0,1,1), dashed+linewidth(.5));//up2 
draw((1,1,0)--(1,1,1), dashed+linewidth(.5));//up3 
draw((0,0,0)--(1,1,1), Arrow3(size=3mm));
label("$\vec{x}$",(1,1,1),N);
//dotfactor=3;  dot((2,1,1),blue);

// Draw the lines for projection of w onto x as <2,2,2>
//draw((0,0,2)--(0,2,2)--(2,2,2)--(2,0,2)--(0,0,2), dashed+linewidth(.5));//top 
draw((0,0,0)--(0,2,0)--(2,2,0)--(2,0,0)--(0,0,0), dashed+linewidth(.5));//bottom 
//draw((2,0,0)--(2,0,2), dashed+linewidth(.5));//up1 
//draw((0,2,0)--(0,2,2), dashed+linewidth(.5));//up2
draw((2,2,0)--(2,2,2), dashed+linewidth(.5));//up3 
draw((0,0,0)--(2,2,2), gray,Arrow3(size=3mm));
label("$\textrm{proj}_{\vec{x}} \vec{w}$",(2,2,2),N);

// Draw the lines for \vec{w}=<2,1,3>
//draw((0,0,3)--(0,1,3)--(2,1,3)--(2,0,3)--(0,0,3), dashed+linewidth(.5));//top 
draw((0,0,0)--(0,1,0)--(2,1,0)--(2,0,0)--(0,0,0), dashed+linewidth(.5));//bottom 
//draw((2,0,0)--(2,0,3), dashed+linewidth(.5));//up1 
//draw((0,1,0)--(0,1,3), dashed+linewidth(.5));//up2
draw((2,1,0)--(2,1,3), dashed+linewidth(.5));//up3 
draw((0,0,0)--(2,1,3), Arrow3(size=3mm));
label("$\vec{w}$",(2,1,3),N);


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
