part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

/// **shows** a list of [TileModel]
class ShowList extends HomeState {
  ShowList({required this.tiles});
  final List<TileModel> tiles;

}