import graph3;

//ASY file for fig10_01_ex_233D.asy in Chapter 10

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(1.17,4.69,2.35);
defaultrender.merge=true;

//usepackage("mathspec");
//texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
//texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
//texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
//texpreamble("\setmathsfont(Greek){[cmmi10]}");
//
// setup and draw the axes
real[] myxchoice={-1,1};
real[] myychoice={1};
real[] myzchoice={1,2};
defaultpen(0.5mm);
pair xbounds=(-1.5,1.5);
pair ybounds=(-.2,1.5);
pair zbounds=(-.1,1.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the surface z=x^2-y^2+1
triple f(pair t) {
	return (t.x,t.x^2,t.y*(-sin(t.x^2)*cos(t.x)+1));
}
surface s=surface(f,(-1,0),(1,1),16,8,usplinetype=new splinetype[] {notaknot,notaknot,monotonic}
,vsplinetype=new splinetype[] {notaknot,notaknot,monotonic}
);
pen p=rgb(0,0,.7);
draw(s,rgb(.6,.6,1)+opacity(.7),meshpen=p);

triple g(real t) {return (t,t^2,-cos(t)*sin(t^2)+1);}
path3 mypath=graph(g,-1,1,operator ..);
draw(mypath,blue+linewidth(2));

triple g(real t) {return (t,t^2,0);}
path3 mypath=graph(g,-1,1,operator ..);
draw(mypath,blue+linewidth(2)+dashed);

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
//path3 mypath=graph(g,-1,1,operator ..);

//pen p=rgb(0,0,1);
//draw(s,paleblue+opacity(.5),meshpen=p,render(merge=true));

//draw(s,paleblue);
//draw(s,lightblue,meshpen=black+thick(),nolight,render(merge=true));
//draw(mypath,2bp+blue);
