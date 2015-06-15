import graph3;
import apexstyle;


//ASY file for figarc4_3D.asy in Chapter 7


size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic((16.7,13.2,46),(0,1,0),(0,0,0),1,(-.0323,0.0012));
//currentprojection=orthographic((16.7,13.2,46),(0,1,0),(0,0,0),1,(0.0148,0.00673));
defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");

// setup and draw the axes
real[] myxchoice={};
real[] myychoice={-1,1};
real[] myzchoice={};
defaultpen(0.5mm);

pair xbounds=(-.1,3.5);
pair ybounds=(-1.5,1.5);
pair zbounds=(-1.5,1.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,invisible,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
//label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//\addplot3[domain=.9:1.4,y domain=-210:150,samples y=36,surf,shader=flat,colormap={mp2}{\colormapone}]
// ({x},{(.41*(x-.9)+.78)*sin(y)},{(.41*(x-.9)+.78)*cos(y)});

//\addplot3[domain=.5:1.9,,samples y=0,{\colorone},] ({x},{0},{(sin(deg(x)))});

//\addplot3[domain=0:360,,samples y=0,black,smooth] ({1.4},{.98*cos(x)},{.98*sin(x)});

//\addplot3[domain=130:330,,samples y=0,black,dashed,smooth] ({.9},{.78*cos(x)},{.78*sin(x)});

pen p=rgb(0,0,.8)+.1mm;

triple f2(pair t) {return (t.x,sin(t.x)*sin(t.y),sin(t.x)*cos(t.y));}
surface s2=surface(f2,(0,0),(pi,2*pi),16,16,usplinetype=new splinetype[] {notaknot,notaknot,monotonic}
,vsplinetype=new splinetype[] {notaknot,notaknot,monotonic}
);
draw(s2,emissive(surfacepen),meshpen=apexmeshpen);

triple g3(real t) {return (t,sin(t),0);}
path3 p3=graph(g3,0,pi,32,operator ..);
draw(p3,rgb(.1,.1,.1)+.6mm);

draw((pi,.05,0)--(pi,-.05,0),black+.2mm);
label("$\pi$",(pi,-.05,0),S);


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








