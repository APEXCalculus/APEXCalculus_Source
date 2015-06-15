import graph3;
import apexstyle;


//ASY file for figvvf23D.asy in Chapter 11

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(5,5,10);
//currentprojection=orthographic(-5.6,3.8,9.5);
defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");

// setup and draw the axes
real[] myxchoice={-1,1};
real[] myzchoice={0,2,4,6};
real[] myychoice={-1,1};


defaultpen(0.5mm);
pair xbounds=(-1.25,1.25);
pair ybounds=(-1.25,1.25);
pair zbounds=(-0.5,7);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));


triple g(real t) {return (cos(t),sin(t),t);}
path3 mypath=graph(g,0,2pi,operator ..);





defaultpen(0.75mm);
draw(O--(-1,0,1),rgb(.3,.3,.3),Arrow3(size=4mm));

draw(g(pi/2)--g(pi/2)+(-1,0,1),rgb(.3,.3,.3),Arrow3(size=4mm));

draw(mypath,rgb(.1,.1,.1),Arrow3(size=4mm));
