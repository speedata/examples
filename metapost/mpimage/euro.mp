def tand expr x = (sind (x) / cosd (x)) enddef;

path unitcircle; unitcircle:=fullcircle scaled 2;
%unitcircle has radius of 1

if not boolean show_lines:
    boolean show_lines; show_lines = false;
fi

if not boolean show_dots:
    boolean show_dots; show_dots = false;
fi

if not boolean show_labels:
    boolean show_labels; show_labels = false;
fi

pair midpoint; midpoint := (.5box.width,.5box.height);

path inner, outer; % the big circle: inner and outer part
path hbar; % horizontal bar
path a[]; % aux paths for intersections
path clippath; % path for clipping
pair topbarleft, bottombarleft;
pair o[]; % official points
pair c[]; % clip points
picture cp; %currentpicture for clipping

x := box.width / 14;
radius:=5.5x;
topbarlength := 10x;
thickness:=1x;
o1 = (0 ,-radius-.5thickness);
o2 = dir 40 * (radius-.5thickness);
o3 = dir -40 * (radius-.5thickness);
alpha := angle (o2-o1);
a1 := o1 -- o2; % the right slant
a2 := origin -- o3; % the lower 40deg. angle

draw unitcircle scaled radius withpen pencircle scaled thickness;

hbar := unitsquare xscaled topbarlength yscaled thickness slanted (1/tand (alpha));

% top bar lrcorner:
c3 := ((-infinity,0.5x) -- (infinity , 0.5x)) intersectionpoint a1;
topbarleft := (xpart c3 - topbarlength , 0.5x);
bottombarleft := (xpart c3 - topbarlength ,-0.5x - thickness);

fill hbar shifted topbarleft;
fill hbar shifted bottombarleft;

cp := currentpicture;
c2 := a1 intersectionpoint a2;
c4 := o2 + dir alpha *2thickness;
c5 := (xpart o3, ypart lrcorner cp);
outer := unitcircle scaled (radius+.5thickness);
c1 := (o1--c4) intersectionpoint outer;
clippath := llcorner cp -- c5 -- o3 -- c2 -- c1 -- (xpart c1,ypart urcorner cp) -- ulcorner cp -- cycle ;
clip currentpicture to clippath;
currentpicture := currentpicture;

if show_lines:
    inner := unitcircle scaled (radius-.5thickness);
    pickup pencircle scaled 1pt;
    drawoptions (withcolor .7white);
    draw inner; draw outer;
    draw a1 dashed evenly;
    draw origin -- o2 dashed evenly;
    draw a2 dashed evenly;
    draw hbar shifted topbarleft;
    draw hbar shifted bottombarleft;
    draw clippath;
fi
if show_dots:
    pickup pencircle scaled 2pt;
    drawoptions (withcolor .5white);
    draw origin;
    draw c1; draw c2;
    draw c3; draw c4;
    draw c5;
    draw o1; draw o2;
    draw topbarleft;
    draw bottombarleft;
fi
if show_labels:
    defaultfontfamily := "mptext";
    drawoptions (withcolor darkblue);
    label.bot(txt("origin"),origin);
    label.bot(txt("bottombarleft"),bottombarleft);
    label.bot(txt("topbarleft"),topbarleft);
    label.rt (txt("c1"),c1);
    label.rt (txt("c2"),c2);
    label.rt (txt("c3"),c3);
    label.rt (txt("c4"),c4);
    label.bot(txt("c5"),c5);
    label.bot(txt("o1"),o1);
    label.bot(txt("o2"),o2);
    label.rt (txt("o3"),o3);
fi
if show_lines:
    draw bbox currentpicture dashed evenly withcolor .7white ;
fi
