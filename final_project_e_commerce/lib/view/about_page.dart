import 'package:final_project_e_commerce/constant.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {

  String name;

  AboutPage(this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(logo)
                    )
                  ),
                ),
              ),
              Text(
                'Tio W Store',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(height: 20.0,),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Text(history),
              ),
              SizedBox(height: 20.0,),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(names, style: TextStyle(fontWeight: FontWeight.w600),),
              ),
              Center(
                child: Container(
                  width: 300,
                  height: 300,
                  child: FlareActor(
                      world,
                    fit: BoxFit.contain,
                    animation: 'roll',
                  ),
                ),
              ),
              Text(
                'Vamos Dominar O Mundo!',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              SizedBox(height: 20,)
            ],
          ),
        ],
      ),
    );
  }
}
