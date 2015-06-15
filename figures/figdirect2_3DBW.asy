import graph3;
import apexstyle;


//ASY file for figdirect23D.asy in Chapter 12

size(200,200,IgnoreAspect);
//size(200,200,Aspect);
//currentprojection=perspective(7,2,1);

// for the default version, figdirect2
currentprojection=orthographic(12,13,3);

// for the second, zoomed in view, figdirect2b
//currentprojection=orthographic((5.6,16.3,2.6),(0,0,1),(0,0,0),1.6,(-0.03,-0.34));

defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");




// setup and draw the axes
real[] myxchoice={2,4};
real[] myychoice={2,4};
real[] myzchoice={-1,1};
defaultpen(0.5mm);
pair xbounds=(-1,6);
pair ybounds=(-1,5);
pair zbounds=(-1.5,1.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw surface z=sin(x)*cos(y)
triple f(pair t) {
  return (t.x,t.y,sin(t.x)*cos(t.y));
}
surface s=surface(f,(-1.5,-1.5),(4,4),8,8,Spline);
pen p=rgb(0,0,.7);
draw(s,emissive(surfacepen),meshpen=apexmeshpen);

//plot point on surface
dotfactor=3;dot((pi/3,pi/3,sqrt(3)/4));

//Draw the vectors on the surface 
draw((pi/3,pi/3,sqrt(3)/4)--(pi/3+3/sqrt(10),pi/3+1/sqrt(10),sqrt(3)/4),Arrow3(size=2mm));//T at point
draw((pi/3,pi/3,sqrt(3)/4)--(pi/3+1/sqrt(10),pi/3-3/sqrt(10),sqrt(3)/4),linetype(new real[] {2,2}),Arrow3(size=2mm));//N at point
//draw((pi/3,pi/3,sqrt(3)/4)--(pi/3+1/sqrt(10),pi/3-3/sqrt(10),sqrt(3)/4),linetype(new real[] {2,2}),Arrow3(size=2mm));//N at point
draw((pi/3,pi/3,sqrt(3)/4)--(pi/3+1/sqrt(10),pi/3-3/sqrt(10),0.79+sqrt(3)/4),Arrow3(size=2mm));//tangent

//plot level curve
draw((0.4485,0,0.4336)..(0.4693,0.2857,0.434)..(0.5417,0.5714,0.4337)..(0.7143,0.8481,0.4333)..(0.9331,1.,0.4341)..(1.143,1.075,0.4331)..(1.429,1.118,0.4333)..(1.714,1.118,0.4333)..(2.,1.074,0.4331)..(2.209,1.,0.4341)..(2.429,0.8467,0.4333)..(2.6,0.5714,0.4333)..(2.673,0.2857,0.4333)..(2.694,0,0.4332)..(2.673,-0.2857,0.4333)..(2.615,-0.5276,0.4341)..(2.531,-0.7143,0.4333)..(2.347,-0.9187,0.433)..(2.098,-1.044,0.4341)..(1.821,-1.107,0.4333)..(1.551,-1.122,0.4335)..(1.237,-1.094,0.4338)..(0.9783,-1.022,0.4329)..(0.7185,-0.8529,0.433)..(0.5714,-0.639,0.4341)..(0.4838,-0.3734,0.4331)..(0.4517,-0.1197,0.4334)..(0.4485,-0.01989,0.4335),rgb(.1,.1,.1)+linewidth(2));



















// ////////////////////////////////////
//    SAMPLE CODE

// defaultpen(fontsize(10pt));

//Draw the parabola z=y^2 for t from -2 to 2
//triple g(real t) {return (0,t,t^2);}
//path3 mypath=graph(g,-2,2,operator ..); draw(mypath,rgb(.1,.1,.1));


//Draw the surface z=1/(1+x^2+y^2)
//triple f(pair t) {
//  return (t.x,t.y,1/(1+(t.x)^2+(t.y)^2));
//}
//surface s=surface(f,(-2,-2),(2,2),8,8,Spline);
//pen p=rgb(0,0,.7);
//draw(s,emissive(surfacepen),meshpen=apexmeshpen);


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