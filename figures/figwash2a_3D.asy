import graph3;

//ASY file for figwasher_idea_a_3D.asy in Chapter 7


size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic((13.6,14.55,43),(0,1,0),(0,0,0),1,(0.029,-0.015));
defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");

// setup and draw the axes
real[] myxchoice={-1,-2,1,2};
real[] myychoice={1,2,3};
real[] myzchoice={};
defaultpen(0.5mm);

pair xbounds=(-2.2,2.2);
pair ybounds=(-.2,3.2);
pair zbounds=(-2.2,2.2);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,invisible,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
//label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//  \addplot3[domain=1:3,y domain=0:1,surf,shader=flat,colormap={mp2}{\colormapone}] 
//  (axis cs:1,0,1) -- (axis cs:2,0,1)--(axis cs:2,0,3) -- cycle;

//path3 p=(3/2,2/3,0)..(0,2/3,3/2)..(-3/2,2/3,0)..(0,2/3,-3/2);
//draw(surface(p .. cycle), emissive(rgb(1,.6,.6)+opacity(0.5)));
//draw(p..cycle,red+.4mm);

path3 p1=(1,1,0)--(2,1,0)--(2,3,0);
draw(surface(p1 -- cycle), emissive(rgb(.6,.6,1)+opacity(0.5)));
draw(p1--cycle,blue+.4mm);


//\draw (axis cs: 0,0,1.2) -- (axis cs:2,0,1.2);
//\draw (axis cs: .8,0,.5) node {\scriptsize $R(y)=2$};
//\filldraw (axis cs:0,0,1.2) circle (1pt) 
//					(axis cs:2,0,1.2) circle (1pt)
//					(axis cs:0,0,2.6) circle (1pt)
//					(axis cs:1.8,0,2.6) circle (1pt);
//\draw (axis cs: 0,0,2.6) -- (axis cs:1.8,0,2.6);
//\draw (axis cs: 1.5,0,3.2) node  {\scriptsize $r(y)=\frac12(y+1)$};

triple dot1=(0,1.2,0);
triple dot2=(2,1.2,0);
triple dot3=(0,2.6,0);
triple dot4=(1.8,2.6,0);

draw(dot1--dot2,black+.2mm);
draw(dot3--dot4,black+.2mm);

dotfactor=2;
dot(dot1);
dot(dot2);
dot(dot3);
dot(dot4);

label("$R(y)$",dot2+.7*(dot1-dot2),S);
label("$r(y)$",dot4+.7*(dot3-dot4),N);






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




