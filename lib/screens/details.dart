import 'package:flutter/material.dart';
import 'package:pokedex/widgets/pokemon_item.dart';

import '../models/pokemon.dart';


class DetailPage extends StatelessWidget{
  final PokemonModel model;

  DetailPage({
    @required this.model,
  });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes'),
         leading: IconButton(
           icon: Icon(Icons.arrow_back),
           onPressed: () => Navigator.of(context).pop(),
         ),
      ),
      body: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              Center(
                child: Container(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: NetworkImage(this.model.sprite),
                    ),
                  ),
                )
              )
            ],
          ),
          Row(children: <Widget>[
            Container(
              color: PokemonItem.backgroundColor('grass'),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  (this.model.name).toUpperCase(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: PokemonItem.backgroundColor(this.model.types[0])
                  ),
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Tipos:'
                  ),
                )
              ],
            )
          ],)
          
        ],
      )
    );
  }
}