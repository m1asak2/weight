import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeightCard extends StatelessWidget {
  const WeightCard(this.record, this.index, this.modifyForm, this.deleteOnTap);

  final record;
  final index;
  final modifyForm;
  final deleteOnTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(10, 10),
          ),
        ],
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Container(
            padding: const EdgeInsets.only(left: 12),
            width: 100,
            child: Text(
              '${record[index]['weight']}Kg',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          Expanded(
            // スペースいっぱいにウィジェットを伸張する
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 24,
                        child: Icon(Icons.calendar_today),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        record[index]['day'],
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Column(
                        children: [
                          InkWell(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 40),
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                border: Border.all(color: Colors.greenAccent),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                '編集',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            onTap: () {
                              modifyForm(index);
                            },
                          ),
                          InkWell(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 40),
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                border: Border.all(color: Colors.redAccent),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                '削除',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            onTap: () {
                              deleteOnTap(index);
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 24,
                      child: Icon(Icons.comment),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      record[index]['comment'],
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
