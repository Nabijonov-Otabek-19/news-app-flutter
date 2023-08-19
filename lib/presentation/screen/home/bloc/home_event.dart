
abstract class HomeEvent {}

class LoadNewsEvent extends HomeEvent {
  final String country;
  final String category;

  LoadNewsEvent(this.country, this.category);
}
