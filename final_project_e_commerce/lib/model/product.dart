class Product {

  int id;
  String image;
  String title;
  String description;
  String price;
  String size;
  int color;

  Product({this.id,
      this.image,
      this.title,
      this.description,
      this.price,
      this.size,
      this.color});

  /// method to fetch products in DB
  Product.fromMap(Map map) {
    id = map['id_column'];
    image = map['image_column'];
    title = map['title_column'];
    description = map['description_column'];
    price = map['price_column'];
    size = map['size_column'];
    color = int.tryParse(map['color_column']);
  }

  /// method to save in DB
  Map toMap() {
    Map<String, dynamic> map = {
      "image_column": image,
      "title_column": title,
      "description_column": description,
      "price_column": price,
      "size_column": size,
      "color_column": color,
    };

    if(id != null){
      map['id_column'] = id;
    }
    return map;
  }

  @override
  String toString() {
    return 'Product\n'
        'Id: $id\n'
        'Imagem: $image\n'
        'Título: $title\n'
        'Descrição: $description\n'
        'Preço: $price\n'
        'Tamanho: $size\n'
        'Cor: $color';
  }
}