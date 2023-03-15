import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

class CardBody extends StatelessWidget {
  CardBody(
      {Key? key,
      required this.index,
      required this.item,
      required this.deleteTask})
      : super(key: key);

  var item;
  var index;
  final Function deleteTask;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 74,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color:
            (index % 2 > 0) ? const Color(0xffbdbdbd) : const Color(0xffdfdfdf),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.name,
              style: const TextStyle(
                  color: Color(0xff4B4B4B), fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: () async {
                if (await confirm(context)) {
                  deleteTask(item.id);
                }
                return;
              },
              child: const Icon(
                Icons.delete_outlined,
                color: Color(0xff4B4B4B),
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
