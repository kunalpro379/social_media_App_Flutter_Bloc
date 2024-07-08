import 'package:equatable/equatable.dart';
class StoriesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}
class StoriesInitialEvent extends StoriesEvent {
  List<Object?>get props => [];
}
class FetchStoriesEvent extends StoriesEvent {}
class FetchMorningBuzzEvent extends StoriesEvent {}
class FetchLiveEventsEvent extends StoriesEvent {}