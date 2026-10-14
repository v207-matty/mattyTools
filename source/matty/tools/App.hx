package matty.tools;

import openfl.events.Event;
import openfl.Assets;
import openfl.text.TextFormat;
import openfl.text.TextField;
import openfl.display.Sprite;

class App extends Sprite {
	public static var onUpdate = new TypedSignal<Float>();

	public static var onFullscreen = new TypedSignal<Event>();

	override public function new() {
		super();

		stage.color = 0xFF000000;

		stage.addEventListener(Event.ENTER_FRAME, enterFrame);
		stage.addEventListener(Event.EXIT_FRAME, exitFrame);
		stage.addEventListener(Event.FULLSCREEN, fullscreen);

		var t = new TextField();
		addChild(t);

		t.text = 'Hello World';
		t.setTextFormat(new TextFormat('assets/fonts/unifont.ttf', 16, 0xFFFFFFFF));
	}

	var frameStart:Float = 0;

    public static var elapsed:Float = 0;

	function enterFrame(e:Event) {
		frameStart = Date.now().getTime();
	}

	function exitFrame(e:Event) {
		onUpdate.dispatch(elapsed = Date.now().getTime() - frameStart);
	}

	function fullscreen(e:Event) {
		onFullscreen.dispatch(e);
	}

	static var state:State;

	public static function switchState(newstate:State) {
		if (newstate == null)
			return;

		state.destroy();

		state = newstate;
		state.create();
	}
}
