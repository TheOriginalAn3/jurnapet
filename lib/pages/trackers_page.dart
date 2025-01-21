import 'package:flutter/material.dart';

class TrackersPage extends StatefulWidget {
  TrackersPage({super.key});

  @override
  State<TrackersPage> createState() => _TrackersPageState();
}

class _TrackersPageState extends State<TrackersPage> {
  final double trackBoxSize = 20.0;
  late int intNumBoxesTotal = 0;

  List<Widget> _buildTrackerContainers() {
    List<Map<String, String>> trackers = [
      {"title": "Tracker 1", "description": "Description 1"},
      {"title": "Tracker 2", "description": "Description 2"},
    ];

    DateTime now = DateTime.now();
    int daysInMonth = DateTime(now.year, now.month + 1, 0).day;

    int calculateMaxBoxesToDisplayHorizontally() {
      throw UnimplementedError(
          'calculateMaxBoxesToDisplayHorizontally not implemented');
    }

    int calculateMaxBoxRowsToDisplay() {
      throw UnimplementedError('calculateMaxBoxRowsToDisplay not implemented');
    }

    return trackers.map((tracker) {
      // get the number of boxes to display
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        // Give each tracker a title
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tracker["title"]!,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            // TODO: Implement the tracker boxes
          ],
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          child: Text(
            "Track your progress",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ..._buildTrackerContainers(),
        Text(intNumBoxesTotal.toString()),
      ],
    );
  }
}
