import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jurnapet/pages/journalTextInput_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Constants
  final double paddingAmmount = 30.0;

  // Variables
  TextEditingController myController = TextEditingController();
  DateTime currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    // Format the date
    String formattedDate = DateFormat('MMM dd').format(currentDate);
    String dayOfWeek = DateFormat('EEEE').format(currentDate);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date display
            Padding(
              padding: EdgeInsets.only(left: paddingAmmount),
              child: Text(
                formattedDate,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Times New Roman",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: paddingAmmount),
              child: Text(
                dayOfWeek,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Times New Roman",
                ),
              ),
            ),
            // Text Input
            Padding(
              padding: EdgeInsets.only(
                  left: (paddingAmmount / 2), right: (paddingAmmount / 2)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.circle,
                    size: 10,
                    color: Colors.black38,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => JournalTextInputPage(),
                          ),
                        );
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: paddingAmmount / 2),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.grey.shade400),
                          ),
                        ),
                        child: Text(
                          'Start typing...',
                          style: TextStyle(
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                            fontFamily: "Times New Roman",
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                    ),

                    // child: TextField(
                    //   controller: myController,
                    //   decoration: InputDecoration(
                    //     hintText: 'Start typing...',
                    //     hintStyle: TextStyle(
                    //       fontSize: 14,
                    //       fontStyle: FontStyle.italic,
                    //       fontFamily: "Times New Roman",
                    //     ),
                    //     border: InputBorder.none,
                    //   ),
                    // ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
