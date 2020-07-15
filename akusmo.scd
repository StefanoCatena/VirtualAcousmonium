(
(thisProcess.nowExecutingPath.dirname ++"/binaural_akusmo.scd").load;
(thisProcess.nowExecutingPath.dirname ++"/schema.scd").load;
(thisProcess.nowExecutingPath.dirname ++"/midi.scd").load;
(thisProcess.nowExecutingPath.dirname ++"/functions.scd").load;
)
(
var sliders, width, height;

//SEMPRE PER PRIMO
~reverb = Synth(\reverb, [\mix, 0.9]);
~coronaIntLeft = Group.new;
~coronaIntRight= Group.new;
~coronaEstLeft = Group.new;
~coronaEstRight = Group.new;
~tweeterL = Group.new;
~tweeterR = Group.new;
~values = Array.fill(24, {0});

//SUB, TROMBE x2, MEDI x2, MEDIALTI x2, MAIN JBL x2, FAR MAIN x2, Balconata int Front x4 (2 slider), Balconata int Back x2, Balconata ext Front x4 (2 slider), Balconata ext Back x2, TWEETER CEILING x4 (2slider)

//SUB PALCO //il sub lo considero omnidirezionale
~sub = Synth(\sub, [\amp, 0]);

//TROMBE

~trombaL = Synth(\src, [\id, 0, \x, ~xPositions[0], \y, ~yPositions[0], \amp, 0, \lpf, 20000, \hpf, 3500+rrand(-100, 100), \d, ~distances[0], \eq1, 4000+(rrand(0, 100)*60), \db1, 0+rrand(-10, 10), \eq2, 4000+(rrand(0, 100)*60), \db2, 0+rrand(-10, 10), \eq3, 4000+(rrand(0, 100)*60), \db3, 0+rrand(-10, 10)]);
~trombaR = Synth(\src, [\id, 1, \x, ~xPositions[1], \y, ~yPositions[1], \amp, 0, \lpf, 20000, \hpf, 3500+rrand(-100, 100), \d, ~distances[1], \eq1, 4000+(rrand(0, 100)*60), \db1, 0+rrand(-10, 10), \eq2, 4000+(rrand(0, 100)*60), \db2, 0+rrand(-10, 10), \eq3, 4000+(rrand(0, 100)*60), \db3, 0+rrand(-10, 10)]);

//MEDI PALCO
~mediL = Synth(\src, [\id, 2, \x, ~xPositions[2], \y, ~yPositions[2], \amp, 0, \lpf, 1000+rrand(-50, 50), \hpf, 350+rrand(-20, 20), \d, ~distances[2], \eq1, 100, \db1, 0, \eq2, 100, \db2, 0, \eq3, 100, \db3, 0]);
~mediR = Synth(\src, [\id, 3, \x, ~xPositions[3], \y, ~yPositions[3], \amp, 0, \lpf, 1000+rrand(-50, 50), \hpf, 350+rrand(-20, 20), \d, ~distances[3], \eq1, 100, \db1, 0, \eq2, 100, \db2, 0, \eq3, 100, \db3, 0]);

//MEDIO ALTI PALCO
~mediAltiL = Synth(\src, [\id, 4, \x, ~xPositions[4], \y, ~yPositions[4], \amp, 0, \lpf, 3500+rrand(-150, 150), \hpf, 600+rrand(-50, 50), \d, ~distances[4], \eq1, 100, \db1, 0, \eq2, 100, \db2, 0, \eq3, 100, \db3, 0]);
~mediAltiR = Synth(\src, [\id, 5, \x, ~xPositions[5], \y, ~yPositions[5], \amp, 0, \lpf, 3500+rrand(-150, 150), \hpf, 600+rrand(-50, 50), \d, ~distances[5], \eq1, 100, \db1, 0, \eq2, 100, \db2, 0, \eq3, 100, \db3, 0]);


//MAIN JBL
~main1L = Synth(\src, [\id, 6, \x, ~xPositions[6], \y, ~yPositions[6], \amp, 0, \lpf, 20000, \hpf, 50, \d, ~distances[6], \eq1, 4000+(rrand(0, 100)*60), \db1, 0+rrand(-10, 10), \eq2, 4000+(rrand(0, 100)*60), \db2, 0+rrand(-10, 10), \eq3, 4000+(rrand(0, 100)*60), \db3, 0+rrand(-10, 10)]);
~main1R = Synth(\src, [\id, 7, \x, ~xPositions[7], \y, ~yPositions[7], \amp, 0, \lpf, 20000, \hpf, 50, \d, ~distances[7], \eq1, 4000+(rrand(0, 100)*60), \db1, 0+rrand(-10, 10), \eq2, 4000+(rrand(0, 100)*60), \db2, 0+rrand(-10, 10), \eq3, 4000+(rrand(0, 100)*60), \db3, 0+rrand(-10, 10)]);

//MAIN JBL
~farL = Synth(\src, [\id, 8, \x, ~xPositions[8], \y, ~yPositions[8], \amp, 0, \lpf, 20000, \hpf, 50, \d, ~distances[8], \eq1, 4000+(rrand(0, 100)*60), \db1, 0+rrand(-10, 10), \eq2, 4000+(rrand(0, 100)*60), \db2, 0+rrand(-10, 10), \eq3, 4000+(rrand(0, 100)*60), \db3, 0+rrand(-10, 10)]);
~farR = Synth(\src, [\id, 9, \x, ~xPositions[9], \y, ~yPositions[9], \amp, 0, \lpf, 20000, \hpf, 50, \d, ~distances[9], \eq1, 4000+(rrand(0, 100)*60), \db1, 0+rrand(-10, 10), \eq2, 4000+(rrand(0, 100)*60), \db2, 0+rrand(-10, 10), \eq3, 4000+(rrand(0, 100)*60), \db3, 0+rrand(-10, 10)]);

//FAR FRONT

~backL = Synth(\src, [\id, 10, \x, ~xPositions[10] , \y, ~yPositions[10], \amp, 0, \lpf, 20000, \hpf, 50, \d, ~distances[10], \eq1, 4000+(rrand(0, 100)*60), \db1, 0+rrand(-10, 10), \eq2, 4000+(rrand(0, 100)*60), \db2, 0+rrand(-10, 10), \eq3, 4000+(rrand(0, 100)*60), \db3, 0+rrand(-10, 10)]);
~backR = Synth(\src, [\id, 11, \x, ~xPositions[11], \y, ~yPositions[11], \amp, 0, \lpf, 20000, \hpf, 50, \d, ~distances[11], \eq1, 4000+(rrand(0, 100)*60), \db1, 0+rrand(-10, 10), \eq2, 4000+(rrand(0, 100)*60), \db2, 0+rrand(-10, 10), \eq3, 4000+(rrand(0, 100)*60), \db3, 0+rrand(-10, 10)]);




//CORONA INTERNA
Synth(\src, [\id, 12, \x, ~xPositions[12], \y, ~yPositions[12], \amp, 0, \lpf, 20000, \hpf, 200, \d, ~distances[12], \eq1, 4000+(rrand(0, 100)*60), \db1, 0+rrand(-10, 10), \eq2, 4000+(rrand(0, 100)*60), \db2, 0+rrand(-10, 10), \eq3, 4000+(rrand(0, 100)*60), \db3, 0+rrand(-10, 10)], ~coronaIntLeft);
Synth(\src, [\id, 13, \x, ~xPositions[13], \y, ~yPositions[13], \amp, 0, \lpf, 20000, \hpf, 200, \d, ~distances[13], \eq1, 4000+(rrand(0, 100)*60), \db1, 0+rrand(-10, 10), \eq2, 4000+(rrand(0, 100)*60), \db2, 0+rrand(-10, 10), \eq3, 4000+(rrand(0, 100)*60), \db3, 0+rrand(-10, 10)],
	~coronaIntRight);
Synth(\src, [\id, 100, \x, ~xPositions[14], \y, ~yPositions[14], \amp, 0, \lpf, 20000, \hpf, 200, \d, ~distances[14], \eq1, 4000+(rrand(0, 100)*60), \db1, 0+rrand(-10, 10), \eq2, 4000+(rrand(0, 100)*60), \db2, 0+rrand(-10, 10), \eq3, 4000+(rrand(0, 100)*60), \db3, 0+rrand(-10, 10)], ~coronaIntLeft);
Synth(\src, [\id, 100, \x, ~xPositions[15], \y, ~yPositions[15], \amp, 0, \lpf, 20000, \hpf, 200, \d, ~distances[15], \eq1, 4000+(rrand(0, 100)*60), \db1, 0+rrand(-10, 10), \eq2, 4000+(rrand(0, 100)*60), \db2, 0+rrand(-10, 10), \eq3, 4000+(rrand(0, 100)*60), \db3, 0+rrand(-10, 10)],
	~coronaIntRight);
//BACK
~coronaIntBackL = Synth(\src, [\id, 14, \x, ~xPositions[16], \y, ~yPositions[16], \amp, 0, \lpf, 20000, \hpf, 200, \d, ~distances[16], \eq1, 4000+(rrand(0, 100)*60), \db1, 0+rrand(-10, 10), \eq2, 4000+(rrand(0, 100)*60), \db2, 0+rrand(-10, 10), \eq3, 4000+(rrand(0, 100)*60), \db3, 0+rrand(-10, 10)]);
~coronaIntBackR = Synth(\src, [\id, 15, \x, ~xPositions[17], \y, ~yPositions[17], \amp, 0, \lpf, 20000, \hpf, 200, \d, ~distances[17], \eq1, 4000+(rrand(0, 100)*60), \db1, 0+rrand(-10, 10), \eq2, 4000+(rrand(0, 100)*60), \db2, 0+rrand(-10, 10), \eq3, 4000+(rrand(0, 100)*60), \db3, 0+rrand(-10, 10)]);

//CORONA ESTERNA
Synth(\src, [\id, 16, \x, ~xPositions[18], \y, ~yPositions[18], \amp, 0, \lpf, 20000, \hpf, 200, \d, ~distances[18], \eq1, 4000+(rrand(0, 100)*60), \db1, 0+rrand(-10, 10), \eq2, 4000+(rrand(0, 100)*60), \db2, 0+rrand(-10, 10), \eq3, 4000+(rrand(0, 100)*60), \db3, 0+rrand(-10, 10)], ~coronaEstLeft);
Synth(\src, [\id, 17, \x, ~xPositions[19], \y, ~yPositions[19], \amp, 0, \lpf, 20000, \hpf, 200, \d, ~distances[19], \eq1, 4000+(rrand(0, 100)*60), \db1, 0+rrand(-10, 10), \eq2, 4000+(rrand(0, 100)*60), \db2, 0+rrand(-10, 10), \eq3, 4000+(rrand(0, 100)*60), \db3, 0+rrand(-10, 10)], ~coronaEstRight);
Synth(\src, [\id, 100, \x, ~xPositions[20], \y, ~yPositions[20], \amp, 0, \lpf, 20000, \hpf, 200, \d, ~distances[20], \eq1, 4000+(rrand(0, 100)*60), \db1, 0+rrand(-10, 10), \eq2, 4000+(rrand(0, 100)*60), \db2, 0+rrand(-10, 10), \eq3, 4000+(rrand(0, 100)*60), \db3, 0+rrand(-10, 10)], ~coronaEstLeft);
Synth(\src, [\id, 100, \x, ~xPositions[21], \y, ~yPositions[21], \amp, 0, \lpf, 20000, \hpf, 200, \d, ~distances[21], \eq1, 4000+(rrand(0, 100)*60), \db1, 0+rrand(-10, 10), \eq2, 4000+(rrand(0, 100)*60), \db2, 0+rrand(-10, 10), \eq3, 4000+(rrand(0, 100)*60), \db3, 0+rrand(-10, 10)],
	~coronaEstRight);
//BACK
~coronaEstBackL = Synth(\src, [\id, 18, \x, ~xPositions[22], \y, ~yPositions[22], \amp, 0, \lpf, 20000, \hpf, 200, \d, ~distances[22], \eq1, 4000+(rrand(0, 100)*60), \db1, 0+rrand(-10, 10), \eq2, 4000+(rrand(0, 100)*60), \db2, 0+rrand(-10, 10), \eq3, 4000+(rrand(0, 100)*60), \db3, 0+rrand(-10, 10)]);
~coronaEstBackR = Synth(\src, [\id, 19, \x, ~xPositions[23], \y, ~yPositions[23], \amp, 0, \lpf, 20000, \hpf, 200, \d, ~distances[23], \eq1, 4000+(rrand(0, 100)*60), \db1, 0+rrand(-10, 10), \eq2, 4000+(rrand(0, 100)*60), \db2, 0+rrand(-10, 10), \eq3, 4000+(rrand(0, 100)*60), \db3, 0+rrand(-10, 10)]);


//TWEETER CEILING
Synth(\src, [\id, 20, \x, ~xPositions[24], \y, ~yPositions[24], \amp, 0, \lpf, 20000, \hpf, 4000, \d, ~distances[24], \eq1, 4000+(rrand(0, 100)*60), \db1, 0+rrand(0, 10), \eq2, 4000+(rrand(0, 100)*60), \db2, 0+rrand(0, 10), \eq3, 4000+(rrand(0, 100)*60), \db3, 0+rrand(0, 10)], ~tweeterL);
Synth(\src, [\id, 21, \x, ~xPositions[25], \y, ~yPositions[25], \amp, 0, \lpf, 20000, \hpf, 4000, \d, ~distances[25], \eq1, 4000+(rrand(0, 100)*60), \db1, 0+rrand(0, 10), \eq2, 4000+(rrand(0, 100)*60), \db2, 0+rrand(0, 10), \eq3, 4000+(rrand(0, 100)*60), \db3, 0+rrand(0, 10)], ~tweeterR);
Synth(\src, [\id, 100, \x, ~xPositions[26], \y, ~yPositions[26], \amp, 0, \lpf, 20000, \hpf, 4000, \d, ~distances[26], \eq1, 4000+(rrand(0, 100)*60), \db1, 0+rrand(0, 10), \eq2, 4000+(rrand(0, 100)*60), \db2, 0+rrand(0, 10), \eq3, 4000+(rrand(0, 100)*60), \db3, 0+rrand(0, 10)], ~tweeterL);
Synth(\src, [\id, 100, \x,  ~xPositions[27], \y, ~yPositions[27], \amp, 0, \lpf, 20000, \hpf, 4000, \d, ~distances[27], \eq1, 4000+(rrand(0, 100)*60), \db1, 0+rrand(0, 10), \eq2, 4000+(rrand(0, 100)*60), \db2, 0+rrand(0, 10), \eq3, 4000+(rrand(0, 100)*60), \db3, 0+rrand(0, 10)], ~tweeterR);

~player = Synth(\player, [\amp, 0]);


~updateValues = { //aggiorno tutti i valori ogni volta che viene mosso uno slider
	~player.set(\amp, ~values[0]);

	//SUB PALCO //il sub lo considero omnidirezionale
	~sub.set(\amp, ~values[1]);

	//TROMBE
	~trombaL.set(\amp, ~values[2]);
	~trombaR.set(\amp, ~values[3]);
	//MEDI PALCO
	~mediL.set(\amp, ~values[4]);
	~mediR.set(\amp, ~values[5]);

	//MEDIO ALTI PALCO
	~mediAltiL.set(\amp, ~values[6]);
	~mediAltiR.set(\amp, ~values[7]);


	//MAIN JBL
	~main1L.set(\amp, ~values[8]);
	~main1R.set(\amp, ~values[9]);

	//MAIN JBL
	~farL.set(\amp, ~values[10]);
	~farR.set(\amp, ~values[11]);
	//FAR FRONT
	~backL.set(\amp, ~values[12]);
	~backR.set(\amp, ~values[13]);




	//CORONA INTERNA
	~coronaIntLeft.set(\amp, ~values[14]);
	~coronaIntRight.set(\amp, ~values[15]);

	//BACK
	~coronaIntBackL.set(\amp, ~values[16]);
	~coronaIntBackR.set(\amp, ~values[17]);

	//CORONA ESTERNA
	~coronaEstLeft.set(\amp, ~values[18]);
	~coronaEstRight.set(\amp, ~values[19]);
	//BACK
	~coronaEstBackL.set(\amp, ~values[20]);
	~coronaEstBackR.set(\amp, ~values[21]);


	//TWEETER CEILING
	~tweeterL.set(\amp, ~values[22]);
	~tweeterR.set(\amp, ~values[23]);

};

//SOURCES
/*
OSCdef(\listener, {
|msg|
m = msg;
{g.refresh}.defer;
}, \vals);

g = Window.new("Sources", Rect(100, 100, width, height))
.background_(Color.black)
.drawFunc_{
a.do({
Pen.translate(width/2, height/2);
Pen.fillColor_(Color.hsv(rrand(0.0, 0.999), rrand(0.0, 1.0), rrand(0.0, 1.0), 1));//colore
Pen.fillOval(Rect(m[3]*10, m[4]*10, 10, 10));
});
};
g.front;

a.do({
arg item, i;
sliders[i] = Slider(c, 30@150)
.action_({
arg v;
item.set(\amp, v.value*(1/n));
});
});
*/

// COSTRUZIONE GUI

Window.closeAll;
w = Window("Virtual Acousmonium", Rect(400, 400, 910, 550))
.front.background_(Color.gray);
w.alwaysOnTop_(true);
w.view.decorator_(FlowLayout(w.bounds, 30@30, 30@30));
w.front;
~values = Array.fill(24, {0});
c = CompositeView(w, 850@250)
.background_(Color.new(0.1, 0.1, 0.7, 0.4));
c.decorator_(FlowLayout(c.bounds, 5@5, 5@5));

~meters = Array.fill(24 , {
	LevelIndicator(c, 30@50)
	.warning_(-6.dbamp)
	.critical_(-3.dbamp)
	.drawsPeak_(true)
	.style_(\led)
	.numSteps_(12)
});

~sliders = Array.fill(24 , {
	arg i;
	Slider(c, 30@150)
	.action_({
		arg v;
		~values[i] = v.value;
		~updateValues.value();
	});
});


// etichette slider

Array.fill(24, {
	arg i;
	if( i == 0, {
		StaticText(c, 30@30).string_("Mas ter").align_(\center).align_(\top);
	});
	if( i == 1, {
		StaticText(c, 30@30).string_("Sub").align_(\center).align_(\top);
	});
	if( i == 2, {
		StaticText(c, 30@30).string_("Tpt L").align_(\center).align_(\top);
	});
	if( i == 3, {
		StaticText(c, 30@30).string_("Tpt R").align_(\center).align_(\top);
	});
	if( i == 4, {
		StaticText(c, 30@30).string_("Med L").align_(\center).align_(\top);
	});
	if( i == 5, {
		StaticText(c, 30@30).string_("Med R").align_(\center).align_(\top);
	});
	if( i == 6, {
		StaticText(c, 30@30).string_("MedA L").align_(\center).align_(\top);
	});
	if( i == 7, {
		StaticText(c, 30@30).string_("MedA R").align_(\center).align_(\top);
	});
	if( i == 8, {
		StaticText(c, 30@30).string_("Main L").align_(\center).align_(\top);
	});
	if( i == 9, {
		StaticText(c, 30@30).string_("Main R").align_(\center).align_(\top);
	});
	if( i == 10, {
		StaticText(c, 30@30).string_("mFar    L").align_(\center).align_(\top);
	});
	if( i == 11, {
		StaticText(c, 30@30).string_("mFar    R").align_(\center).align_(\top);
	});
	if( i == 12, {
		StaticText(c, 30@30).string_("Back L").align_(\center).align_(\top);
	});
	if( i == 13, {
		StaticText(c, 30@30).string_("Back R").align_(\center).align_(\top);
	});
	if( i == 14, {
		StaticText(c, 30@30).string_("Int    L").align_(\center).align_(\top);
	});
	if( i == 15, {
		StaticText(c, 30@30).string_("Int    R").align_(\center).align_(\top);
	});
	if( i == 16, {
		StaticText(c, 30@30).string_("IntB L").align_(\center).align_(\top);
	});
	if( i == 17, {
		StaticText(c, 30@30).string_("IntB R").align_(\center).align_(\top);
	});
	if( i == 18, {
		StaticText(c, 30@30).string_("Far    L").align_(\center).align_(\top);
	});
	if( i == 19, {
		StaticText(c, 30@30).string_("Far    R").align_(\center).align_(\top);
	});
	if( i == 20, {
		StaticText(c, 30@30).string_("FarB L").align_(\center).align_(\top);
	});
	if( i == 21, {
		StaticText(c, 30@30).string_("FarB R").align_(\center).align_(\top);
	});
	if( i == 22, {
		StaticText(c, 30@30).string_("Tw    L").align_(\center).align_(\top);
	});
	if( i == 23, {
		StaticText(c, 30@30).string_("Tw    R").align_(\center).align_(\top);
	});
});



// pulsanti

d = Array.fill(3, {
	arg view;
	view = CompositeView(w, 260@100)
	.background_(Color(0.8, 0.2, 0, 0.5));
	view.decorator_(FlowLayout(view.bounds, 5@5, 5@5));
});

Array.fill(1, {StaticText(d[0], 250@30).string_("Test A: Oscillazione").align_(\center).align_(\top)});
Array.fill(5, {
	arg i;
	Button(d[0], 46@46)
	.states_([[i+1]])
	.mouseDownAction_({
		if ( i == 0, {
		~oscillation.(0.2, 5, 10, 8, 11, 9); // main <-> far
	});
		if ( i == 1, {
		~oscillation.(0.2, 5, 10, 11, 18, 19, 20, 21); // farR <-> farL
	});
		if ( i == 2, {
		~oscillation.(0.2, 5, 14, 18, 15, 19, 16, 20, 17, 21); // far <-> int
	});
		if ( i == 3, {
			~oscillation.(0.5, 10, 14, 16, 17, 15); // int R-intb L <-> int L-intb R (forma ad x)
	});
		if ( i == 4, {
		~oscillation.(0.5, 10, 12, 14, 15, 13); // backL - int R <-> backR - int L
	});
	});

});

Array.fill(1, {StaticText(d[1], 250@30).string_("Test B: Scintillio").align_(\center).align_(\top)});
Array.fill(5, {
	arg i;
	Button(d[1], 46@46)
	.states_([[i+1]])
	.mouseDownAction_({
		if ( i == 0, {
		~scintillement.(1.5, 20, \cub); //lento, curva cubica
	});
		if ( i == 1, {
		~scintillement.(1.5, 20, \lin); //lento, lineare
	});
		if ( i == 2, {
		~scintillement.(2, 20, \cub); //veloce, curva cubica
	});
		if ( i == 3, {
		~scintillement.(2, 20, \exp); //veloce, curva esponenziale
	});
		if ( i == 4, {
		~scintillement.(2, 20, \sin); //veloce, curva sinusoidale
	});
    });

});

Array.fill(1, {StaticText(d[2], 250@30).string_("Test C: Onda").align_(\center).align_(\top)});
Array.fill(5, {
	arg i;
	Button(d[2], 46@46).
		states_([[i+1]])
	.mouseDownAction_({
		if ( i == 0, {
			~vague.(0.2, 1,
				slider1: 12, slider2: 14, slider3: 4,
				slider4: 13, slider5: 15, slider6: 5,
				slider7: 20, slider8: 16, slider9: 8,
				slider10: 21, slider11: 17, slider12: 9
			); //back -> mid -> front
		});
		if ( i == 1, {
			~vague.(0.15, 2,
				slider1: 10, slider2: 8, slider3: 11,
				slider4: 18, slider5: 9, slider6:19
			); //left -> mid -> right
		});
		if ( i == 2, {
			~vague.(0.3, 1,
				slider1: 18, slider2: 14, slider3: 22,
				slider4: 19, slider5: 15, slider6:23,
				slider7: 20, slider8: 16,
				slider10: 21, slider11:17
			); //corona esterna -> corona interna -> tweeter ceiling
		});
		if ( i == 3, {
			~vague.(0.1, 1,
				slider1: 20, slider2: 12, slider3: 16,
				slider4: 21, slider5: 13, slider6:17
			); // far back -> back -> int back
		});
		if ( i == 4, {
			~vague.(0.1, 1,
				slider1: 10, slider2: 8, slider3: 14,
				slider4: 11, slider5: 9, slider6:15
			); // far -> main -> int
		});
	});
});



// player

a = SoundFileView.new(w, 850@60);
f = SoundFile.new;
f.openRead(~buf.path);
a.soundfile = f;
a.read(0, f.numFrames);
a.elasticMode = true;
a.timeCursorOn = true;
a.timeCursorColor = Color.red;
a.drawsWaveForm = true;
a.gridOn = true;
a.gridResolution = 0.2;
b = CompositeView(w, 700@600);
b.decorator_(FlowLayout(b.bounds, 5@5, 5@5));
a.timeCursorEditable = 1;

// FUNZIONI GUI

a.mouseDownAction = {|view, x, y, mod| var pos = x.linlin(0, 850, 0, a.numFrames); ~jump.(1, pos.trunc.asInteger);};
~playerIndex = OSCFunc.new({ |msg| {a.timeCursorPosition = msg[3]}.defer}, '/phase');
~masterFader = OSCFunc.new({ |msg| {~meters[0].value = msg[3].ampdb.linlin(-40, 0, 0, 1)}.defer}, '/master');
~subFader = OSCFunc.new({ |msg| {~meters[1].value = msg[3].ampdb.linlin(-40, 0, 0, 1)}.defer}, '/sub');

~faders = 22.do({
	|i|
	OSCFunc.new({ |msg|
		if(msg[3] == i,
			{{~meters[i+2].value = msg[4].ampdb.linlin(-40, 0, 0, 1)}.defer;
		});
	}, '/levels');
});

//o = OSCFunc.new({|msg| msg.postln}, '/levels');
//~ampltiudes = OSCFunc.new({ |msg| {~meters[1] = msg[3].postln}.defer }, '/levels');
~jump = {
	arg trig, reset;
	Routine({
		~player.set(\trig, trig, \reset, reset);
		0.05.wait;
		~player.set(\trig, 0);
	}).play;
};
//~jump.(1, pos.trunc.asInteger)




w.onClose_({MIDIIn.disconnectAll; s.freeAll});
)
