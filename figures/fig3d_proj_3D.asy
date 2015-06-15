import graph3;

//ASY file for fig3d_proj3D.asy in Chapter 13


size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(6.7,1.9,11.5);
defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");

// setup and draw the axes
real[] myxchoice={2};
real[] myychoice={1,2};
real[] myzchoice={2,4};
defaultpen(0.5mm);

pair xbounds=(-0.5,2.5);
pair ybounds=(-0.5,2.25);
pair zbounds=(-0.5,4.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//plane z=2y
triple f(pair t) {
  return (t.x,t.y,2*t.y);
}
surface s=surface(f,(0,0),(2,1.5),1,1,Spline);
pen p=rgb(1,0,0)+.1mm;
draw(s,emissive(rgb(1,.6,.6)+opacity(.7)),meshpen=p);

//z=3-x^2-y^2
triple f(pair t) {
  return (t.x,t.y,3-t.x^2-t.y^2);
}
surface s=surface(f,(-.1,-.1),(2,1.5),8,8,Spline);
//triple f(pair t) {
//  return (cos(t.x)*t.y,sin(t.x)*t.y,3-t.y^2-t.y^2);
//}
//
//surface s=surface(f,(-.1,0),(pi/2+.1,2),8,8,Spline);
pen p=rgb(0,0,.7)+.1mm;
draw(s,rgb(.6,.6,1)+opacity(.7),meshpen=p);

//lines and curves on the surfaces
draw((0,0,0)--(0,1,2),blue+dashed+linewidth(1));
triple g(real t) {return (t,0,2*(1-(t/2)^2));}
path3 mypath=graph(g,0,2,operator ..);draw(mypath,blue+dashed+linewidth(1));
triple g(real t) {return (t,1-(t/2)^2,2*(1-(t/2)^2));}
path3 mypath=graph(g,0,2,operator ..);draw(mypath,blue+linewidth(2));
triple g(real t) {return (t,1-(t/2)^2,0);}
path3 mypath=graph(g,0,2,operator ..);draw(mypath,blue+dashed+linewidth(1));



// ////////////////////////////////////
//    SAMPLE CODE

// defaultpen(fontsize(10pt));

//real f(pair z) {return -z.x^4+2*z.x^2-z.y^4+2*z.y^2;}
//surface s=surface(f,(-1.5,-1.5),(1.5,1.5),Spline);
//pen p=rgb(0,0,.7);
//draw(s,rgb(.6,.6,1)+opacity(.7),meshpen=p);

//triple f(pair t) {
//  return (cos(t.x)*1.5*cos(t.y),sin(t.x)*cos(t.y),sin(t.y));
//}
//surface s=surface(f,(0,0),(pi,2*pi),8,8,Spline);
//pen p=rgb(0,0,.7);
//draw(s,rgb(.6,.6,1)+opacity(.7),meshpen=p);

//draw(s,paleblue);
//draw(s,lightblue,meshpen=black+thick(),nolight,render(merge=true));
//draw(mypath,2bp+blue);

//triple g(real t) {return (t,t,-2*t^4+4*t^2);}
//path3 mypath=graph(g,-1,1,operator ..);
//draw(mypath,blue+dashed+linewidth(2));

//pen p=rgb(0,0,1);
//draw(s,paleblue+opacity(.5),meshpen=p,render(merge=true));
