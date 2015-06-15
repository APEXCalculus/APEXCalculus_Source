import graph3;
import apexstyle;


//ASY file for fig10_01_ex_19.pdf in Chapter 10.1


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
real[] myxchoice={-10,10};
real[] myychoice={-10,10};
real[] myzchoice={-10,10};
defaultpen(0.5mm);

pair xbounds=(-11,11);
pair ybounds=(-11,11);
pair zbounds=(-11,11);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the surface x^2 + y^2/9 + z^2/4 = 1
triple f(pair t) {
	return (t.x*cos(t.y),t.x*sin(t.y),1/t.x);//({y^2},{cos(x)*y},{3*sin(x)*y});
}
surface s=surface(f,(.1,0),(10,2*pi),32,32);
pen p=rgb(0,0,.7);
draw(s,emissive(surfacepen),meshpen=apexmeshpen);

surface s=surface(f,(-10,0),(-.1,2*pi),32,32);
pen p=rgb(0,0,.7);
draw(s,emissive(surfacepen),meshpen=apexmeshpen);


triple g(real t) {return (t,0,1/t);}
path3 mypath=graph(g,.1,10,operator ..); draw(mypath,rgb(.3,.3,.3));
path3 mypath=graph(g,-10,-.1,operator ..); draw(mypath,rgb(.3,.3,.3));



//Add labels
//label("In plane $y=0$",(0,4,1.5),E);
//draw((0,4,1.5)--(3,0,2),linewidth(.75),Arrow3);
//draw((0,5,1.75)--(-3,0,2),linewidth(.75),Arrow3);
//label("In plane $z=d$",(4,0,-1),W);
//draw((-1,3,1.75)--(-2.1,1.1,2),linewidth(.75),Arrow3);



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