package matty.tools;

import openfl.events.Event;
import openfl.Assets;
import openfl.text.TextFormat;
import openfl.text.TextField;
import openfl.display.Sprite;

class App extends Sprite {
	public static var onUpdate = new TypedSignal<Event>();

	public static var onFullscreen = new TypedSignal<Event>();

	override public function new() {
		super();

		stage.color = 0xFF000000;

		stage.addEventListener(Event.ENTER_FRAME, update);
		stage.addEventListener(Event.FULLSCREEN, fullscreen);

		var t = new TextField();
		addChild(t);

		t.text = 'Hello World';
		t.setTextFormat(new TextFormat('assets/fonts/unifont.ttf', 16, 0xFFFFFFFF));
	}

	function update(e:Event) {
		onUpdate.dispatch(e);
	}

	function fullscreen(e:Event) {
		onFullscreen.dispatch(e);
	}
}
