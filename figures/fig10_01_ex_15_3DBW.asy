import graph3;
import apexstyle;


//ASY file for fig10_01_ex_153D.asy in Chapter 10

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
real[] myxchoice={-1,1};
real[] myychoice={};
real[] myzchoice={};
defaultpen(0.5mm);
pair xbounds=(-1.25,1.25);
pair ybounds=(-1.25,1.25);
pair zbounds=(-1.25,1.25);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the parabola z=x^3 for t from -2 to 2
triple g(real t) {return (t,0,t^3);}
path3 mypath=graph(g,-1,1,operator ..); draw(mypath,rgb(.1,.1,.1));

//Draw the cylinder z=x^3
triple f(pair t) {
  return (t.x,t.y,(t.x)^3);
}
surface s=surface(f,(-1,-1),(1,1),16,16,Spline);
pen p=rgb(0,0,.7);
draw(s,emissive(surfacepen),meshpen=apexmeshpen);

//Draw the traces (in this case lines)
triple g(real t) {return (-0.2,t,(-0.2)^3);}
path3 mypath=graph(g,-1,1,operator ..); draw(mypath,rgb(.3,.3,.3));
triple g(real t) {return (-0.4,t,(-0.4)^3);}
path3 mypath=graph(g,-1,1,operator ..); draw(mypath,rgb(.3,.3,.3));
triple g(real t) {return (-0.6,t,(-0.6)^3);}
path3 mypath=graph(g,-1,1,operator ..); draw(mypath,rgb(.3,.3,.3));
triple g(real t) {return (-0.8,t,(-0.8)^3);}
path3 mypath=graph(g,-1,1,operator ..); draw(mypath,rgb(.3,.3,.3));
triple g(real t) {return (-1,t,(-1)^3);}
path3 mypath=graph(g,-1,1,operator ..); draw(mypath,rgb(.3,.3,.3));
triple g(real t) {return (0.2,t,(0.2)^3);}
path3 mypath=graph(g,-1,1,operator ..); draw(mypath,rgb(.3,.3,.3));
triple g(real t) {return (0.4,t,(0.4)^3);}
path3 mypath=graph(g,-1,1,operator ..); draw(mypath,rgb(.3,.3,.3));
triple g(real t) {return (0.6,t,(0.6)^3);}
path3 mypath=graph(g,-1,1,operator ..); draw(mypath,rgb(.3,.3,.3));
triple g(real t) {return (0.8,t,(0.8)^3);}
path3 mypath=graph(g,-1,1,operator ..); draw(mypath,rgb(.3,.3,.3));
triple g(real t) {return (1,t,(1)^3);}
path3 mypath=graph(g,-1,1,operator ..); draw(mypath,rgb(.3,.3,.3));
triple g(real t) {return (t,0,(t)^3);}
path3 mypath=graph(g,-1,1,operator ..); draw(mypath,rgb(.1,.1,.1));





// ////////////////////////////////////
//    SAMPLE CODE

// defaultpen(fontsize(10pt));

//Draw the parabola z=y^2 for t from -2 to 2
//triple g(real t) {return (0,t,t^2);}
//path3 mypath=graph(g,-2,2,operator ..); draw(mypath,rgb(.1,.1,.1));

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