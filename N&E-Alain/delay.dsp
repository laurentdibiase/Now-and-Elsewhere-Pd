										   
/* ========= DESCRITPION ==========

Simple d samples fractional delay based on 2 interpolated delay lines where n is the maximum delay length as a number of samples.
(de.)sdelay

smooth delay: a mono delay that doesn’t click and doesn’t transpose when the delay time is changed.
Usage

    N: maximal delay in samples (524288 ou 262144)
    inter: interpolation time (in samples) for example 1024
    dt: delay time (in samples)

*/										   
import("stdfaust.lib");				   
										   
process = _ <:(ba.bypass1(bpc, Delay)), _ : (*(w), *(1-w)) :> _;
	
Delay =  _ <:(+ : de.sdelay(N,inter,(d * ma.SR))) ~*(f),_ :> _;

N = 262144;
inter = hslider ("Interpol",10,0.1,100,0.1) * ma.SR /1000.0: si.smoo;
d = hslider ("Time[unit:s]",1, 0.001, 2, 0.001) : si.smoo;
f = hslider ("Feedback",0,0,0.999,0.001) : si.smoo;
w = hslider("[4]Dry/Wet", 1, 0, 1, 0.01): si.smoo;
bpc = checkbox("[5]Bypass"): si.smooth(0.05);
										   
