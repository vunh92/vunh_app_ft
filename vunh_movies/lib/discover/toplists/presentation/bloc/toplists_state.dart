import 'package:equatable/equatable.dart';
import 'package:vunh_movies/discover/toplists/domain/toplists.dart';

abstract class TopListsState extends Equatable {
  // final List<TopLists> topListsList;

  // TopListsState({this.topListsList});

  @override
  List<Object> get props => [];
}

// class EmptyState extends TopListsState {}

class LoadingState extends TopListsState {
  // LoadingState({List<TopLists> topListsList}) : super(topListsList: topListsList);
}

class LoadedState extends TopListsState {

  final List<TopLists> topListsList;

  LoadedState(this.topListsList);

  @override
  List<Object> get props => [];
}

class ErrorState extends TopListsState {}