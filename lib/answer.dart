import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        //PrimaryColor: Color(0xFF00E676),
        //textColor: Colors.white,
        child: Text(answerText),
        onPressed: () => selectHandler(),
        /*onPressed: Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => selectHandler({value: value}))), */
      ),
    );
  }
}
