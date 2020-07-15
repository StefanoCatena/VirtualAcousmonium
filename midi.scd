(
MIDIClient.init;
MIDIIn.connectAll;

MIDIIn.control_({
	|uid, ch, cNum, val|
	//[uid, ch, cNum, val].postln;
	case
	//NANOKONTROL
	{cNum == 0}{{~values[0] = val.linlin(0, 127, 0.0, 1.0); ~updateValues.value; ~sliders[0].value=val.linlin(0, 127, 0.0, 1.0)}.defer}
	{cNum == 1}{{~values[1] = val.linlin(0, 127, 0.0, 1.0); ~updateValues.value; ~sliders[1].value=val.linlin(0, 127, 0.0, 1.0)}.defer}
	{cNum == 2}{{~values[2] = val.linlin(0, 127, 0.0, 1.0); ~updateValues.value; ~sliders[2].value=val.linlin(0, 127, 0.0, 1.0)}.defer}
	{cNum == 3}{{~values[3] = val.linlin(0, 127, 0.0, 1.0); ~updateValues.value; ~sliders[3].value=val.linlin(0, 127, 0.0, 1.0)}.defer}
	{cNum == 4}{{~values[4] = val.linlin(0, 127, 0.0, 1.0); ~updateValues.value; ~sliders[4].value=val.linlin(0, 127, 0.0, 1.0)}.defer}
	{cNum == 5}{{~values[5] = val.linlin(0, 127, 0.0, 1.0); ~updateValues.value; ~sliders[5].value=val.linlin(0, 127, 0.0, 1.0)}.defer}
	{cNum == 6}{{~values[6] = val.linlin(0, 127, 0.0, 1.0); ~updateValues.value; ~sliders[6].value=val.linlin(0, 127, 0.0, 1.0)}.defer}
	{cNum == 7}{{~values[7] = val.linlin(0, 127, 0.0, 1.0); ~updateValues.value; ~sliders[7].value=val.linlin(0, 127, 0.0, 1.0)}.defer}

	//FADERBANK
	{cNum == 32}{{~values[8] = val.linlin(0, 127, 0.0, 1.0); ~updateValues.value; ~sliders[8].value=val.linlin(0, 127, 0.0, 1.0)}.defer}

	{cNum == 33}{{~values[9] = val.linlin(0, 127, 0.0, 1.0); ~updateValues.value; ~sliders[9].value=val.linlin(0, 127, 0.0, 1.0)}.defer}

	{cNum == 34}{{~values[10] = val.linlin(0, 127, 0.0, 1.0); ~updateValues.value; ~sliders[10].value=val.linlin(0, 127, 0.0, 1.0)}.defer}

	{cNum == 35}{{~values[11] = val.linlin(0, 127, 0.0, 1.0); ~updateValues.value; ~sliders[11].value=val.linlin(0, 127, 0.0, 1.0)}.defer}

	{cNum == 36}{{~values[12] = val.linlin(0, 127, 0.0, 1.0); ~updateValues.value; ~sliders[12].value=val.linlin(0, 127, 0.0, 1.0)}.defer}

	{cNum == 37}{{~values[13] = val.linlin(0, 127, 0.0, 1.0); ~updateValues.value; ~sliders[13].value=val.linlin(0, 127, 0.0, 1.0)}.defer}

	{cNum == 38}{{~values[14] = val.linlin(0, 127, 0.0, 1.0); ~updateValues.value; ~sliders[14].value=val.linlin(0, 127, 0.0, 1.0)}.defer}

	{cNum == 39}{{~values[15] = val.linlin(0, 127, 0.0, 1.0); ~updateValues.value; ~sliders[15].value=val.linlin(0, 127, 0.0, 1.0)}.defer}

	{cNum == 40}{{~values[16] = val.linlin(0, 127, 0.0, 1.0); ~updateValues.value; ~sliders[16].value=val.linlin(0, 127, 0.0, 1.0)}.defer}

	{cNum == 41}{{~values[17] = val.linlin(0, 127, 0.0, 1.0); ~updateValues.value; ~sliders[17].value=val.linlin(0, 127, 0.0, 1.0)}.defer}

	{cNum == 42}{{~values[18] = val.linlin(0, 127, 0.0, 1.0); ~updateValues.value; ~sliders[18].value=val.linlin(0, 127, 0.0, 1.0)}.defer}

	{cNum == 43}{{~values[19] = val.linlin(0, 127, 0.0, 1.0); ~updateValues.value; ~sliders[19].value=val.linlin(0, 127, 0.0, 1.0)}.defer}

	{cNum == 44}{{~values[20] = val.linlin(0, 127, 0.0, 1.0); ~updateValues.value; ~sliders[20].value=val.linlin(0, 127, 0.0, 1.0)}.defer}

	{cNum == 45}{{~values[21] = val.linlin(0, 127, 0.0, 1.0); ~updateValues.value; ~sliders[21].value=val.linlin(0, 127, 0.0, 1.0)}.defer}

	{cNum == 46}{{~values[22] = val.linlin(0, 127, 0.0, 1.0); ~updateValues.value; ~sliders[22].value=val.linlin(0, 127, 0.0, 1.0)}.defer}

	{cNum == 47}{{~values[23] = val.linlin(0, 127, 0.0, 1.0); ~updateValues.value; ~sliders[23].value=val.linlin(0, 127, 0.0, 1.0)}.defer}
});
)