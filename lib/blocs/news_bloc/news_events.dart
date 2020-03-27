// load
// delete <== position

class NewsEvents {}

class LoadEvent extends NewsEvents {}

class DeleteEvent extends NewsEvents {
  final int position;
  DeleteEvent(this.position);
}
