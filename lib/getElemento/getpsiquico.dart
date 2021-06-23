import 'dart:convert';
//import 'dart:convert' show utf8;

import 'package:consumo_api/home.dart';
import 'package:flutter/material.dart';
//import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class GetPsiquico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokemons',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyGetElemento(),
    );
  }
}

class MyGetElemento extends StatefulWidget {
  const MyGetElemento({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyGetElemento> {
  List data = [];
  var getId;

  Future _atualizar() async {
    var url = Uri.parse('https://api-pokemon-fatec.herokuapp.com/pokemons/elemento/Psíquico');
    //var response = await http.get(url);

    http.Response response =
        await http.get(url, headers: {"Accept": "application/json"});

    // data = json.decode(response.body);

    setState(() {
      data = json.decode(response.body);
      

      // data.forEach((element) {
      //   print(element['nome']);
      // });
    });
  }

  initState() {
    super.initState();
    _atualizar();
  }

  Future showAlertDialog(BuildContext context, id) async {
    String descricao;
    var url1 =
        Uri.parse("https://api-pokemon-fatec.herokuapp.com/pokemons/$id");
    //var response = await http.get(url);

    http.Response response =
        await http.get(url1, headers: {"Accept": "application/json"});

    // data = json.decode(response.body);

    setState(() {
      getId = json.decode(response.body);
    });
    descricao = "Descrição: " + getId['descricao'];

    print('ola');

    // configura o button
    Widget okButton = FlatButton(
        child: Text("Voltar a lista"),
        onPressed: () => Navigator.of(this.context).pop(true));

    // configura o  AlertDialog
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

      // Container(
      //     padding: EdgeInsets.all(40),
      //     width: 50,
      //     decoration: BoxDecoration(
      //         border: Border.all(color: Colors.redAccent),
      //         borderRadius: BorderRadius.circular(10.5)),
      //     child: Column(
      //       children: [
      //         Image(image: NetworkImage(getId['imagem'])),
      //         Text("Elemento:" + getId['elemento']['nomeElemento']),
      //         Text("Descrição: " + getId['descricao']),
      //         Text("Fraquezas: " + getId['fracoContra'][0]['nomeElemento']),
      //       ],
      //     )),
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

// Card(
//       child: ListTile(
//         leading: FlutterLogo(),
//         title: Text('One-line with leading widget'),
//       ),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.red,
          
          title: Text('Lista de Pokemons', textAlign: TextAlign.center, style:TextStyle(fontSize: 25), ),
          actions: [
            Image(image: NetworkImage('https://image.flaticon.com/icons/png/512/188/188918.png'))
          ],
          leading: GestureDetector(
              
              child: Container(
                child:  Icon(
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

                      //telaPokemon(context, data[index]['id'])
                      //showAlertDialog(context),
                      child: Text("Detalhes",
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.white,
                              fontFamily: 'Arial')))
                ],
              ),
              // child: Image(image: NetworkImage(data[index]['imagem']), height: 200,
            );
          }),
    );
  }
}

// // }

// @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Cotação do Dólar WS!"),
//           centerTitle: true,
//         ),
//         body: Center(
//           child: Container(
//             padding: EdgeInsets.all(40),
//             child: Column(
//                 //mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(top: 10, bottom: 10),
//                     child: Text(
//                       "ola",
//                       style: TextStyle(fontSize: 15, color: Colors.yellow),
//                     ),
//                   ),

//                   TextButton(
//                       onPressed: _atualizar,
//                       child: Text("Atualizar",
//                           style: TextStyle(fontSize: 30.0, color: Colors.blue)))

//                 ]),
//           ),
//         ));
//   }
//}
