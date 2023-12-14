class Cat {
  final String uri;

  Cat({required this.uri});

  factory Cat.fromJson(Map<String, dynamic> json) => Cat(
    uri: json['uri'],
  );

  Map<String, dynamic> toJson() => {
    'uri': uri,
  };
}
