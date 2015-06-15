import graph3;
import apexstyle;


//ASY file for figquadric_hyp_parb.pdf in Chapter 10.1
//LOOKS A LITTLE STRANGE AT THE EDGES.  PERHAPS CHANGE t RANGE?
//STILL NEED TO FIX LABELS

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(2,5,2);
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
pair zbounds=(-1.5,1.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

//xaxis3("",-2,2,invisible,OutTicks(myxchoice),Arrow3(size=3mm));
//yaxis3("",-2,2,invisible,OutTicks(myychoice),Arrow3(size=3mm));
//zaxis3("",-2,2,invisible,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the surface z^2 - x^2 - y^2=1
triple f(pair t) {
	return (t.x,t.y,(t.x)^2-(t.y)^2);//({x},{y},{x^2-y^2});
}
surface s=surface(f,(-1,-1),(1,1),32,16);
pen p=rgb(0,0,.7);
draw(s,emissive(surfacepen),meshpen=apexmeshpen);

//Draw the traces for z=1/4 in rgb(.1,.1,.1)+.8mm
triple g(real t) {return (0.5/cos(t),0.5*tan(t),0.25);}
path3 mypath=graph(g,-1.05,1.05,operator ..); draw(mypath,rgb(.1,.1,.1)+.8mm);
triple g(real t) {return (-0.5/cos(t),0.5*tan(t),0.25);}
path3 mypath=graph(g,-1.05,1.05,operator ..); draw(mypath,rgb(.1,.1,.1)+.8mm);

//Draw the traces for z=-1/4 in rgb(.1,.1,.1)+.8mm
triple g(real t) {return (0.5*tan(t),0.5/cos(t),-0.25);}
path3 mypath=graph(g,-1.05,1.05,operator ..); draw(mypath,rgb(.1,.1,.1)+.8mm);
triple g(real t) {return (0.5*tan(t),-0.5/cos(t),-0.25);}
path3 mypath=graph(g,-1.05,1.05,operator ..); draw(mypath,rgb(.1,.1,.1)+.8mm);

//Add labels
label("\noindent\centering Hyperbolas in \\plane $z=d$",(.7,0,1),N);
label("\noindent\centering $(d>0)$",(.5,0,.6),N);
draw((.52,0,.6)--(.5,0,.25),linewidth(.75),Arrow3);
draw((.48,0,.6)--(-.5,0,.25),linewidth(.75),Arrow3);
label("\noindent\centering $(d<0)$",(1,0,-0.5),S);
draw((1,.1,-0.5)--(.8,.9,-.25),linewidth(.75),Arrow3);
draw((1,-.1,-0.5)--(.8,-.9,-.25),linewidth(.75),Arrow3);


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
//draw(s,palergb(.1,.1,.1)+opacity(.5),meshpen=p,render(merge=true));

//draw(s,palergb(.1,.1,.1));
//draw(s,lightrgb(.1,.1,.1),meshpen=black+thick(),nolight,render(merge=true));
//draw(mypath,2bp+rgb(.1,.1,.1));