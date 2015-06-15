import graph3;

//ASY file for figdisk1.asy in Chapter 7


size(200,200,IgnoreAspect);
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



path3 p=(3/2,2/3,0)..(3/2,0,2/3)..(3/2,-2/3,0)..(3/2,0,-2/3);
draw(surface(p .. cycle), emissive(rgb(1,.6,.6)+opacity(0.5)));
draw(p..cycle,red+.4mm);

triple g(real t) {return (t,1/t,0);}
path3 mypath=graph(g,1,2,operator ..);
draw(mypath,blue+linewidth(2));

draw((1.5,0,0)--(1.5,2/3,0),black+.3mm);

triple pt=(1.3,Sin(-20),Cos(-20));

draw(pt--(1.48,.3,.05),linewidth(.75),Arrow3);
label("$R(x)=1/x$",pt,S);

label("$y=1/x$",(1,1,0),N);

//triple f(pair t) {return (t.x,1/t.x*cos(t.y),1/t.x*sin(t.y));}
//surface s=surface(f,(1,0),(2,2*pi),5,16,Spline);
//pen p=rgb(0,0,.7);
//draw(s,rgb(.6,.6,1)+opacity(.7),meshpen=p);


//path3 p1=(0,0,0)--(5,5,5)--(5,-5,5);
//draw(surface(p1 -- cycle), emissive(rgb(.6,.6,1)+opacity(0.5)));
//draw(p1--cycle,blue+.3mm);



// ////////////////////////////////////
//    SAMPLE CODE

// defaultpen(fontsize(10pt));

//real f(pair z) {return -z.x^4+2*z.x^2-z.y^4+2*z.y^2;}
//surface s=surface(f,(-1.5,-1.5),(1.5,1.5),Spline);
//pen p=rgb(0,0,.7);
//draw(s,rgb(.6,.6,1)+opacity(.7),meshpen=p);

//triple f(pair t) {
//  return (cos(t.x)*1.5*cos(t.y),sin(t.x)*cos(t.y),sin(t.y));
//}
//surface s=surface(f,(0,0),(pi,2*pi),8,8,Spline);
//pen p=rgb(0,0,.7);
//draw(s,rgb(.6,.6,1)+opacity(.7),meshpen=p);

//draw(s,paleblue);
//draw(s,lightblue,meshpen=black+thick(),nolight,render(merge=true));
//draw(mypath,2bp+blue);

//triple g(real t) {return (t,t,-2*t^4+4*t^2);}
//path3 mypath=graph(g,-1,1,operator ..);
//draw(mypath,blue+dashed+linewidth(2));

//pen p=rgb(0,0,1);
//draw(s,paleblue+opacity(.5),meshpen=p,render(merge=true));

