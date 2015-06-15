import graph3;
import apexstyle;


//ASY file for figquadric_hyp_two_sheetb.pdf in Chapter 10.1
//LOOKS A LITTLE STRANGE AT THE EDGES.  PERHAPS CHANGE t RANGE?
//STILL NEED TO FIX LABELS

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
real[] myxchoice={};
real[] myychoice={};
real[] myzchoice={};
defaultpen(0.5mm);
pair xbounds=(-2,2);
pair ybounds=(-2,2);
pair zbounds=(-2,2);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the surface z^2 - x^2 - y^2=1
triple f(pair t) {
	return (cos(t.y)*tan(t.x),sin(t.y)*tan(t.x),1/cos(t.x));//({cos(y)*tan(x)},{tan(x)*sin(y)},{sec(x)})
}
surface s=surface(f,(-1,0),(1,pi),32,16);
pen p=rgb(0,0,.7);
draw(s,emissive(surfacepen),meshpen=apexmeshpen);
triple f(pair t) {
	return (cos(t.y)*tan(t.x),sin(t.y)*tan(t.x),-1/cos(t.x));//({cos(y)*tan(x)},{tan(x)*sin(y)},{sec(x)})
}

bool cond(pair t) {return 1/cos(t.x) <= 1.6;}

surface s=surface(f,(-1,0),(1,pi),32,16);
pen p=rgb(0,0,.7);
draw(s,emissive(surfacepen),meshpen=apexmeshpen);

//Draw the traces for x=0 in rgb(.3,.3,.3)
//triple g(real t) {return (0,1/cos(t),tan(t));}
//path3 mypath=graph(g,-1,1,operator ..); draw(mypath,rgb(.3,.3,.3));
//triple g(real t) {return (0,-1/cos(t),tan(t));}
//path3 mypath=graph(g,-1,1,operator ..); draw(mypath,rgb(.3,.3,.3));

//Draw the traces for y=0 in rgb(.3,.3,.3)
//triple g(real t) {return (1/cos(t),0,tan(t));}
//path3 mypath=graph(g,-1,1,operator ..); draw(mypath,rgb(.3,.3,.3));
//triple g(real t) {return (-1/cos(t),0,tan(t));}
//path3 mypath=graph(g,-1,1,operator ..); draw(mypath,rgb(.3,.3,.3));

//Draw the traces for z=0 in rgb(.3,.3,.3)
//triple g(real t) {return (cos(t),sin(t),0);}
//path3 mypath=graph(g,0,2*pi,operator ..); draw(mypath,rgb(.3,.3,.3));



//Add labels
label("\noindent\centering In plane\\ $y=0$",(1.5,0,-1),N,invisible);
label("\noindent\centering In plane\\ $x=0$",(0,1.5,-1),N,invisible);
label("\noindent\centering In plane\\ $z=d$",(1.1,1.1,-2),S,invisible);



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