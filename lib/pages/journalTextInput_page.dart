import 'package:flutter/material.dart';

class JournalTextInputPage extends StatefulWidget {
  final String? initialText;
  JournalTextInputPage({super.key, this.initialText});

  @override
  State<JournalTextInputPage> createState() => _JournalTextInputPageState();
}

class _JournalTextInputPageState extends State<JournalTextInputPage> {
  // Constants and Variables
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: widget.initialText);
  }

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
                    color: Colors.grey[400],
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: textController,
                      maxLines:
                          null, // Allows for unlimited lines to be showm when typing
                      textAlignVertical: TextAlignVertical(y: -1.0),
                      textCapitalization: TextCapitalization.sentences,
                      autofocus: true,
                      onSubmitted: (value) {
                        saveText();
                      },
                      decoration: InputDecoration(
                        hintText: 'Start typing...',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          fontFamily: "Times New Roman",
                          color: Colors.grey[500],
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

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}
