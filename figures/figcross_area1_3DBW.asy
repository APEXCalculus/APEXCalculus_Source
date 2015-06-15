import graph3;
import apexstyle;


//ASY file for fig13_06_ex_143D.asy in Chapter 13


size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic((8.1,15.5,23.4),(0,1,0),(0,0,0),1,(-0.13,0.0046));
defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");

//(-0.01,0.061,-0.029)

// setup and draw the axes
real[] myxchoice={5};
real[] myychoice={};
real[] myzchoice={};
defaultpen(0.5mm);

pair xbounds=(-0.25,8);
pair ybounds=(-8,8);
pair zbounds=(-8,8);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,invisible,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
//label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));



path3 p=(5,5,5)--(5,-5,5)--(5,-5,-5)--(5,5,-5);
draw(surface(p -- cycle), emissive(simplesurfacepen));
draw(p--cycle,rgb(.1,.1,.1)+.3mm);


path3 p1=(0,0,0)--(5,5,5)--(5,-5,5);
draw(surface(p1 -- cycle), emissive(simplesurfacepen));
draw(p1--cycle,rgb(.1,.1,.1)+.3mm);

path3 p2=(0,0,0)--(5,5,5)--(5,5,-5);
draw(surface(p2 -- cycle), emissive(simplesurfacepen));
draw(p2--cycle,rgb(.1,.1,.1)+.3mm);

path3 p3=(0,0,0)--(5,5,-5)--(5,-5,-5);
draw(surface(p3 -- cycle), emissive(simplesurfacepen));
draw(p3--cycle,rgb(.1,.1,.1)+.3mm);

path3 p4=(0,0,0)--(5,-5,5)--(5,-5,-5);
draw(surface(p4 -- cycle), emissive(simplesurfacepen));
draw(p4--cycle,rgb(.1,.1,.1)+.3mm);

draw((3,-3,3) -- (3,-3,-3) -- (3,3,-3)-- (3,3,3)--cycle,black+.5mm);


dotfactor=3;
dot((3,0,0));
label("$x$",(3,0,0),S);

label("$2x$",(3,0,3),W);
label("$2x$",(3,3,0),N);
label("$10$",(5,-5,0),S);
label("$10$",(5,0,-5),E);

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