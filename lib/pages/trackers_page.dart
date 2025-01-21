import 'package:flutter/material.dart';
import 'package:jurnapet/customObjects/customHabbitTrackerBox.dart';

class TrackersPage extends StatefulWidget {
  TrackersPage({super.key});

  @override
  State<TrackersPage> createState() => _TrackersPageState();
}

class _TrackersPageState extends State<TrackersPage> {
  final double trackBoxSize = 20.0;
  late int intNumBoxesTotal = 0;
  final int intNumBoxesPerRow = 15;

  List daysInMonthArray = [
    true,
    true,
    true,
    true,
    true,
    false,
    true,
    true,
    true,
    true,
    false,
    true,
    true,
    true,
    true,
    false,
    true,
    true,
    true,
    true,
    false,
    true,
    true,
    true,
    true,
    false,
    true,
    true,
    true,
    true,
    false,
    true
  ];
  int currentArrayIndex = -1;
  int getCurrentArrayIndex() {
    if (currentArrayIndex <= daysInMonthArray.length) {
      currentArrayIndex++;
      return currentArrayIndex;
    } else {
      return 0;
    }
  }

  List<Widget> _buildTrackerContainers() {
    List<Map<String, String>> trackers = [
      {"title": "Tracker 1", "description": "Description 1"},
      {"title": "Tracker 2", "description": "Description 2"},
    ];

    DateTime now = DateTime.now();
    int daysInMonth = DateTime(now.year, now.month + 1, 0).day;
    int boxesDrawn = 0;

    int calculateColumnsPerRow(int rowIndex) {
      if (rowIndex < 0) {
        throw Exception(
            "Row must be greater than 0. Got $rowIndex. Please check if the index is passed and not the count.");
      }

      switch (rowIndex) {
        case 0:
          boxesDrawn += intNumBoxesPerRow;
          return intNumBoxesPerRow;
        case 1:
          boxesDrawn += intNumBoxesPerRow;
          return intNumBoxesPerRow;
        case 2:
          int boxesDrawnLocal = boxesDrawn;
          boxesDrawn = 0; // reset boxesDrawn
          return daysInMonth - boxesDrawnLocal;
        default:
          throw Exception(
              "Row must be less than or equal to 2. Got $rowIndex. Please check if the index is passed and not the count.");
      }
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
            Column(
              children: List.generate(
                3,
                (index) {
                  return Row(
                    children: List.generate(
                      calculateColumnsPerRow(index),
                      (index) {
                        intNumBoxesTotal++;
                        return Container(
                          width: trackBoxSize,
                          height: trackBoxSize,
                          margin: const EdgeInsets.only(right: 3, bottom: 3),
                          decoration: CustomHabbitTrackerBox(
                            // color: Colors.grey.shade300,
                            isCompleted:
                                daysInMonthArray[getCurrentArrayIndex()],
                            borderRadius: BorderRadius.circular(5),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
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
