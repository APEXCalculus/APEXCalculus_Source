import graph3;
import apexstyle;


//ASY file for figplanes43D.asy in Chapter 10

//size(200,200,Aspect);
size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(8,14.7,14);
defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");



// setup and draw the axes
real[] myxchoice={-2,2};
real[] myychoice={-2,2};
real[] myzchoice={-5};
defaultpen(0.5mm);
pair xbounds=(-3,3);
pair ybounds=(-3,3);
pair zbounds=(-6,2);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the planes z=-x+y-1 and z=2x-y-2 
triple f(pair t) {
  return (t.x,t.y,-t.x+t.y-1);
}
surface s=surface(f,(-3,-3),(3,3),4,4,Spline);
pen p=rgb(0,0,.7);
draw(s,emissive(surfacepen),meshpen=apexmeshpen);
triple f(pair t) {
  return (t.x,t.y,2*t.x-t.y-2);
}
surface s=surface(f,(-3,-3),(3,3),4,4,Spline);
pen pp=rgb(0,0,.7)+.2mm;
//draw(s,rgb(1,.4,.7)+opacity(.7),meshpen=pp,nolight,render(merge=true)); // HOT PINK

pen q=rgb(.3,.3,.3)+.2mm;
draw(s,emissive(simplesurfacepen),meshpen=q);


//Draw point P=(1,1,-1)
dotfactor=3;dot((1,1,-1));label("$P$",(1,1,-1),N);



//draw the line 1-2t,1-3t,-1-t 
draw((4,5.5,0.5)--(-2,-3.5,-2.5),rgb(.1,.1,.1));//L t=-1.5 to t=1.5






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