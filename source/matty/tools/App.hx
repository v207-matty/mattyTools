package matty.tools;

import matty.tools.states.TestState;
import openfl.events.Event;
import openfl.display.Sprite;

class App extends Sprite {
	public static var instance:App;

	public static var onUpdate = new TypedSignal<Float>();

	public static var onFullscreen = new TypedSignal<Event>();

	override public function new() {
		super();

		stage.color = 0xFF000000;

		stage.addEventListener(Event.ENTER_FRAME, enterFrame);
		stage.addEventListener(Event.EXIT_FRAME, exitFrame);
		stage.addEventListener(Event.FULLSCREEN, fullscreen);

		instance = this;

		switchState(new TestState());
	}

	var frameStart:Float = 0;

	public static var elapsed:Float = 0;

	function enterFrame(e:Event) {
		frameStart = Date.now().getTime();
	}

	function exitFrame(e:Event) {
		onUpdate.dispatch(elapsed = Date.now().getTime() - frameStart);

		if (state != null)
			state.update(elapsed);
	}

	function fullscreen(e:Event) {
		onFullscreen.dispatch(e);
	}

	static var state:State;

	public static function switchState(newstate:State) {
		if (newstate == null)
			return;

		if (state != null) {
			instance.removeChild(state);
			state.destroy();
		}

		state = newstate;
		state.create();
		instance.addChild(state);
	}
}
