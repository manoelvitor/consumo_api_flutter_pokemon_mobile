import 'dart:convert';
//import 'dart:convert' show utf8;

import 'package:consumo_api/home.dart';
import 'package:flutter/material.dart';
//import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class PegarElemento extends StatefulWidget {
  final String elemento;

  const PegarElemento({Key? key, required this.elemento}) : super(key: key);

  @override
  _PegarElementoState createState() => _PegarElementoState();
}

class _PegarElementoState extends State<PegarElemento> {
  List data = [];
  var getId;
  metodo() {
    return widget.elemento;
  }

  Future _atualizar() async {
    var url = Uri.parse(
        "https://api-pokemon-fatec.herokuapp.com/pokemons/elemento/" +
            widget.elemento);
    http.Response response =
        await http.get(url, headers: {"Accept": "application/json"});

    setState(() {
      data = json.decode(response.body);
    });
  }

  initState() {
    super.initState();
    _atualizar();
  }

  Future showAlertDialog(BuildContext context, id) async {
    var url1 =
        Uri.parse("https://api-pokemon-fatec.herokuapp.com/pokemons/$id");
    http.Response response =
        await http.get(url1, headers: {"Accept": "application/json"});
    setState(() {
      getId = json.decode(response.body);
    });

    Widget okButton = FlatButton(
        child: Text("Voltar a lista"),
        onPressed: () => Navigator.of(this.context).pop(true));

    var alertDialog = AlertDialog(
      title: Text(
        getId['nome'],
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.red, fontSize: 25, fontFamily: 'RobotoMono'),
      ),
      content: Container(
          child: Column(
        children: [
          Image(
            image: NetworkImage(getId['imagem']),
            height: 150,
          ),
          ListTile(
            tileColor: Colors.indigo[50],
            leading: CircleAvatar(
              backgroundImage: NetworkImage(getId['elemento']['iconeElemento']),
              backgroundColor: Colors.white,
            ),
            title: Text("Elemento:"),
            subtitle: Text(
              getId['elemento']['nomeElemento'],
            ),
          ),
          ListTile(
            tileColor: Colors.indigo[50],
            leading: CircleAvatar(
              backgroundImage:
                  NetworkImage(getId['fracoContra'][0]['iconeElemento']),
              backgroundColor: Colors.white,
            ),
            title: Text("Fraqueza:"),
            subtitle: Text(
              getId['fracoContra'][0]['nomeElemento'],
            ),
          ),
          ListTile(
            tileColor: Colors.indigo[50],
            title: Text("Região:"),
            subtitle: Text(
              getId['regiao']['nomeRegiao'],
            ),
          ),
          ListTile(
            tileColor: Colors.indigo[50],
            title: Text("Descrição:"),
            subtitle: Text(
              getId['descricao'],
            ),
          )
        ],
      )),
      actions: [
        RaisedButton(
            child: Text("Voltar"),
            textColor: Colors.white,
            color: Colors.red,
            onPressed: () => Navigator.of(context, rootNavigator: true).pop())
      ],
    );
    AlertDialog alerta = alertDialog;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
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
            Image(
                image: NetworkImage(
                    'https://image.flaticon.com/icons/png/512/188/188918.png'))
          ],
          leading: GestureDetector(
              child: Container(
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Index())))),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(40),
              width: 50,
              margin:
                  new EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              decoration: BoxDecoration(
                color: Colors.red[50],
                border: Border.all(color: Colors.red.shade100),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 2, bottom: 2),
                      child: Text(
                        data[index]['nome'],
                        style: TextStyle(fontSize: 25, color: Colors.redAccent),
                      )),
                  Image(
                      image: NetworkImage(data[index]['imagem']), height: 150),
                  RaisedButton(
                      color: Colors.red,
                      onPressed: () =>
                          showAlertDialog(context, data[index]['id']),
                      child: Text("Detalhes",
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.white,
                              fontFamily: 'Arial')))
                ],
              ),
            );
          }),
    );
  }
}
