import 'dart:io';
import 'package:final_project_e_commerce/db/db.dart';
import 'package:final_project_e_commerce/model/model.dart';
import 'package:flutter/material.dart';
import 'package:final_project_e_commerce/constant.dart';
import 'package:flutter/services.dart';
import 'package:final_project_e_commerce/view/view.dart';

class MenuDrawer extends StatelessWidget {

  ProductHelper helper = ProductHelper();
  List<Product> _products = [];

  _createHeader(BuildContext context) {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Theme.of(context).primaryColor
          ],
          begin: Alignment.centerLeft,
          end: Alignment.bottomRight
        )
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Text(
              'Teste de Usuário - teste@teste.com.br',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Positioned(
            top: 45.0,
            left: 16.0,
            child: Icon(Icons.person, size: 100,),
          )
        ],
      ),
    );
  }

  _createDrawerItem({IconData icon, String text, GestureTapCallback onTap}){
    return ListTile(
      title: Row(
        children: [
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {

    helper.fetchAllProducts().then((list) {
      _products = list;
    });

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _createHeader(context),
          SizedBox(height: 10.0,),
          _createDrawerItem(icon: Icons.home, text: menuHome, onTap: (){
            Navigator.of(context).pop();
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(products: _products,),));
          }),
          _createDrawerItem(icon: Icons.shopping_cart, text: menuCart, onTap: (){
            Navigator.of(context).pop();
            Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
          }),
          Divider(),
          _createDrawerItem(icon: Icons.info, text: menuAbout, onTap: (){
            Navigator.of(context).pop();
            Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage('Sobre Nós')));
          }),
          Divider(),
          SizedBox(height: 20.0,),
          _createDrawerItem(icon: Icons.directions_run, text: menuExit, onTap: (){
            if(Platform.isAndroid){
              SystemNavigator.pop();
            } else if(Platform.isIOS) {
              exit(0);
            }
          }),
        ],
      ),
    );
  }
}
