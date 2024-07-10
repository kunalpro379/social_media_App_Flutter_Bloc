import 'package:equatable/equatable.dart';

abstract class StoriesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class StoriesInitialEvent extends StoriesEvent {}

class FetchStoriesEvent extends StoriesEvent {}

class FetchMorningBuzzEvent extends StoriesEvent {}

class FetchLiveEventsEvent extends StoriesEvent {}
