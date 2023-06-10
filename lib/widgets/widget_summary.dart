import 'package:flutter/material.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({super.key, required this.summary});
  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 400,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: summary
                  .map((e) => Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 8.0, right: 8.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 15,
                                  child: Text(
                                    ((e['question_index'] as int) + 1)
                                        .toString(),
                                    style: TextStyle(
                                        color: (e['selected_answer'] ==
                                                e['correct_answer'])
                                            ? Colors.green
                                            : Colors.red),
                                  ),
                                ),
                              )),
                          Expanded(
                            flex: 9,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e['question'].toString(),
                                  style: const TextStyle(fontSize: 22),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  e['selected_answer'].toString(),
                                  style: const TextStyle(color: Colors.black),
                                ),
                                Text(
                                  'Ans: ${e['correct_answer']}',
                                  style: const TextStyle(
                                      color: Color.fromARGB(80, 0, 0, 0)),
                                ),
                                const SizedBox(
                                  height: 20,
                                )
                              ],
                            ),
                          ),
                        ],
                      ))
                  .toList(),
            ),
          ),
        ),
      );
}
