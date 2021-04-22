import 'package:final_project_e_commerce/model/model.dart';
import 'package:final_project_e_commerce/view/detail_page.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {

  String name;
  List<Product> products;

  SearchPage({this.name, this.products});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  _listProducts(BuildContext context, int index){
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListTile(
        tileColor: Colors.grey[200],
        leading: CircleAvatar(
          backgroundColor: Color(widget.products[index].color),
          backgroundImage: AssetImage(widget.products[index].image),
        ),
        title: Text(widget.products[index].title),
        subtitle: Text('R\$ ${widget.products[index].price}'),
        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(product: widget.products[index],),));}
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    print(widget.products.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.products.length,
              itemBuilder: (context, index) => _listProducts(context, index)
            ),
          )
        ],
      ),
    );
  }
}
