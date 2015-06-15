import graph3;
import apexstyle;


//ASY file for figpartial4b3D.asy in Chapter 12

size(200,200,IgnoreAspect);
//size(200,200,Aspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(8,2.6,4.7);
defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");


// setup and draw the axes
real[] myxchoice={1,2};
real[] myychoice={1,2};
real[] myzchoice={2};
defaultpen(0.5mm);
pair xbounds=(-0.5,2.5);
pair ybounds=(-0.5,2.5);
pair zbounds=(-3.5,3.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw surface z=\addplot3[domain=-.1:2,y domain=-.1:2,surf,colormap={mp2}{\colormapplaneone}//,shader=faceted,faceted color=black!40,samples y=20,very thin,z buffer=sort,%opacity=.6,
//samples=20,] (x,y,{4*x*y-x^4-y^4});

bool cond(pair t) {return 4*t.x*t.y-(t.x)^4-(t.y)^4 >-3;}

//triple f(pair t) {
//  return (t.x,t.y,4*t.x*t.y-(t.x)^4-(t.y)^4);
//}
//surface s=surface(f,(-.1,-.1),(1.5,1.5),16,16,Spline);
//pen p=rgb(0,0,.7);
//draw(s,emissive(surfacepen),meshpen=apexmeshpen);

triple f(pair t) {
  return (cos(t.x)*t.y+1,sin(t.x)*t.y+1,4*(cos(t.x)*t.y+1)*(sin(t.x)*t.y+1)-(cos(t.x)*t.y+1)^4-(sin(t.x)*t.y+1)^4);
}
surface s=surface(f,(0,0),(2*pi,.75),16,16,Spline);
pen p=rgb(0,0,.7);
draw(s,emissive(surfacepen),meshpen=apexmeshpen);

//plot point on surface
dotfactor=3;
dot((1,1,2));

//Draw traces on the surface
//triple g(real t) {return (t,pi-t,sin(t)*cos(pi-t));}
//path3 mypath=graph(g,0,3.75,operator ..); draw(mypath,rgb(.1,.1,.1));





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