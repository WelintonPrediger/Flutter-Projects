import 'package:final_project_e_commerce/components/item_card.dart';
import 'package:final_project_e_commerce/constant.dart';
import 'package:final_project_e_commerce/model/model.dart';
import 'package:final_project_e_commerce/view/detail_page.dart';
import 'package:flutter/material.dart';
import 'components.dart';

class Body extends StatefulWidget {

  List<Product> products;

  Body({Key key, this.products}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  ///array vai receber a lista de produtos que vier do banco
  // List<Product> _products = [
  //   Product(id: 0, image: cupImage1, title: 'Caneca1', description: 'Descrição do Produto', price: '29', size: '325', color: 0xFF2196F3),
  //   Product(id: 1, image: cupImage2, title: 'Caneca2', description: 'Descrição do Produto', price: '29', size: '325', color: 0xFF4CAF50),
  //   Product(id: 2, image: cupImage3, title: 'Caneca3', description: 'Descrição do Produto', price: '29', size: '325', color: 0xFFFFEB3B),
  //   Product(id: 3, image: cupImage4, title: 'Caneca4', description: 'Descrição do Produto', price: '29', size: '325', color: 0xFFF44336),
  // ];
  //
  // List<Product> _products2 = [
  //   Product(id: 4, image: tShirt1Image, title: 'Camiseta1', description: 'Descrição do Produto', price: '59', size: '56', color: 0xFF2196F3),
  //   Product(id: 5, image: tShirt2Image, title: 'Camiseta2', description: 'Descrição do Produto', price: '59', size: '56', color: 0xFF4CAF50),
  //   Product(id: 6, image: tShirt3Image, title: 'Camiseta3', description: 'Descrição do Produto', price: '59', size: '56', color: 0xFFFFEB3B),
  //   Product(id: 7, image: tShirt4Image, title: 'Camiseta4', description: 'Descrição do Produto', price: '59', size: '56', color: 0xFFF44336),
  // ];
  //
  // List<Product> _products3 = [
  //   Product(id: 8, image: pants1Image, title: 'Calça1', description: 'Descrição do Produto', price: '99', size: '44', color: 0xFF2196F3),
  //   Product(id: 9, image: pants2Image, title: 'Calça2', description: 'Descrição do Produto', price: '99', size: '44', color: 0xFF4CAF50),
  //   Product(id: 10, image: pants3Image, title: 'Calça3', description: 'Descrição do Produto', price: '99', size: '44', color: 0xFFFFEB3B),
  //   Product(id: 11, image: pants4Image, title: 'Calça4', description: 'Descrição do Produto', price: '99', size: '44', color: 0xFFF44336),
  // ];
  //
  // List<Product> _products4 = [
  //   Product(id: 12, image: short1Image, title: 'Bermuda1', description: 'Descrição do Produto', price: '99', size: '44', color: 0xFF2196F3),
  //   Product(id: 13, image: short2Image, title: 'Bermuda2', description: 'Descrição do Produto', price: '99', size: '44', color: 0xFF4CAF50),
  //   Product(id: 14, image: short3Image, title: 'Bermuda3', description: 'Descrição do Produto', price: '99', size: '44', color: 0xFFFFEB3B),
  //   Product(id: 15, image: short4Image, title: 'Bermuda4', description: 'Descrição do Produto', price: '99', size: '44', color: 0xFFF44336),
  // ];

  List<String> categories = ['Canecas', 'Camisetas', 'Calças', 'Bermudas'];
  int selectedIndex = 0;

  _categories(int index){
    return GestureDetector(
      onTap: (){
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categories[index],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: selectedIndex == index ? kTextColor : kTextLightColor
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: kDefaultPadding / 4),
              height: 2,
              width: 30,
              color: selectedIndex == index ? Colors.black : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Text(
                'Tio W Store',
              style: Theme.of(context)
                  .textTheme.headline5
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
            child: SizedBox(
              height: 25,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) => _categories(index),
              ),
            ),
          ),
          _rowItemCard(selectedIndex)
        ],
      )
    );
  }

  _rowItemCard(int categories) {
    print(widget.products.length);
    List<Product> list = [];

    // testando a categoria selecionada
    if(categories == 0){
      for(int i = 0; i < 4; i++){
        list.add(widget.products[i]);
      }
    } else if(categories == 1) {
      for(int i = 4; i < 8; i++){
        list.add(widget.products[i]);
      }
    } else if(categories == 2) {
      for(int i = 8; i < 12; i++){
        list.add(widget.products[i]);
      }
    } else if(categories == 3) {
      for(int i = 12; i < 16; i++){
        list.add(widget.products[i]);
      }
    }

    return Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: GridView.builder(
                itemCount: list.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: kDefaultPadding,
                  crossAxisSpacing: kDefaultPadding,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => ItemCard(
                  product: list[index],
                  /// implementar a navegação com o BloC
                  press: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(product: list[index],),)),),
              ),
            )
        );
  }
}