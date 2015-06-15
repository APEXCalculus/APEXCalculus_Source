import graph3;

//ASY file for figlines_dist23D.asy in Chapter 10

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic((-.14,-9.67,3.98),(0.003,0.01,0.026),(0,0,0),1.5,(-0.09,-0.2));
defaultrender.merge=true;

usepackage("mathspec");
usepackage("esvect");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");


// setup and draw the axes
real[] myxchoice={};
real[] myychoice={};
real[] myzchoice={};
defaultpen(0.5mm);
pair xbounds=(-3,3);
pair ybounds=(-3,3);
pair zbounds=(-3,3);

xaxis3("",xbounds.x,xbounds.y,invisible,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,invisible,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,invisible,OutTicks(myzchoice),Arrow3(size=3mm));

triple p1=(0,0,0);
triple p2=(0,0,2);
triple p12=p2-p1;
triple d1=(1,0,0);
triple d2=(1,1,-1);

// line 1
triple f(real t) {
	return (p1+t*d1);}
	
	// line 2
triple g(real t) {
	return (p2+t*d2);}


//draw P1 (t=0) and vector d1 at P1 (t=1)
dotfactor=3;
dot(p1);label("$P_1$",p1,S);
draw(f(0)--f(.6),red+.7mm,Arrow3(size=2mm));
label("$\vec{d}_1$",f(.6),S);

//draw P2 (t=-1.5) and vector d2 at P2 (t=-0.5)
dotfactor=3;
dot(p2);label("$P_2$",p2,N);
draw(g(0)--g(.6),red+.7mm,Arrow3(size=2mm));
label("$\vec{d}_2$",g(.6),N);

//draw vector P1 to P2
draw(p1--p2,black,Arrow3(size=2mm));
//label("$\overrightarrow{P_1 P_2}$",(p1+p2)/2,W);
label("$\vv{P_1 P_2}$",(p1+p2)/2,W);

//draw the lines
draw(f(-1)--f(0),blue);//L1
draw(f(.6)--f(2),blue);//L1
draw(g(-1)--g(0),blue);//L2
draw(g(.6)--g(2),blue);//L2

triple c=cross(d1,d2);
c=c/sqrt(dot(c,c));

//draw perp line
draw(f(1)--f(1)+c*abs(dot(p12,c)),black);

// draw perp vector
draw(f(.9)--f(.9)+c*abs(dot(p12,c))*.4,red,Arrow3(size=2mm));
label("$\vec c$",f(.9)+c*abs(dot(p12,c))*.4,W);

label("$h$",(f(1)+f(1)+c*abs(dot(p12,c)))/2,E);

// draw squares on perp line
triple sq1a = f(1)+c*abs(dot(p12,c))*.15;
triple sq1b = sq1a+.15*d1;
triple sq1c = sq1b+(f(1)-sq1a);
draw(sq1a -- sq1b -- sq1c); 

triple sq2a = f(1)+c*abs(dot(p12,c))*.85;
triple sq2b = sq2a+.15*d2/length(d2);
triple sq2c = sq2b+(f(1)+c*abs(dot(p12,c))-sq2a);
draw(sq2a -- sq2b -- sq2c); 


