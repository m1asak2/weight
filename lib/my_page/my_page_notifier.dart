import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:weight/WIdgets/weight_modify_pop_up.dart';
// import 'package:weight/WIdgets/WeightCard.dart';
import 'package:weight/WIdgets/weight_register_pop_up.dart';

part 'my_page_notifier.freezed.dart';

@freezed
abstract class MyPageState with _$MyPageState {
  const factory MyPageState({
    @Default(0) int count,
    String weight,
    String comment,
    @Default([]) List<Map<String, String>> record,
  }) = _MyPageState;
}

class MyPageNotifier extends StateNotifier<MyPageState> with LocatorMixin {
  MyPageNotifier({
    @required this.context,
  }) : super(const MyPageState());

  final BuildContext context;

  @override
  void dispose() {
    //画面を戻したり、閉じたりしたときに呼び出される
    //廃棄処理
    print('dispose');
    super.dispose();
  }

  @override
  void initState() {
    //初期化時に呼び出される
  }
  void pushButton() {
    print('notifier!!');
    state = state.copyWith(count: state.count + 1);
    //freezedを使うときの、stateを変えるときのお作法？
    print(state.count);
  }

  void popUpForm() {
    showDialog(
      context: context,
      builder: (context) {
        return WeightRegisterPopUp(_saveWeight, _saveComment, _register);
      },
    );
  }

  void modifyPopUpForm(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return WeightModifyPopUp(index, state.weight, state.comment,
            _saveWeight, _saveComment, _modify);
      },
    );
  }

  void _saveWeight(String value) {
    state = state.copyWith(weight: value);
    print(state.weight);
    // print(value);
  }

  void _saveComment(String value) {
    state = state.copyWith(comment: value);
    print(state.comment);
  }

  void _register() {
    final dateTime = DateTime.now();
    final day = '${dateTime.year}年${dateTime.month}月${dateTime.day}日';
    final formRecord = {
      'weight': state.weight,
      'comment': state.comment,
      'day': day,
    };
    print(formRecord);
    final newRecord = List<Map<String, String>>.from(state.record);
    newRecord.add(formRecord);
    state = state.copyWith(record: newRecord);
    print(state.record);
    // 戻る
    Navigator.pop(context);
  }

  void delete(int index) {
    print('delete ${state.record[index]}');
    state.record.removeAt(index);
    final newRecord = List<Map<String, String>>.from(state.record);
    state = state.copyWith(record: newRecord);
  }

  void _modify(int index) {
    print('modify');
    state.record[index]['weight'] = state.weight;
    state.record[index]['comment'] = state.comment;
    Navigator.pop(context);
  }
}
