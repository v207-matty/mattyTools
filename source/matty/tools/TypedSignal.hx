package matty.tools;

class TypedSignal<T> {
	var signals:Array<T->Void> = [];

	public function new() {}

	public function add(signal:T->Void) {
		if (signal == null || signals == null)
			return;
		if (signals.indexOf(signal) > -1)
			return;

		signals.push(signal);
	}

	public function remove(signal:T->Void) {
		if (signals == null)
			return;
		if (signals.indexOf(signal) == -1)
			return;

		signals.remove(signal);
	}

	public function dispatch(value:T) {
		for (signal in signals)
			signal(value);
	}
}
