import 'package:final_project_e_commerce/components/body.dart';
import 'package:final_project_e_commerce/components/components.dart';
import 'package:final_project_e_commerce/db/db.dart';
import 'package:final_project_e_commerce/model/model.dart';
import 'package:flutter/material.dart';
import '../constant.dart';
import 'view.dart';
import 'package:final_project_e_commerce/menu/menu.dart';

class HomePage extends StatefulWidget {

  List<Product> products;

  HomePage({this.products});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ProductHelper helper = ProductHelper();
  TextEditingController _searchController = TextEditingController();

  ///usar bloc e tirar a lógica daqui
  _rowIconButton(Icon icon, Function press) {
    return IconButton(
        icon: icon, color: kTextColor,
        onPressed: press);
  }

  _search(){
    if(_searchController.text == ''){
      Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage(name: 'Resultado da Pesquisa', products: widget.products),));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage(name: 'Resultado da Pesquisa', products: []),));
    }
  }

  @override
  void initState() {
    helper.fetchAllProducts().then((list){
      setState(() {
        widget.products = list;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: kTextColor),
        title: Container(
          height: 40,
          child: TextField(
            onSubmitted: (text) {
              _search();
              _searchController.clear();
            },
            keyboardType: TextInputType.text,
            controller: _searchController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Pesquisar',
            ),
          ),
        ),
        actions: [
          _rowIconButton(
              Icon(Icons.search),
                  (){
                _search();
              }
          ),
          _rowIconButton(
              Icon(Icons.shopping_cart),
                  (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage(),));
              }
          ),
          SizedBox(width: kDefaultPadding / 2,)
        ],
      ),
      drawer: MenuDrawer(),
      body: Body(products: widget.products,),
    );
  }
}
