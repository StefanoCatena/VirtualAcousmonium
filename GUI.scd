(
var window, height = 800, width = 800;
(thisProcess.nowExecutingPath.dirname ++"/schema.scd").load;
window = Window("GUI", Rect(50, 50, height, width));
window.front.background_(Color.black)
.drawFunc_({
	Pen.fillColor_(Color.blue) ;
	Pen.fillOval(Rect((width/2)-5, (height/2)-5, 10, 10));
	~xPositions.do({
		|item, i|
		var point = Point(~xPositions[i], ~yPositions[i]);
		Pen.fillColor_(Color.red) ;
		Pen.fillRect(
			Rect((point.rotate(pi).x*(~distances[i]*width/2.8))+(width/2)-5,
				(point.rotate(pi).y*(~distances[i]*height/2.8))+(height/2)-5,
				8, 8)
		);
		point.postln ;
	});
})
)
translate
AmbiPlot
2pi