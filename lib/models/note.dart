class Note {
  String text;

  Note({required this.text});

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        text: json['text'],
      );

  Map<String, String> toJson() => {
        'text': text,
      };
}
