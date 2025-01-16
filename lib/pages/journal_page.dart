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

  @override
  Widget build(BuildContext context) {
    // Format the date
    String formattedDate = DateFormat('MMM dd').format(currentDate);
    String dayOfWeek = DateFormat('EEEE').format(currentDate);

    return Scaffold(
      body: SingleChildScrollView(
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
                    size: 10,
                    color: Colors.grey.shade400,
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

                        if (newText != null && newText.toString().isNotEmpty) {
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
                  left: _paddingAmmount,
                  right: _paddingAmmount,
                  top: 10,
                ),
                child: GestureDetector(
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
                  child: Container(
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Times New Roman',
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ],
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

