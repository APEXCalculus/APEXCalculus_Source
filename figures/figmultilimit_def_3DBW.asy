import graph3;
import apexstyle;


//ASY file for figmultilimit_def3D.asy in Chapter 12

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic((10.3,-3.3,2.4),(-0.004,0.001,0.016),(0,0,0),1,(0,0));
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
pair xbounds=(-0.5,3);
pair ybounds=(-0.5,3);
pair zbounds=(-0.1,2.25);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw surface z=2-x^2/4-y^2/4
triple f(pair t) {
  return (sqrt(4*(2-t.y))*cos(t.x),sqrt(4*(2-t.y))*sin(t.x),t.y);
}
surface s=surface(f,(0,0.75),(pi/2,2),10,10,Spline);
pen p=rgb(0,0,.7);
draw(s,emissive(surfacepen),meshpen=apexmeshpen);

//draw the dot on the surface and in the xy-plane
dotfactor=3;dot((1,1,1.5));dot((1,1,0));

//draw the dashed circle in the xy-plane of radius 0.5 with label
triple g(real t) {return (1+.24*cos(t),1+.24*sin(t),0);}
path3 mypath=graph(g,0,2*pi,operator ..); 
draw(mypath,linetype(new real[] {4,4})+rgb(.1,.1,.1)+linewidth(1.5));
label("$(x_0,y_0,0)$",(2,2,0));
draw((1.6,1.6,0)--(1.1,1.1,0),linewidth(0.75),Arrow3(size=3mm));

//draw the dashed circle on the surface of radius 0.5 with label
triple g(real t) {
return (1+.24*cos(t),1+.24*sin(t),2-((1+.24*cos(t))^2)/4-((1+.24*sin(t))^2)/4);
}
path3 mypath=graph(g,0,2*pi,operator ..); 
draw(mypath,linetype(new real[] {4,4})+rgb(.1,.1,.1)+linewidth(1.5));
label("$(x_0,y_0,L)$",(2.,2,2.5));
draw((1.8,1.8,2.2)--(1.1,1.1,1.6),linewidth(0.75),Arrow3(size=3mm));

draw((0,-.1,1.5)--(0,0,1.5));
label("$L$",(0,-.1,1.5),W);

draw((0,-.1,1.7)--(0,0,1.7));
label("$L+\epsilon$",(0,-.1,1.7),W);
draw((0,-.1,1.3)--(0,0,1.3));
label("$L-\epsilon$",(0,-.1,1.3),W);

//draw((1,1,0)--(1+.5*cos(3*pi/2),1+.5*sin(3*pi/2),0),dashed+rgb(.1,.1,.1)+linewidth(0.75));
//label("$\delta$",((1,1,0)+(1+.5*cos(3*pi/2),1+.5*sin(3*pi/2),0))/2,N);




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