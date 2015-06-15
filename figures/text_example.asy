import graph3;

size(200,200,IgnoreAspect);
currentprojection=orthographic(4,2,3);

defaultrender.merge=true;

defaultpen(fontsize(10pt));
defaultpen(0.75mm);



triple g(real t) {return (cos(t),sin(t),t);}
path3 mypath=graph(g,0,2pi,operator ..);

real[] myxchoice={-1,1};
real[] myzchoice={0,2,4,6};

defaultpen(0.5mm);
xaxis3("$x$",-1,1.25,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("$y$",-1,1.25,black,OutTicks(myxchoice),Arrow3(size=3mm));
zaxis3("$z$",0,6.75,black,OutTicks(myzchoice),Arrow3(size=3mm));

defaultpen(0.75mm);
draw(O--(-1,0,1),red,Arrow3(size=4mm));

draw(g(pi/2)--g(pi/2)+(-1,0,1),red,Arrow3(size=4mm));

draw(mypath,blue,Arrow3(size=4mm));

