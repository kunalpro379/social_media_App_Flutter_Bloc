import 'package:flutter/material.dart';

import '../models/Events.dart';

class EventsCard extends StatelessWidget {
  final Event event;

  EventsCard({required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.all(0),
                  child: Image.network(
                    event.thumbnailUrl,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              if (event.isLive)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    color: Colors.red,
                    child: Text(
                      'LIVE',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Container(
            width: 200,
            height: 100,
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(event.venue),
                Text(event.time),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
