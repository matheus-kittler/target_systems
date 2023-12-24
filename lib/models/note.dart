// class Note {
//   String text;

//   Note({required this.text});

//   factory Note.fromJson(Map<String, dynamic> json) => Note(
//         text: json['text'],
//       );

//   Map<String, String> toJson() => {
//         'text': text,
//       };
// }
import 'package:mobx/mobx.dart';

part 'note.g.dart';

class Note = NoteBase with _$Note;

abstract class NoteBase with Store {
  NoteBase({this.title});
  @observable
  String? title;
  @action
  setText(String value) => title = value;

  factory NoteBase.fromJson(Map<String, dynamic> json) => Note(
        title: json['text'],
      );

  @action
  Map<String?, String?> toJson() => {
        'text': title,
      };
}
