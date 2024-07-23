// import '../../models/Events.dart';

// abstract class EventState {}

// class EventInitial extends EventState {}

// class EventsLoaded extends EventState {
//   final List<Event> events;

//   EventsLoaded({required this.events});
// }

// class EventLoadError extends EventState {
//   final String message;

//   EventLoadError({required this.message});
// }

import 'package:equatable/equatable.dart';

import '../../models/Events.dart';

abstract class EventState extends Equatable {
  const EventState();

  @override
  List<Object> get props => [];
}

class EventInitial extends EventState {}

class EventsLoaded extends EventState {
  final List<Event> events;

  const EventsLoaded({required this.events});

  @override
  List<Object> get props => [events];
}

class EventLoadError extends EventState {
  final String message;

  const EventLoadError({required this.message});

  @override
  List<Object> get props => [message];
}
