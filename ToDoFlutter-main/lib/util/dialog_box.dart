import 'package:flutter/material.dart';

const Color deepPurpleColor = Color(0xFF6F32A8);
const Color brightPurpleColor = Color(0xFFAF7AC5);

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogBox({
    Key? key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // user input
            TextField(
              controller: controller,
              style: const TextStyle(
                color: deepPurpleColor,
              ),
              cursorColor: deepPurpleColor,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10.0),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: deepPurpleColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: deepPurpleColor),
                ),
                hintText: "Add a new task",
                hintStyle: const TextStyle(
                  color: deepPurpleColor,
                ),
              ),
            ),
            // buttons -> save and cancel
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // save button
                  Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [deepPurpleColor, brightPurpleColor],
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        // For checking if input is empty or not
                        if (controller.text.trim().isNotEmpty) {
                          onSave();
                        } else {
                          // if it is empty then show message
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text(
                                  "Warning!",
                                  style: TextStyle(
                                    color: deepPurpleColor,
                                  ),
                                ),
                                content: const Text(
                                  "Please enter your task first!",
                                  style: TextStyle(
                                    color: deepPurpleColor,
                                  ),
                                ),
                                actions: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 15),
                                    padding: const EdgeInsets.only(right: 8, left: 4),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            gradient: const LinearGradient(
                                              colors: [deepPurpleColor, brightPurpleColor],
                                            ),
                                            borderRadius: BorderRadius.circular(8.0),
                                          ),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop(); // Closing dialog
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.transparent,
                                              shadowColor: Colors.transparent,
                                            ),
                                            child: const Text(
                                              "OK",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      child: const Text(
                        "Save",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),

                  // cancel button
                  Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [deepPurpleColor, brightPurpleColor],
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ElevatedButton(
                      onPressed: onCancel,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
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
