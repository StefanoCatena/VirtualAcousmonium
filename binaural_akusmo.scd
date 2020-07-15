~buf = Buffer.readChannel(s, thisProcess.nowExecutingPath.dirname ++ "/Klingeln.wav");
i = Buffer.read(s, thisProcess.nowExecutingPath.dirname ++ "/BIG HALL E001 M2S.wav");

~revBus = Bus.audio(s, 2);
~srcBus = Bus.audio(s, 2);
~fftsize = 2048;
{
	//~binDec = FoaDecoderKernel.newSpherical(5, s, 44100);
	//~binEnc = FoaEncoderMatrix.newDirection(0, 0);
	BinAmbi3O.kemarPath_(thisProcess.nowExecutingPath.dirname ++ "/full/");
	s.sync;
	BinAmbi3O.init('1_4_7_4');
	s.sync;
	a = PartConv.calcBufSize(~fftsize, i);
	~ir = Buffer.alloc(s, a, 1);
	~ir.preparePartConv(i, ~fftsize);
	s.sync;
	i.free;
}.fork;


SynthDef(\player, {
	arg amp = 1, reset = 0, trig = 0;
	var sig, phase, env;
	var dur = BufDur.kr(~buf);
	env = Trig.kr(trig, 0.1);
	phase = Phasor.ar(env, 1, 0, BufFrames.kr(~buf), reset);
	// 10 times per second, send back current frame
	sig = BufRd.ar(2, ~buf, phase);
	SendReply.ar(Impulse.ar(1), '/phase', phase);
	SendReply.ar(Impulse.ar(10), '/master',  Amplitude.kr(sig*amp*2));
	Out.ar(~srcBus, sig*amp);
}).add;
/*
SynthDef(\src, {
arg x = 0, y = 1, lpf, hpf, amp, dist, eq1, db1, eq2, db2, eq3, db3;
var sig, enc, dec, d, rot, pol, rev, out, in, eq, del;
in = In.ar(~srcBus, 2)*amp;
pol = Cartesian.new(y, x).mirrorY;
sig = LPF.ar(HPF.ar(in, hpf), lpf);
eq = BPeakEQ.ar(sig, eq1, 0.5, db1);
eq = BPeakEQ.ar(eq, eq2, 0.5, db2);
eq = BPeakEQ.ar(eq, eq3, 0.5, db3);
enc = FoaPanB.ar(sig, pol.angles);
dec = FoaDecode.ar(enc, ~binDec);
del = DelayN.ar(dec, 0.3, dist.linlin(0, 5, 0.001, 0.3));
rev = FreeVerb.ar(del, 1, 0.7, 0.8);
out = (dec*(1/dist))+(rev*(1/dist.sqrt));
Out.ar(~revBus, LeakDC.ar(out));
}).add;
*/
SynthDef(\sub, {
	|amp|
	var sig;
	sig = In.ar(~srcBus, 2)*amp;
	sig = HPF.ar(LPF.ar(sig, 250), 20);
	SendReply.kr(Impulse.kr(10), '/sub', Amplitude.kr(sig*amp*2));
	Out.ar(~revBus, sig);
}).add;

SynthDef(\src, {
	arg x = 1, y = 0, lpf, hpf, amp, d, eq1, db1, eq2, db2, eq3, db3, id;
	var sig, enc, dec, out, rev, del, eq;

	x = x.linlin(-1, 1, -pi/4, pi/4);
	y = y.linlin(-1, 1, -pi/4, pi/4);

	sig = In.ar(~srcBus, 2)*amp;

	sig = LPF.ar(sig, d.linexp(0.05, 5, 8000+rrand(-200, 200), 18000));
	sig = LPF.ar(HPF.ar(sig, hpf), lpf);
	eq = BPeakEQ.ar(sig, eq1, 0.5, db1);
	eq = BPeakEQ.ar(eq, eq2, 0.5, db2);
	eq = BPeakEQ.ar(eq, eq3, 0.5, db3);

	enc = PanAmbi3O.ar(sig, x, y);
	dec = BinAmbi3O.ar(enc);

	del = DelayN.ar(dec, 0.6, d.linlin(0, 5, 0.001, 0.6));
	rev = FreeVerb.ar(del, 1, 0.8, 0.8);
	out = (dec*(1/d)+(rev*(1/d.sqrt)));

	SendReply.kr(Impulse.kr(10), '/levels', [id, Mix.ar(Amplitude.kr(out*amp*3))]);

	Out.ar(~revBus, out);
}).add;

SynthDef(\reverb, {
	|mix|
	var in, out;
	in = In.ar(~revBus, 2);
	out = (in*mix)+(PartConv.ar(in, ~fftsize, ~ir.bufnum, 0.1)*(1-mix));
	Out.ar(0, out);
}).add;

