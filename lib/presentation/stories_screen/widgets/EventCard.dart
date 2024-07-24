import 'package:flutter/material.dart';

import '../models/Events.dart';

class EventsCard extends StatelessWidget {
  final Event event;

  EventsCard({required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8), // Increased margin for better spacing
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(8), // Optional: rounded corners
                child: Card(
                  margin: EdgeInsets.all(0),
                  child: Image.network(
                    event.thumbnailUrl,
                    width: 150, // Fixed width for the image
                    height: 200, // Fixed height for the image
                    fit: BoxFit.cover, // Ensure image covers the card area
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
          SizedBox(height: 8), // Spacing between image and text
          Container(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4), // Spacing between text elements
                Text(event.venue),
                SizedBox(height: 4), // Spacing between text elements
                Text(event.time),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
