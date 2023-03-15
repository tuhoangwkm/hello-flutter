import 'package:flutter/material.dart';

class ModalBottom extends StatelessWidget {
  ModalBottom({Key? key, required this.addTask}) : super(key: key);

  // String textValue = ""; use with onChanged
  TextEditingController controller = TextEditingController();

  final Function addTask;

  void _handleOnClick(BuildContext context) {
    final taskName = controller.text;
    if (taskName.isEmpty) {
      return;
    }
    addTask(taskName);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Your Task",
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () => _handleOnClick(context),
                child: const Text("Add Task"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
