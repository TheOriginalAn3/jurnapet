import 'package:flutter/material.dart';

class JournalTextInputPage extends StatefulWidget {
  JournalTextInputPage({super.key});

  @override
  State<JournalTextInputPage> createState() => _JournalTextInputPageState();
}

class _JournalTextInputPageState extends State<JournalTextInputPage> {
  // Constants and Variables
  final TextEditingController textController = TextEditingController();

  void saveText() {
    final text = textController.text.trim();
    if (text.isNotEmpty) {
      Navigator.pop(context, text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Text",
          style: TextStyle(
            fontFamily: "Times New Roman",
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: [
                  Icon(
                    Icons.circle,
                    size: 10,
                    color: Colors.black38,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: textController,
                      maxLines: 1,
                      autofocus: true,
                      onSubmitted: (value) {
                        saveText();
                      },
                      decoration: const InputDecoration(
                        hintText: 'Start typing...',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          fontFamily: "Times New Roman",
                        ),
                        // border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.grey.shade200,
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: saveText,
                  child: const Text.rich(
                    TextSpan(
                      text: 'Save',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                        fontFamily: "Times New Roman",
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    textController.text += '@';
                  },
                  child: const Text.rich(
                    TextSpan(
                      text: '@',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        fontFamily: "Times New Roman",
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    textController.text += '#';
                  },
                  child: const Text.rich(
                    TextSpan(
                      text: '#',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        fontFamily: "Times New Roman",
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      textController.clear();
                    },
                    child: const Icon(Icons.delete)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
