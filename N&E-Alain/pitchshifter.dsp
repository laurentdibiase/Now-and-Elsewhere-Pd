/* ========= DESCRITPION ==========
Pitchshifting Mono - A simple pitch shifter based on 2 delay lines .transpose 
is a standard Faustfunction, with bypass and Wet/Dry effect.

w: the window length (samples)
x: crossfade duration duration (samples),fixed value 4096 or not
s: shift (semitones)

*/										   

import("stdfaust.lib");					   
										   
process = _ <:(ba.bypass1(bpc, pitchshift)), _ : (*(w), *(1-w)) :> _;	
//process = pitchshift;	
											  
pitchshift =  _ : ef.transpose(l, x, s) : _;
											  
bpc = checkbox("[5]Bypass"): si.smooth(0.05);						
l = hslider ("[2]Length",1024,10,8192,1): si.smoo;
x = hslider ("[1]Duration",10,10,4096,1): si.smoo;
s = hslider ("[3]Shift",0,-24,24,1): si.smoo;	
w = hslider("[4]Dry/Wet", 1, 0, 1, 0.01): si.smoo;					