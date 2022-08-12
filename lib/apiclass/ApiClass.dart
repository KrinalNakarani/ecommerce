class StoreModel {
  dynamic? id;
  dynamic? price;
  dynamic? title, description, category, image;
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
      rating:map['rating'].map((e)=>rating().ratingFactory(e)).toList(),
    );
  }
}

class rating {
  dynamic? rate;
  dynamic? count;

  rating({this.rate, this.count});

  rating ratingFactory(Map map) {
    return rating(rate: map['rate'], count: map['count']);
  }
}
