import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/live_events/event.bloc.dart';
import '../bloc/live_events/event.state.dart';
import '../widgets/EventCard.dart';

class EventList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventBloc, EventState>(
      builder: (context, state) {
        if (state is EventInitial) {
          return Center(child: CircularProgressIndicator());
        } else if (state is EventsLoaded) {
          final events = state.events;
          return SizedBox(
            height: 400, // Adjust the height as needed

            child: ListView.builder(
              scrollDirection:
                  Axis.horizontal, // Set scroll direction to horizontal
              itemCount: events.length,
              itemBuilder: (context, index) {
                final event = events[index];
                return Container(
                  width: 150, // Set a fixed width for each card

                  child: EventsCard(event: event),
                );
              },
            ),
          );
        } else if (state is EventLoadError) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return Center(child: Text('Unexpected state'));
        }
      },
    );
  }
}
