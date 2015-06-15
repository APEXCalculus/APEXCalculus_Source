import graph3;
import apexstyle;


//ASY file for figcrosspparallelpiped.asy in Chapter 10
// NOT SHADED!!


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
//real[] myxchoice={};
//real[] myychoice={};
//real[] myzchoice={};
defaultpen(0.5mm);
//xaxis3("$x$",-0.5,1,black,OutTicks(myxchoice),Arrow3(size=3mm));
//yaxis3("$y$",-1,1,black,OutTicks(myychoice),Arrow3(size=3mm));
//zaxis3("$z$",-0.5,1.5,black,OutTicks(myzchoice),Arrow3(size=3mm));

//Draw the parallelepiped with u=<1,1,0>, v=<-1,1,0>, w=<0,1,1>
draw((0,0,0)--(1,1,0), Arrow3(size=3mm));// u
label("$\vec{u}$",(1,1,0),W);
draw((0,0,0)--(-1,1,0), dashed,Arrow3(size=3mm));// v
label("$\vec{v}$",(-1,1,0),N);
draw((0,0,0)--(0,1,1), Arrow3(size=3mm));// w
label("$\vec{w}$",(0,1,1),W);
//shifted u to get the other edges of the box
draw((-1,1,0)--(0,2,0),rgb(.1,.1,.1)+dashed);// u shifted to v
draw((0,1,1)--(1,2,1),rgb(.1,.1,.1));// u shifted to w
draw((-1,2,1)--(0,3,1),rgb(.1,.1,.1));// u shifted to v+w
//shifted v to get the other edges of the box
draw((1,1,0)--(0,2,0),rgb(.1,.1,.1));// v shifted to u
draw((0,1,1)--(-1,2,1),rgb(.1,.1,.1));// v shifted to w
draw((1,2,1)--(0,3,1),rgb(.1,.1,.1));// v shifted to u+w
//shifted w to get the other edges of the box
draw((1,1,0)--(1,2,1),rgb(.1,.1,.1));// w shifted to u
draw((-1,1,0)--(-1,2,1),rgb(.1,.1,.1)+dashed);// w shifted to v
draw((0,2,0)--(0,3,1),rgb(.1,.1,.1));// w shifted to u+v




// MIGHT BE ABLE TO USE THIS TO FILL IN THE 6 SIDES
// Fill in the parallelogram
//I changed the viewpoint to (1,4,1), then added://Hartman comment
//triple f(pair t) {return (1+t.x+2t.y,1+2t.x+2t.y,1+t.x+t.y);}
//surface s=surface(f,(0,0),(1,1),1,1);
//pen p=rgb(0,0,.7);
//draw(s,rgb(.6,.6,1)+opacity(1),meshpen=p);

//OR THIS FROM THE WEB????
//http://tex.stackexchange.com/questions/137153/fill-a-region-between-two-coplanar-paths-in-asymptote
//settings.outformat="pdf";
//settings.render=0;
//import three;
//size(5cm);
//path3 p =  (0,-2,-2)-- (0,2,-2) -- (0,2,2) -- (0,-2,2) -- (0,-2,-2) -- (0,-2,-2);
//path3 q =  (0,-.25,-1.1) -- (0,.25,-1.1) -- (0,.25,1.1) -- (0,-.25,1.1) -- (0,-.25,-1.1);
//draw(surface(p -- reverse(q) -- cycle), emissive(yellow));
//draw(p ^^ q, black);

//my try
import three;
path3 p =  (0,0,0)-- (1,1,0) -- (0,2,0) -- (-1,1,0); //Left
draw(surface(p -- cycle), emissive(surfacepen));
path3 p =  (0,0,0)-- (1,1,0) -- (1,2,1) -- (0,1,1); //bottom
draw(surface(p -- cycle), emissive(surfacepen));
path3 p =  (-1,1,0)-- (0,2,0) -- (0,3,1) -- (-1,2,1); //right
draw(surface(p -- cycle), emissive(surfacepen));
path3 p =  (0,0,0)-- (-1,1,0) -- (-1,2,1) -- (0,1,1); //back
draw(surface(p -- cycle), emissive(surfacepen));
path3 p =  (1,1,0)-- (0,2,0) -- (0,3,1) -- (1,2,1); //front
draw(surface(p -- cycle), emissive(surfacepen));
path3 p =  (0,1,1)-- (1,2,1) -- (0,3,1) -- (-1,2,1); //top
draw(surface(p -- cycle), emissive(surfacepen));





// ////////////////////////////////////
//    SAMPLE CODE

// defaultpen(fontsize(10pt));

//real f(pair z) {return -z.x^4+2*z.x^2-z.y^4+2*z.y^2;}
//surface s=surface(f,(-1.5,-1.5),(1.5,1.5),Spline);

//triple f(pair t) {
//  return (cos(t.x)*1.5*cos(t.y),sin(t.x)*cos(t.y),sin(t.y));
//}
//surface s=surface(f,(0,0),(pi,2*pi),8,8,Spline);

//draw(s,palergb(.1,.1,.1));
//draw(s,lightrgb(.1,.1,.1),meshpen=black+thick(),nolight,render(merge=true));
//draw(mypath,2bp+rgb(.1,.1,.1));

//triple g(real t) {return (t,t,-2*t^4+4*t^2);}
//path3 mypath=graph(g,-1,1,operator ..);

//pen p=rgb(0,0,1);
//draw(s,palergb(.1,.1,.1)+opacity(.5),meshpen=p,render(merge=true));