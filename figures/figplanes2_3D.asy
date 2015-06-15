import graph3;

//ASY file for figplanes2.asy in Chapter 10

size(200,200,Aspect);
//size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic((-16,18.6,6.76),(0.014,-0.015,0077),(0,0,0),.99);
defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");


// setup and draw the axes
real[] myxchoice={5};
real[] myychoice={5};
real[] myzchoice={-5};
defaultpen(0.5mm);
pair xbounds=(-4,6);
pair ybounds=(-1,6);
pair zbounds=(-6,5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the plane
triple f(pair t) {
  return (t.x,t.y,(5/7)*t.x+(4/7)*t.y-1);
}
surface s=surface(f,(-5,-6),(5,6),8,8,Spline);
pen p=rgb(0,0,.7)+.1mm;
draw(s,rgb(.6,.6,1)+opacity(.7),meshpen=p,nolight,render(merge=true));

//Draw points P=(-1,3,0)
dotfactor=3;dot((-1,3,0));label("$P$",(-1,3,0),E);

//Draw normal vector at P, n=(5,4,-7)
draw((-1,3,0)--(4,7,-7),black,Arrow3(size=2mm));//n at P
label("$\vec{n}$",(4,7,-7),W);



//draw the lines -5+2t,1+t,-4+2t  and 2+3t,1-2t,1+t
draw((5,6,6)--(-5,1,-4),blue);label("$\ell_1$",(5,6,6),N);//L1
draw((5,-1,2)--(-4.9,5.6,-1.3),blue);label("$\ell_2$",(5,-1,2),N);//L2



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
//draw(s,paleblue+opacity(.5),meshpen=p,render(merge=true));

//draw(s,paleblue);
//draw(s,lightblue,meshpen=black+thick(),nolight,render(merge=true));
//draw(mypath,2bp+blue);