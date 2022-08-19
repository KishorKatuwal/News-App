class ProductDataModel{

  String? image;
  String? url;
  String? headlines;
  String? headlines_url;

  ProductDataModel(
      {

        this.image,
        this.url,
        this.headlines,
        this.headlines_url
      });

  ProductDataModel.fromJson(Map<String,dynamic> json)
  {
    image = json['image'];
    url = json['url'];
    headlines = json['headlines'];
    headlines_url = json['headlines_url'];
  }
}