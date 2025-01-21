// TODO: Make the date and day of the week stop scrolling when they hit the top of the screen
// TODO: Make the bullt-list dot icon display at the beginning of the text input, not in the center of the length of the text input
// TODO: Convert reused variables into constants at the top of the file

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jurnapet/pages/journalTextInput_page.dart';

class JournalPage extends StatefulWidget {
  JournalPage({super.key});

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  // Constants and Variables
  static const double _paddingAmmount = 30.0;
  static const EdgeInsets _padding = EdgeInsets.only(left: _paddingAmmount);
  TextEditingController myController = TextEditingController();
  DateTime currentDate = DateTime.now();
  List<String> journalEntries = [];

  // Methods
  void addJournalEntry(String textEntry) {
    // setState so that the widget updates
    setState(() {
      journalEntries.add(textEntry);
    });
    // for (var textEntry in journalEntries) {
    //   print(textEntry);
    // }
  }

  void showDeleteConfirmation(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Delete Entry"),
          content: Text("Are you sure you want to delete this entry?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  journalEntries.removeAt(index);
                });
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Delete"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Format the date
    String formattedDate = DateFormat('MMM dd').format(currentDate);
    String dayOfWeek = DateFormat('EEEE').format(currentDate);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: _padding,
                child: Text(
                  formattedDate,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Times New Roman",
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: _padding,
                child: Text(
                  dayOfWeek,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Times New Roman",
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(
                  left: ((_paddingAmmount / 2) - 5),
                  right: _paddingAmmount,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 8,
                      color: Colors.grey.shade600,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: _paddingAmmount / 2 - 5,
                        top: _paddingAmmount,
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          final newText = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => JournalTextInputPage(),
                            ),
                          );

                          if (newText != null &&
                              newText.toString().isNotEmpty) {
                            addJournalEntry(newText);
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey.shade400,
                              ),
                            ),
                          ),
                          child: Text(
                            'Start typing...',
                            style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              fontFamily: 'Times New Roman',
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ...journalEntries.asMap().entries.map((entry) {
                int index = entry.key;
                String text = entry.value;
                return Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(
                    left: _paddingAmmount / 2 - 5,
                    right: _paddingAmmount,
                    top: 10,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.circle,
                        size: 8,
                        color: Colors.grey.shade600,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: _paddingAmmount / 2 - 5),
                      ),
                      GestureDetector(
                        onLongPress: () {
                          showDeleteConfirmation(index);
                        },
                        onTap: () async {
                          final updatedText = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => JournalTextInputPage(
                                initialText: text, // Pass current text to edit
                              ),
                            ),
                          );

                          if (updatedText != null &&
                              updatedText.toString().isNotEmpty) {
                            setState(() {
                              journalEntries[index] = updatedText;
                            });
                          }
                        },
                        child: Text(
                          text,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}


/* How it is
Scaffold
  body: 
    Column:
      Container: formatedDate
      Container: dayOfWeek
      Container: padding
        Row:
          Icon: circle
          Padding: padding
          Extended:  
            GestureDetector: => JournalTextInputPage()
              Container: 
                Text: 'Start typing...'
*/

/* How i want it
Scaffold
  body: 
    Column: <-- This i want scrollable
      Container: formatedDate
      Container: dayOfWeek
      Container: padding
        Row:
          Icon: circle
          Padding: padding
          Extended:  
            GestureDetector: => JournalTextInputPage()
              Container: 
                Text: 'Start typing...'

*/

