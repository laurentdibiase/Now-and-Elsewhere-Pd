declare name "6ToStereo";
declare version "1.0";
declare author "Laurent Di Biase";
declare license "BSD";
declare copyright "(c)CICM 2013";

import("stdfaust.lib");


r1 = hslider("Radius1", 1.0, 0, 5, 0.001) : si.smooth(ba.tau2pole(0.02));
a1 = hslider("Angle1", 0, ma.PI*(-2), ma.PI*2, 0.001) : si.smooth(ba.tau2pole(0.02));
r2 = hslider("Radius2", 1.0, 0, 5, 0.001) : si.smooth(ba.tau2pole(0.02));
a2 = hslider("Angle2", ma.PI*(1/3), ma.PI*(-2), ma.PI*2, 0.001) : si.smooth(ba.tau2pole(0.02));
r3 = hslider("Radius3", 1.0, 0, 5, 0.001) : si.smooth(ba.tau2pole(0.02));
a3 = hslider("Angle3", ma.PI*(2/3), ma.PI*(-2), ma.PI*2, 0.001) : si.smooth(ba.tau2pole(0.02));
r4 = hslider("Radius4", 1.0, 0, 5, 0.001) : si.smooth(ba.tau2pole(0.02));
a4 = hslider("Angle4", ma.PI, ma.PI*(-2), ma.PI*2, 0.001) : si.smooth(ba.tau2pole(0.02));
r5 = hslider("Radius5", 1.0, 0, 5, 0.001) : si.smooth(ba.tau2pole(0.02));
a5 = hslider("Angle5", ma.PI*(-2/3), ma.PI*(-2), ma.PI*2, 0.001) : si.smooth(ba.tau2pole(0.02));
r6 = hslider("Radius6", 1.0, 0, 5, 0.001) : si.smooth(ba.tau2pole(0.02));
a6 = hslider("Angle6", ma.PI*(-1/3), ma.PI*(-2), ma.PI*2, 0.001) : si.smooth(ba.tau2pole(0.02));


/*

r1 = hslider("Radius1", 1.0, 0, 5, 0.001) : si.smooth(ba.tau2pole(0.02));
a1 = hslider("Angle1", 0, ma.PI*(-2), ma.PI*2, 0.001) : si.smooth(ba.tau2pole(0.02));
r2 = hslider("Radius2", 1.0, 0, 5, 0.001) : si.smooth(ba.tau2pole(0.02));
a2 = hslider("Angle2", 0, ma.PI*(-2), ma.PI*2, 0.001) : si.smooth(ba.tau2pole(0.02));
r3 = hslider("Radius3", 1.0, 0, 5, 0.001) : si.smooth(ba.tau2pole(0.02));
a3 = hslider("Angle3", 0, ma.PI*(-2), ma.PI*2, 0.001) : si.smooth(ba.tau2pole(0.02));
r4 = hslider("Radius4", 1.0, 0, 5, 0.001) : si.smooth(ba.tau2pole(0.02));
a4 = hslider("Angle4", 0, ma.PI*(-2), ma.PI*2, 0.001) : si.smooth(ba.tau2pole(0.02));
*/

process(sig1, sig2, sig3, sig4, sig5, sig6) = ho.map(1, sig1, r1, a1), ho.map(1, sig2, r2, a2), ho.map(1, sig3, r3, a3), ho.map(1, sig4, r4, a4), ho.map(1, sig5, r5, a5), ho.map(1, sig6, r6, a6) :> ho.optimInPhase(1) <: (ho.decoderStereo(1));

