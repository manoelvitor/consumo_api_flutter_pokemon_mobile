import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'getElemento/getall.dart';
import 'getElemento/getbyelemento.dart';
import 'package:http/http.dart' as http;

class Index extends StatelessWidget {
  const Index({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokedex',
        theme: ThemeData(primarySwatch: Colors.red),
        home: Indice());
  }
}

class Indice extends StatefulWidget {
  const Indice({Key? key}) : super(key: key);

  @override
  _IndiceState createState() => _IndiceState();
}

class _IndiceState extends State<Indice> {
  initState() {
    super.initState();
    _atualizar();
  }

  List data = [];
  var getId;
  Future _atualizar() async {
    var url = Uri.parse('https://api-pokemon-fatec.herokuapp.com/elementos');
    http.Response response =
        await http.get(url, headers: {"Accept": "application/json"});
    setState(() {
      data = json.decode(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            'Lista de Pokemons',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25),
          ),
          actions: [
            RaisedButton(
                child: Text("Todos Pokemons"),color: Colors.red, 
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => MyApp()))),
            Image(
                image: NetworkImage(
                    "https://pokemon-fatec.s3.sa-east-1.amazonaws.com/025.png")),
          ]),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(data[index]['iconeElemento']),
                  backgroundColor: Colors.white,
                ),
                tileColor: Colors.red[50],
                title: Text(data[index]['nomeElemento']),
                subtitle: Text('Listagem de todos os pokemons tipo: ' +
                    data[index]['nomeElemento']),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        PegarElemento(elemento: data[index]['nomeElemento']))));
          }),
    );
  }
}

