import graph3;

//ASY file for figcrossp_rhr.asy in Chapter 10

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
real[] myxchoice={};
real[] myychoice={};
real[] myzchoice={};
defaultpen(0.5mm);
pair xbounds=(-1.5,1.5);
pair ybounds=(-1.5,1.5);
pair zbounds=(-0.5,1.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));


//Draw theplane z=(-2*x+5*y)/27;
triple f(pair t) {
  return (t.x,t.y,(-2*t.x+5*t.y)/27);
}
surface s=surface(f,(-1.5,-1.5),(1.5,1.5),8,8,Spline);
pen p=rgb(0,0,.7);
draw(s,rgb(.6,.6,1)+opacity(.7),meshpen=p,nolight,render(merge=true));


// Draw vec{u}=<-1/5,1,1/5>
draw((0,0,0)--(-1/5,1,1/5), blue,Arrow3(size=3mm));
label("$\vec{u}$",(-1/5,1,1/5),N);

// Draw  \vec{v}=<-6/5,3/5,1/5>
draw((0,0,0)--(-6/5,3/5,1/5), blue,Arrow3(size=3mm));
label("$\vec{v}$",(-6/5,3/5,1/5),N);

// Draw the cross product of u and v <2,-5,27> but scale it as <2,-5,27>/25
draw((0,0,0)--(2/25,-5/25,27/25), red,Arrow3(size=3mm));
label("$\vec{u} \times \vec{v}$",(2/25,-5/25,27/25),NW);




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
