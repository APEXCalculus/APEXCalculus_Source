import graph3;
import apexstyle;


//ASY file for figdisk1b.asy in Chapter 7


size(200,200,Aspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic((18,7.7,21.1),(0,1,0),(0,0,0),1,(-0.088,.0039));
defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");

//(-0.01,0.061,-0.029)

// setup and draw the axes
real[] myxchoice={1,2};
real[] myychoice={.5,1};
real[] myzchoice={};
defaultpen(0.5mm);

pair xbounds=(-0.1,2.2);
pair ybounds=(-1.2,1.2);
pair zbounds=(-1.2,1.2);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,invisible,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
//label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

path3 p2=(1,1,0)..(1,0,1)..(1,-1,0)..(1,0,-1);
draw(surface(p2 .. cycle), emissive(surfacepen));
draw(p2..cycle,rgb(.1,.1,.1)+.4mm);

triple f(pair t) {return (t.x,1/t.x*cos(t.y),1/t.x*sin(t.y));}
surface s=surface(f,(1,0),(2,2*pi),5,16,Spline);
pen p=rgb(0,0,.7)+.1mm;
draw(s,emissive(surfacepen),meshpen=apexmeshpen);

path3 p1=(2,.5,0)..(2,0,.5)..(2,-.5,0)..(2,0,-.5);
//draw(surface(p1 .. cycle), emissive(surfacepen));
draw(p1..cycle,rgb(.1,.1,.1)+.4mm);

path3 p=(3/2,2/3,0)..(3/2,0,2/3)..(3/2,-2/3,0)..(3/2,0,-2/3);
draw(surface(p .. cycle), emissive(simplesurfacepen));
draw(p..cycle,rgb(.3,.3,.3)+.4mm);

triple g(real t) {return (t,1/t,0);}
path3 mypath=graph(g,1.01,1.99,operator ..);
draw(mypath,rgb(.1,.1,.1)+linewidth(2));








//path3 p1=(0,0,0)--(5,5,5)--(5,-5,5);
//draw(surface(p1 -- cycle), emissive(surfacepen));
//draw(p1--cycle,rgb(.1,.1,.1)+.3mm);



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
//draw(mypath,rgb(.1,.1,.1)+dashed+linewidth(2));

//pen p=rgb(0,0,1);
//draw(s,palergb(.1,.1,.1)+opacity(.5),meshpen=p,render(merge=true));

