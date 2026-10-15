package matty.tools.states;

import openfl.text.TextFormat;
import openfl.text.TextField;

class TestState extends State {
	override function create() {
		super.create();

		var t = new Text();
		addChild(t);

		t.text = 'Hello';

		t.setTextFormat(new TextFormat('assets/fonts/unifont.ttf', 16, 0xFFFFFFFF));

		t.background = true;
		t.backgroundColor = 0xFFFF0000;

		t.text = 'Hellooooooooooo abababababa';
		t.refresh();
	}
}
