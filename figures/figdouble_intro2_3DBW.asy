import graph3;
import apexstyle;


//ASY file for figdouble_intro23D.asy in Chapter 13


size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(7.5,3.1,3);
defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");

// setup and draw the axes
real[] myxchoice={2};
real[] myychoice={-1,1};
real[] myzchoice={2};
defaultpen(0.5mm);

pair xbounds=(-1,2.5);
pair ybounds=(-1.25,1.25);
pair zbounds=(0,2.25);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the surface//{z=-.5*(x-1)^2-.5*(y)^2+2};
triple f(pair t) {
  return (t.x,t.y,-.5*(t.x-1)^2-.5*(t.y)^2+2);
}
surface s=surface(f,(-0.221,-1),(2.2,1),12,20,vsplinetype=new splinetype[] {notaknot,notaknot,monotonic},usplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=rgb(0,0,.7);
draw(s,emissive(surfacepen),meshpen=apexmeshpen);


pen pp=linewidth(.25mm);
//draw the grid in the xy-plane
//along fixed x
draw((0,-.3,0) -- (0,.3,0),pp);
draw((.2,-.4,0) -- (.2,.4,0),pp);
draw((0.4,-.6,0) -- (.4,.6,0),pp);
draw((0.6,-.7,0) -- (.6,.7,0),pp);
draw((.8,-.8,0) -- (.8,.8,0),pp);
draw((1,-.8,0) -- (1,.8,0),pp);
draw((1.2,-.8,0) -- (1.2,.8,0),pp);
draw((1.4,-.8,0) -- (1.4,.8,0),pp);
draw((1.6,-.7,0) -- (1.6,.7,0),pp);
draw((1.8,-.6,0) -- (1.8,.6,0),pp);
draw((2,-.4,0) -- (2,.4,0),pp);
//along fixed y
draw((.8,.8,0) -- (1.4,.8,0),pp);
draw((.6,.7,0) -- (1.6,.7,0),pp);
draw((.4,.6,0) -- (1.8,.6,0),pp);
draw((.4,.5,0) -- (1.8,.5,0),pp);
draw((.2,.4,0) -- (2,.4,0),pp);
draw((0,.3,0) -- (2,.3,0),pp);
draw((0,.2,0) -- (2,.2,0),pp);
draw((0,.1,0) -- (2,.1,0),pp);
draw((.8,-.8,0) -- (1.4,-.8,0),pp);
draw((.6,-.7,0) -- (1.6,-.7,0),pp);
draw((.4,-.6,0) -- (1.8,-.6,0),pp);
draw((.4,-.5,0) -- (1.8,-.5,0),pp);
draw((.2,-.4,0) -- (2,-.4,0),pp);
draw((0,-.3,0) -- (2,-.3,0),pp);
draw((0,-.2,0) -- (2,-.2,0),pp);
draw((0,-.1,0) -- (2,-.1,0),pp);

//Draw curve on top of the grid in xy plane ({cos(x)*(1+cos(2*x))},{sin(x)*(1+cos(2*x))},0);
triple g(real t) {return (cos(t)*(1+cos(2*t)),sin(t)*(1+cos(2*t)),0);}
path3 mypath=graph(g,-pi/2,pi/2,operator ..);
draw(mypath,rgb(.1,.1,.1));

// draw curve on surface
triple g(real t) {
  return (cos(t)*(1+cos(2*t)),sin(t)*(1+cos(2*t)),-.5*(cos(t)*(1+cos(2*t))-1)^2-.5*(sin(t)*(1+cos(2*t)))^2+2);
	}
path3 mypath=graph(g,-pi/2,pi/2,operator ..); 
draw(mypath,rgb(.1,.1,.1));	
	
//surface s=surface(f,(-pi/2,0),(pi/2,2*pi),8,8,Spline);
//pen p=rgb(0,0,.7);
//draw(s,rgb(.6,.6,1)+opacity(.7),rgb(.1,.1,.1)+linewidth(2));
//path3 mypath=graph(g,0,32.5,operator ..); draw(mypath,rgb(.1,.1,.1));

//Draw the top of the column on the surface
//draw((1.6,0.3,1.865)--(1.8,.3,1.725),rgb(.1,.1,.1)+linewidth(2));
//draw((1.8,0.3,1.7)--(1.8,.4,1.7),rgb(.1,.1,.1)+linewidth(2));
//draw((1.8,0.4,1.7)--(1.6,.4,1.7),rgb(.1,.1,.1)+linewidth(2));
//draw((1.6,0.4,1.7)--(1.6,.3,1.7),rgb(.1,.1,.1)+linewidth(2));
draw((1.6,.3,1.775) -- (1.6,.4,1.74) -- (1.8,.4,1.6) -- (1.8,.3,1.635) --cycle,rgb(.1,.1,.1)+.4mm);

//Draw the rectangular column
//base
draw((1.6,0.3,0)--(1.8,.3,0)--(1.8,.4,0)--(1.6,.4,0)--cycle,rgb(.3,.3,.3)+.4mm);

//  //verticals plotted to average of 4 function heights
//draw((1.6,0.3,0)--(1.6,.3,1.7),rgb(.3,.3,.3)+.4mm);//base
//draw((1.8,0.3,0)--(1.8,.3,1.7),rgb(.3,.3,.3)+.4mm);//base
//draw((1.8,0.4,0)--(1.8,.4,1.7),rgb(.3,.3,.3)+.4mm);//base
//draw((1.6,0.4,0)--(1.6,.4,1.7),rgb(.3,.3,.3)+.4mm);//base
//top
draw((1.6,0.3,1.7)--(1.8,.3,1.7)--(1.8,.4,1.7)--(1.6,.4,1.7)--cycle,rgb(.3,.3,.3));


pen q=rgb(.3,.3,.3)+.4mm;
//  draw(ss,rgb(1,.6,.6)+opacity(.8),meshpen=q,nolight,render(merge=true));
//   emissive(rgb(.3,.3,.3)+opacity(0.7))

//Shade the column now
//import three;

path3 p =  (1.6,0.3,0)--(1.8,.3,0) -- (1.8,0.3,1.7)--(1.6,.3,1.7); //Left
draw(surface(p -- cycle),emissive(simplesurfacepen),meshpen=q,render(merge=true));

path3 p =  (1.6,0.3,1.7)--(1.8,.3,1.7)--(1.8,.4,1.7)--(1.6,.4,1.7); //top
draw(surface(p -- cycle),emissive(simplesurfacepen),meshpen=q,render(merge=true));
//draw(surface(p -- cycle), emissive(rgb(.3,.3,.3)+opacity(0.7)));

path3 p =  (1.6,0.4,0)--(1.8,.4,0) -- (1.8,0.4,1.7)--(1.6,.4,1.7); //right
draw(surface(p -- cycle),emissive(simplesurfacepen),meshpen=q,render(merge=true));
//draw(surface(p -- cycle), emissive(rgb(.3,.3,.3)+opacity(0.7)));

path3 p =  (1.6,0.3,0)--(1.6,.4,0) -- (1.6,0.4,1.7)--(1.6,.3,1.7); //back
draw(surface(p -- cycle),emissive(simplesurfacepen),meshpen=q,render(merge=true));
//draw(surface(p -- cycle), emissive(rgb(.3,.3,.3)+opacity(0.7)));

path3 p =  (1.8,0.3,0)--(1.8,.4,0) -- (1.8,0.4,1.7)--(1.8,.3,1.7); //front
draw(surface(p -- cycle),emissive(simplesurfacepen),meshpen=q,render(merge=true));
//draw(surface(p -- cycle), emissive(rgb(.3,.3,.3)+opacity(0.7)));

path3 p =  (1.6,0.3,0)--(1.8,.3,0)--(1.8,.4,0)--(1.6,.4,0); //bottom
draw(surface(p -- cycle),emissive(simplesurfacepen),meshpen=q,render(merge=true));
//draw(surface(p -- cycle), emissive(rgb(.3,.3,.3)+opacity(0.7)));



// ////////////////////////////////////
//    SAMPLE CODE

// defaultpen(fontsize(10pt));

//real f(pair z) {return -z.x^4+2*z.x^2-z.y^4+2*z.y^2;}
//surface s=surface(f,(-1.5,-1.5),(1.5,1.5),Spline);
//pen p=rgb(0,0,.7);
//draw(s,emissive(surfacepen),meshpen=apexmeshpen);

//triple f(pair t) {
//  return (cos(t.x)*1.5*cos(t.y),sin(t.x)*cos(t.y),sin(t.y));
//}
//surface s=surface(f,(0,0),(pi,2*pi),8,8,Spline);
//pen p=rgb(0,0,.7);
//draw(s,emissive(surfacepen),meshpen=apexmeshpen);

//draw(s,palergb(.1,.1,.1));
//draw(s,lightrgb(.1,.1,.1),meshpen=black+thick(),nolight,render(merge=true));
//draw(mypath,2bp+rgb(.1,.1,.1));

//triple g(real t) {return (t,t,-2*t^4+4*t^2);}
//path3 mypath=graph(g,-1,1,operator ..);

//pen p=rgb(0,0,1);
//draw(s,palergb(.1,.1,.1)+opacity(.5),meshpen=p,render(merge=true));