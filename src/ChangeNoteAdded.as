package {
	public class ChangeNoteAdded extends Change {
		private var pattern: BarPattern;
		private var tone: Tone;
		private var note: int;
		private var index: int;
		public function ChangeNoteAdded(pattern: BarPattern, tone: Tone, note: int, index: int, deletion: Boolean = false) {
			super(deletion);
			this.pattern = pattern;
			this.tone = tone;
			this.note = note;
			this.index = index;
			didSomething();
			redo();
		}
		
		protected override function doForwards(): void {
			tone.notes.splice(index, 0, note);
			pattern.doc.changed();
		}
		
		protected override function doBackwards(): void {
			tone.notes.splice(index, 1);
			pattern.doc.changed();
		}
	}
}