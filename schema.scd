"positions loaded!".post;
(

//SUB, TROMBE x2, MEDI x2, MEDIALTI x2, MAIN JBL x2, FAR MAIN x2, Balconata int Front x4 (2 slider), Balconata int Back x2, Balconata ext Front x4 (2 slider), Balconata ext Back x2
~xPositions = [
	//NO VALORI DI SUB E MASTER
	//2COPPIE DI VALORI PER CORONA INTERNA ED ESTERNA
	//2 COPPIE DI VALORI PER I TWEETER?
	// + è destra, - è sinistra

	//COLOR STAGE
	-0.6,
	0.6,
	-0.35,
	0.35,
	-0.1,
	0.1,

	//STAGE
	-0.5,
	0.5,
	//FAR FRONT
	-0.8,
	0.8,


	//BACK FRONT
	-0.25,
	0.25,

	//CORONA INTERNA
	-1,
	1,
	-1,
	1,
	//BACK
	-0.85,
	0.85,

	//CORONA ESTERNA
	-1,
	1,
	-1,
	1,
	//BACK
	-1,
	1,

	//TWEETER CEILING
	-0.5,
	0.5,
	-0.5,
	0.5,

];

~yPositions = [
	//NO VALORI DI SUB E MASTER
	//2COPPIE DI VALORI PER CORONA INTERNA ED ESTERNA
	//2 COPPIE DI VALORI PER I TWEETER?
	// + è davanti, - è dietro

	//COLOR STAGE
	//TROMBE
	1,
	1,
	//MEDI PALCO
	1,
	1,
	//MEDIO ALTI PALCO
	1,
	1,

	//STAGE
	//MAIN JBL
	1,
	1,
	//FAR FRONT
	1,
	1,

	//BACK FRONT
	-1.0,
	-1.0,

	//CORONA INTERNA
	0.5,
	0.5,
	-0.5,
	-0.5,
	//BACK
	-1,
	-1,

	//CORONA ESTERNA
	0.5,
	0.5,
	-0.5,
	-0.5,
	//BACK
	-1,
	-1,

	//TWEETER CEILING
	-0.25,
	0.25,
	0.25,
	-0.25,



];


~distances = [
	//NO VALORI DI SUB E MASTER
	//2COPPIE DI VALORI PER CORONA INTERNA ED ESTERNA
	//2 COPPIE DI VALORI PER I TWEETER?
	//Solo positivi, mai a 0

	//COLOR STAGE
	0.5,
	0.5,
	0.55,
	0.55,
	0.6,
	0.6,

	//STAGE
	0.4,
	0.4,
	//FAR FRONT
	1,
	1,

	//BACK FRONT
	1,
	1,

	//CORONA INTERNA
	0.6,
	0.6,
	0.6,
	0.6,
	//BACK
	0.5,
	0.5,

	//CORONA ESTERNA
	1,
	1,
	1,
	1,
	//BACK
	1,
	1,

	//TWEETER CEILING
	0.5,
	0.5,
	0.5,
	0.5,

];

"positions loaded!".post;
);
28.do({|i| [~xPositions[i], ~yPositions[i], ~distances[i]].postln; "".postln;});



