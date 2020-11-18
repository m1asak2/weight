import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeightModifyPopUp extends StatelessWidget {
  const WeightModifyPopUp(this.index, this.weight, this.comment,
      this.saveWeight, this.saveComment, this.modifyOnTap);

  final index;
  final weight;
  final comment;
  final saveWeight;
  final saveComment;
  final modifyOnTap;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('今日の体重を入力しよう'),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 24,
      ),
      children: [
        Row(
          children: [
            Container(
              width: 200,
              padding: EdgeInsets.only(left: 4),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '嘘つくなよ',
                  labelText: '今日の体重',
                ),
                initialValue: weight,
                onChanged: (value) {
                  saveWeight(value);
                },
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text('Kg'),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: 200,
          padding: EdgeInsets.only(left: 4),
          child: TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: '後悔先に立たず',
                labelText: '懺悔の一言'),
            initialValue: comment,
            onChanged: (value) {
              saveComment(value);
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
        InkWell(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 40),
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.blue,
              border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '登録',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
          onTap: () {
            modifyOnTap(index);
          },
        ),
      ],
    );
  }
}
