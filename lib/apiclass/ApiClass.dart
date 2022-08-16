class StoreModel {
  int? id;
  double? price;
  String? title, description, category, image;
  List<dynamic>? rating;

  StoreModel(
      {this.id,
      this.price,
      this.title,
      this.description,
      this.category,
      this.image,
      this.rating});

  StoreModel storeModelFactory(Map map) {
    return StoreModel(
      id: map['id'],
      price: map['price'],
      title: map['title'],
      description: map['description'],
      category: map['category'],
      image: map['image'],
      rating: map['rating'].map((e)=>Rating().ratingFactory(e)).toList(),
    );
  }
}

class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

  Rating ratingFactory(Map map) {
    return Rating(rate: map['rate'], count: map['count']);
  }
}
