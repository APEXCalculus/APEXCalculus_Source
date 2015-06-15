import graph3;

//ASY file for figlines3.asy in Chapter 10

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic((-4,27,7),(.012,-0.002,0.015),(0,0,0),.9);
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

pair xbounds=(-2,2);
pair ybounds=(-2,2);
pair zbounds=(-2,2);

xaxis3("",xbounds.x,xbounds.y,invisible,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,invisible,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,invisible,OutTicks(myzchoice),Arrow3(size=3mm));


defaultpen(0.5mm);

real f(pair z) {return 0;}
surface s=surface(f,(-2,-2),(2,2),1,1);
pen p=rgb(0,0,1)+.3mm;
draw(s,paleblue+opacity(.5),meshpen=p,render(merge=true));

draw(scale(.1,.1,.2)*rotate(180,Y)*shift(-1Z)*unitcone,surfacepen=white);
draw(scale(.1,.1,.5)*shift(.4Z)*unitcylinder,surfacepen=white);
draw(scale(.15,.15,.05)*shift(14Z)*unitcylinder,surfacepen=white);


//real f(pair z) {return 0;}
//surface s=surface(f,(-2,-2),(2,2));
//draw(s,white,meshpen=p,render(merge=true));
draw(scale3(.15)*shift(4.7Z)*unitdisk,surfacepen=white);
draw(scale3(.15)*shift(5Z)*unitdisk,surfacepen=white);

draw(scale3(.05)*unitdisk);
label("$P$",(0,0,0),NW);


//draw((0,0,.9)--(0,0,0),gray+1mm,Arrow3(size=2mm));
//draw((0,0,.9)--(0,0,1),gray+1.2mm);

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
//path3 mypath=graph(g,-2,2,operator ..);

//pen p=rgb(0,0,1);
//draw(s,paleblue+opacity(.5),meshpen=p,render(merge=true));

//draw(s,paleblue);
//draw(s,lightblue,meshpen=black+thick(),nolight,render(merge=true));
//draw(mypath,2bp+blue);
