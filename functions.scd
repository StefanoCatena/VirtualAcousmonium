// ---------------------      DISSOLVENZA INCROCIATA       ------------------------------
//Alternanza veloce e regolare tra due altoparlanti o due gruppi di altoparlanti, alternanza dinamica o spettrale. L'effetto "vibrazione" dato dalla regolarità molto rapida è possibile solo
//su una console automatizzata. Un LFO potrebbe essere usato come comando.
//Funzione musicale: equivalente spaziale del trillo, agitazione preparando per un'esplosione, uno scoppio o
//al contrario, provocando un reflusso, un'aspettativa.



~oscillation = {
	arg freq, times, slider1, slider2, slider3, slider4, slider5, slider6, slider7, slider8;
	var nPoints = 128;
	var env1 = Env([0.0, 1.0, 0.0], [1, 1], \sin).asSignal(nPoints).asArray;
	var env2 = Env([1.0, 0.0, 1.0], [1, 1], \sin).asSignal(nPoints).asArray;
	var routine1, routine2;
	routine1 = Routine({
		times.do({
			env1.do({
				|j|
				{
					if( slider1.notNil, {~values[slider1.clip(0, 23)] = j; ~sliders[slider1.clip(0, 23)].value=j; ~updateValues.value});
					if( slider3.notNil, {~values[slider3.clip(0, 23)] = j; ~sliders[slider3.clip(0, 23)].value=j; ~updateValues.value});
					if( slider5.notNil, {~values[slider5.clip(0, 23)] = j; ~sliders[slider5.clip(0, 23)].value=j; ~updateValues.value});
					if( slider7.notNil, {~values[slider7.clip(0, 23)] = j; ~sliders[slider7.clip(0, 23)].value=j; ~updateValues.value});
				}.defer;
				((1/freq.clip(0.0, 10))/nPoints).wait;
			});
		});
	});
	routine2 = Routine({
		times.do({
			env2.do({
				|j|
				{
					if( slider2.notNil, {~values[slider2.clip(0, 23)] = j; ~sliders[slider2.clip(0, 23)].value=j; ~updateValues.value});
					if( slider4.notNil, {~values[slider4.clip(0, 23)] = j; ~sliders[slider4.clip(0, 23)].value=j; ~updateValues.value});
					if( slider6.notNil, {~values[slider6.clip(0, 23)] = j; ~sliders[slider6.clip(0, 23)].value=j; ~updateValues.value});
					if( slider8.notNil, {~values[slider8.clip(0, 23)] = j; ~sliders[slider8.clip(0, 23)].value=j; ~updateValues.value});
				}.defer;
				((1/freq.clip(0.0, 10))/nPoints).wait;
			});
		});
	});
	routine1.play;routine2.play;
};

//freq, times, slider1, slider2, slider3, slider4, slider5, slider6, slider7, slider8
/*
~oscillation.(0.2, 5, 10, 12, 11, 13); // back <-> far
~oscillation.(0.2, 5, 10, 11, 18, 19, 20, 21); // farR <-> farL
~oscillation.(0.2, 5, 14, 18, 15, 19, 16, 20, 17, 21); // far <-> int
~oscillation.(3, 20, 22, 23); // tweeterR <-> tweeterL (fast)
~oscillation.(3, 20, 22, 2, 23, 3); // tweeter <-> trumpet (fast)
*/



//---------------------------------------------------------------------------








// ---------------------      SFARFALLIO       ------------------------------
//Operazioni di accentuazione (e ritorno) rapide in cascata in una data massa. Riproduzione casuale. Gioco di ampiezza nel quadro di acusmonium, gioco di spettro (mediante filtro) nell'ambito di Cybernéphone IMEB (1973, Christian Clozier). Per garantire la continuità, tieni le tracce aperte e fisse.
//Funzione musicale: equivalente spaziale del tremolo, per dare vita “dall'interno” a una massa spessa e liscia scavando al suo interno o accentuando lievi frammenti dinamici o spettrali. Evidenzia un momento di scrittura tramite micro-montaggio o pointillist (granulare).



~scintillement = {
	arg freq, times, curve;
	var nPoints = 128;
	var env = Env([0.01, 1.0, 0.01], [1, 1], curve).asSignal(128).asArray;
	var routine;
	routine = Routine({
		times.do({
			var rand = rrand(11, 23);
			env.do({
				|j|
				{
					~values[rand] = (j+0.1).clip(0.1, 1.0);
					~sliders[rand].value=(j+0.1).clip(0.1, 1.0);
					~updateValues.value;
				}.defer;
				((1/freq.clip(0.0, 10))/nPoints).wait;
			});
		});
	});
	routine.play;

};

//             freq, times, curve;
/*
~scintillement.(1.5, 20, \cub);
~scintillement.(1.5, 20, \lin);
~scintillement.(3, 20, \cub);
~scintillement.(3, 20, \exp);
~scintillement.(3, 20, \sin);
*/

/*
v = Env([0.01, 1.0, 0.01], [1, 1], \wel).asSignal(128).asArray
v.plot
*/


//---------------------------------------------------------------------------








// ---------------------      ONDA       ------------------------------

//Andata e ritorno che attraversa, per dissolvenze incrociate o successivi smascheramenti, una serie di altoparlanti in linea, ad esempio dal palco posteriore verso il palco anteriore, tutti i lati, la stanza sul retro e il retro.
//Funzione musicale: effetto di massa mobile e unidirezionalità prevedibile. Questo movimento ha il vantaggio di unirsi ad un archetipo agogico noto.


~vague = {
	arg freq, times, slider1, slider2, slider3, slider4, slider5, slider6, slider7, slider8, slider9, slider10, slider11, slider12;
	var nPoints = 128;
	var env1 = Env([0.0, 1.0, 0.0], [1, 1], \sin).asSignal(nPoints).asArray;
	var env2 = Env([0.0, 1.0, 0.0], [1, 1], \sin).asSignal(nPoints).asArray;
	var env3 = Env([0.0, 1.0, 0.0], [1, 1], \sin).asSignal(nPoints).asArray;
	var routine1, routine2, routine3;
	routine1 = Routine({
		times.do({
			env1.do({
				|j|
				{
					if( slider1.notNil, {~values[slider1.clip(0, 23)] = j; ~sliders[slider1.clip(0, 23)].value=j; ~updateValues.value});
					if( slider4.notNil, {~values[slider4.clip(0, 23)] = j; ~sliders[slider4.clip(0, 23)].value=j; ~updateValues.value});
					if( slider7.notNil, {~values[slider7.clip(0, 23)] = j; ~sliders[slider7.clip(0, 23)].value=j; ~updateValues.value});
					if( slider10.notNil, {~values[slider10.clip(0, 23)] = j; ~sliders[slider10.clip(0, 23)].value=j; ~updateValues.value});
				}.defer;
				((1/freq.clip(0.0, 10))/nPoints).wait;
			});
			((1/freq.clip(0.0, 10))*2/3).wait;
		});
	}).play;
	routine2 = Routine({
		((1/freq.clip(0.0, 10))*1/3).wait;
		times.do({
			env2.do({
				|j|
				{
					if( slider2.notNil, {~values[slider2.clip(0, 23)] = j; ~sliders[slider2.clip(0, 23)].value=j; ~updateValues.value});
					if( slider5.notNil, {~values[slider5.clip(0, 23)] = j; ~sliders[slider5.clip(0, 23)].value=j; ~updateValues.value});
					if( slider8.notNil, {~values[slider8.clip(0, 23)] = j; ~sliders[slider8.clip(0, 23)].value=j; ~updateValues.value});
					if( slider11.notNil, {~values[slider11.clip(0, 23)] = j; ~sliders[slider11.clip(0, 23)].value=j; ~updateValues.value});
				}.defer;
				((1/freq.clip(0.0, 10))/nPoints).wait;
			});
			((1/freq.clip(0.0, 10))*2/3).wait;
		});
	}).play;
	routine3 = Routine({
		((1/freq.clip(0.0, 10))*2/3).wait;
		times.do({
			env3.do({
				|j|
				{
					if( slider3.notNil, {~values[slider3.clip(0, 23)] = j; ~sliders[slider3.clip(0, 23)].value=j; ~updateValues.value});
					if( slider6.notNil, {~values[slider6.clip(0, 23)] = j; ~sliders[slider6.clip(0, 23)].value=j; ~updateValues.value});
					if( slider9.notNil, {~values[slider9.clip(0, 23)] = j; ~sliders[slider9.clip(0, 23)].value=j; ~updateValues.value});
					if( slider12.notNil, {~values[slider12.clip(0, 23)] = j; ~sliders[slider12.clip(0, 23)].value=j; ~updateValues.value});
				}.defer;
				((1/freq.clip(0.0, 10))/nPoints).wait;
			});
			((1/freq.clip(0.0, 10))*2/3).wait;
		});
	}).play;
};


/*
freq, times
slider1, slider4, slider7, slider10 -> zona di partenza
slider2, slider5, slider8, slider11 -> zona mediana
slider3, slider6, slider9, slider12 -> zona di arrivo
*/
//    freq  times  sliders
/*
(
~vague.(0.2, 1,
	slider1: 12, slider2: 14, slider3: 4,
	slider4: 13, slider5: 15, slider6: 5,
	slider7: 20, slider8: 16, slider9: 8,
	slider10: 21, slider11: 17, slider12: 9
); //back -> mid -> front
)

(
~vague.(0.15, 2,
	slider1: 10, slider2: 8, slider3: 11,
	slider4: 18, slider5: 9, slider6:19
); //left -> mid -> right
) //questo è fiquo
*/


//---------------------------------------------------------------------------






/*
(
~vague = {
	arg freq, times, start, end, dir;
	var nPoints = 128, temp;
	var env = Env([0.01, 1.0, 0.01], [1, 1], \sin).asSignal(128).asArray;
	var routines;
	if(dir >= 0,
		{start = start.clip(0, 23); end = end.clip(0, 23);},
		{temp = end.clip(0, 23); end = start.clip(0, 23); start = temp.clip(0, 23);}
	);
	m = (start-end).abs;
	routines = Array.newClear(m);
	m.do({
		|i|
		i.postln;
		routines[i] = Routine({
			env.do({
				|j|
				{
				~values[i] = j;
				~sliders[i].value= j;
				~updateValues.value;
				}.defer;
				((1/freq.clip(0.0, 10))/nPoints).wait;
			});
		});
	});
	m.do({
		|item|
		r =Routine({
			routines[item].play;
			(freq/m).wait;
		}).play;
	});
};
)
~vague.(1, 1, 19, 2, 1)
*/