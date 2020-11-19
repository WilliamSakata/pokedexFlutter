import 'package:flutter/material.dart';
import 'package:pokedex/widgets/pokemon_item.dart';

import '../models/pokemon.dart';


class DetailPage extends StatelessWidget{
  final PokemonModel model;

  DetailPage({
    @required this.model,
  });

  Widget buildTypes(String type) => Container(
          padding: const EdgeInsets.symmetric(
            vertical: 2.0,
          ),
          decoration: BoxDecoration(
            color: PokemonItem.backgroundColor(type),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Text(
            '${type}',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: PokemonItem.textColor(type),
            ),
          ),
        );

  @override
  Widget build(BuildContext context){
    final Widget types = this.model.types.length == 1
            ? buildTypes(this.model.types[0])
            : Row(children: <Widget>[
                Expanded(
                  child: buildTypes(this.model.types[0]),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: buildTypes(this.model.types[1]),
                ),
              ]);

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
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 2.0,
                  ),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(

                      (this.model.name).toUpperCase(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: PokemonItem.backgroundColor(this.model.types[0])
                      )
                    )
                  )
                )
              )
            ],
          ),
          Row(children: <Widget>[
            ListTile(
              title: Text('Tipos:'), 
              subtitle: types
            )
            
          ],)
          
        ],
      )
    );
  }
}