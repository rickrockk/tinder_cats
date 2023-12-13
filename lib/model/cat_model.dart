class CatsModel {
  final List<String> imgUrls;

  CatsModel({required this.imgUrls});

  factory CatsModel.fromJson(Map<String, dynamic> json) => CatsModel(
        imgUrls: List.from(
          json['data'],
        ),
      );
}
