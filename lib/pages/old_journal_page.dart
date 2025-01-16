import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jurnapet/pages/journalTextInput_page.dart';

class JournalPage extends StatefulWidget {
  JournalPage({super.key});

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  // Constants
  final double paddingAmmount = 30.0;

  // Variables
  TextEditingController myController = TextEditingController();
  DateTime currentDate = DateTime.now();
  //TODO: Implement a way to store journal entries
  List<String> journalEntries = [];

  // Methods
  void addJournalEntry(String textEntry) {
    // setState so that the widget updates
    setState(() {
      journalEntries.add(textEntry);
    });
  }

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
                      onTap: () async {
                        final newText = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => JournalTextInputPage(),
                          ),
                        );

                        // If the text is not null and not empty, add it to the journal
                        if (newText != null && newText.toString().isNotEmpty) {
                          addJournalEntry(newText);
                        }
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
            // Journal Entries
            const SizedBox(height: 20),
            Expanded(
                child: ListView.builder(
              itemCount: journalEntries.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.circle, size: 10, color: Colors.black38),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          journalEntries[index],
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
