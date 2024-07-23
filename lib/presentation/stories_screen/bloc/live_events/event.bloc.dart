import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../../models/Events.dart';
import 'event.event.dart';
import 'event.state.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  EventBloc() : super(EventInitial()) {
    on<LoadEvents>(_onLoadEvents);
  }

  Future<void> _onLoadEvents(LoadEvents event, Emitter<EventState> emit) async {
    try {
      final jsonString = await rootBundle.loadString('assets/events.json');
      final List<dynamic> jsonResponse = json.decode(jsonString);
      final events = jsonResponse.map((json) => Event.fromJson(json)).toList();
      emit(EventsLoaded(events: events));
    } catch (e) {
      emit(EventLoadError(message: 'Failed to load events'));
    }
  }
}
