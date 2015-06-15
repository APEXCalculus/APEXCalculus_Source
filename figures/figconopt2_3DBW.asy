import graph3;
import apexstyle;


//ASY file for figconopt23D.asy in Chapter 12

size(200,200,IgnoreAspect);
//size(200,200,Aspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(176,-2075,580);
defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");

// setup and draw the axes
real[] myxchoice={20};
real[] myychoice={50,100};
real[] myzchoice={20,40,60,80};
defaultpen(0.5mm);
pair xbounds=(-5,40);
pair ybounds=(-2,150);
//pair zbounds=(0,100000);
pair zbounds=(0,100);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$w$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$\ell$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("\centering $V$\\ (in thousands)",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)),N);

//Draw surface z=x^2*y
triple f(pair t) {
  return (t.x,t.y,t.x^2*t.y/1000);
}
surface s=surface(f,(0,0),(32.5,130),16,16,Spline);
//s=crop(s,(-1,-1,-1),(33,135,100));
pen p=rgb(0,0,.7);
draw(s,emissive(surfacepen),meshpen=apexmeshpen);

//Draw path in plane
draw((32.5,0,0)--(0,130,0),rgb(.3,.3,.3)+dashed+linewidth(1));

//Draw path on surface
triple g(real t) {return (t,130-4*t,t^2*(130-4*t)/1000);}
path3 mypath=graph(g,0,32.5,operator ..); draw(mypath,rgb(.3,.3,.3)); //side 1


//Dots at max point
dotfactor=4; dot((21.67,43.33,19.4));





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