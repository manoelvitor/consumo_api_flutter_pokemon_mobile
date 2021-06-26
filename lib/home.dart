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
              Image(
                  image: NetworkImage(
                      "https://pokemon-fatec.s3.sa-east-1.amazonaws.com/025.png"))
            ]),
        body:  
          ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(data[index]['iconeElemento']),
                      backgroundColor: Colors.white,
                    ),
                    tileColor: Colors.red[50],
                    title: Text(data[index]['nomeElemento']),
                    subtitle: Text('Listagem de todos os pokemons tipo: ' +
                        data[index]['nomeElemento']),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PegarElemento(
                            elemento: data[index]['nomeElemento']))));
              })
        );
  }
}

// ListView.builder(
//     itemCount: data.length,
//     itemBuilder: (context, index) {
//       return ListTile(
//           leading: CircleAvatar(
//             backgroundImage: NetworkImage(data[index]['iconeElemento']),
//             backgroundColor: Colors.white,
//           ),
//           tileColor: Colors.red[50],
//           title: Text(data[index]['nomeElemento']),
//           subtitle: Text('Listagem de todos os pokemons tipo: ' +
//               data[index]['nomeElemento']),
//           onTap: () => Navigator.of(context).push(MaterialPageRoute(
//               builder: (context) => PegarElemento(
//                   elemento: data[index]['nomeElemento']))));
//     }

// children: [
//   ListTile(
//       leading: CircleAvatar(
//         backgroundImage:
//         NetworkImage('https://image.flaticon.com/icons/png/512/188/188918.png'),
//       ),
//       tileColor: Colors.red[50],
//       title: Text('Todos Pokemons'),
//       subtitle: Text('Listagem de todos os pokemons'),
//       onTap: () => Navigator.of(context)
//           .push(MaterialPageRoute(builder: (context) => MyApp()))),
//   ListTile(
//       leading: CircleAvatar(
//         backgroundImage: AssetImage("icones/fogo.png"),
//       ),
//       title: Text('Fogo'),
//       subtitle: Text('Listagem de todos os pokemons do tipo Fogo'),
//       tileColor: Colors.orange[50],
//       onTap: () => Navigator.of(context).push(
//           MaterialPageRoute(builder: (context) => PegarElemento(elemento: 'Fogo',)))),
//   ListTile(
//       leading: CircleAvatar(
//         backgroundImage: AssetImage("icones/agua.png"),
//         backgroundColor: Colors.white,
//       ),
//       tileColor: Colors.blue[50],
//       title: Text('Água'),
//       subtitle: Text('Listagem de todos os pokemons do tipo Água'),
//       onTap: () => Navigator.of(context)
//           .push(MaterialPageRoute(builder: (context) => PegarElemento(elemento: 'Agua')))),
//   ListTile(
//       leading: CircleAvatar(
//         backgroundImage: AssetImage("icones/raio.png"),
//         backgroundColor: Colors.white,
//       ),
//       tileColor: Colors.yellow[50],
//       title: Text('Elétrico'),
//       subtitle:
//           Text('Listagem de todos os pokemons do tipo Elétrico'),
//       onTap: () => Navigator.of(context).push(
//           MaterialPageRoute(builder: (context) => PegarElemento(elemento: 'Elétrico')))),
//   ListTile(
//       leading: CircleAvatar(
//         backgroundImage: AssetImage("icones/grama.png"),
//         backgroundColor: Colors.white,
//       ),
//       tileColor: Colors.green[50],
//       title: Text('Grama'),
//       subtitle: Text('Listagem de todos os pokemons do tipo Grama'),
//       onTap: () => Navigator.of(context)
//           .push(MaterialPageRoute(builder: (context) => PegarElemento(elemento: 'Grama',)))),
//   ListTile(
//       leading: CircleAvatar(
//         backgroundImage: AssetImage("icones/gelo.png"),
//         backgroundColor: Colors.white,
//       ),
//       tileColor: Colors.blue[70],
//       title: Text('Gelo'),
//       subtitle: Text('Listagem de todos os pokemons do tipo Gelo'),
//       onTap: () => Navigator.of(context)
//           .push(MaterialPageRoute(builder: (context) => PegarElemento(elemento: 'Gelo',)))),
//   ListTile(
//       leading: CircleAvatar(
//         backgroundImage:
//             NetworkImage('https://i.ibb.co/4KBWNVP/dragao.png'),
//         backgroundColor: Colors.white,
//       ),
//       tileColor: Colors.yellow[50],
//       title: Text('Dragão'),
//       subtitle: Text('Listagem de todos os pokemons do tipo Dragão'),
//       onTap: () => Navigator.of(context).push(
//           MaterialPageRoute(builder: (context) => PegarElemento(elemento: 'Dragão',)))),
//   ListTile(
//       leading: CircleAvatar(
//         backgroundImage:
//             NetworkImage('https://i.ibb.co/kcCGQKJ/fada.png'),
//         backgroundColor: Colors.white,
//       ),
//       tileColor: Colors.black12,
//       title: Text('Fada'),
//       subtitle: Text('Listagem de todos os pokemons do tipo Fada'),
//       onTap: () => Navigator.of(context)
//           .push(MaterialPageRoute(builder: (context) => PegarElemento(elemento: 'Fada',)))),
//   ListTile(
//       leading: CircleAvatar(
//         backgroundImage:
//             NetworkImage('https://i.ibb.co/2NJCPd9/fantasma.png'),
//         backgroundColor: Colors.white,
//       ),
//       tileColor: Colors.blue.shade50,
//       title: Text('Fantasma'),
//       subtitle:
//           Text('Listagem de todos os pokemons do tipo Fantasma'),
//       onTap: () => Navigator.of(context).push(
//           MaterialPageRoute(builder: (context) => PegarElemento(elemento: 'Fantasma',)))),
//   ListTile(
//       leading: CircleAvatar(
//         backgroundImage:
//             NetworkImage('https://i.ibb.co/Gxg7DKJ/inseto.png'),
//         backgroundColor: Colors.white,
//       ),
//       tileColor: Colors.brown[50],
//       title: Text('Inseto'),
//       subtitle: Text('Listagem de todos os pokemons do tipo Inseto'),
//       onTap: () => Navigator.of(context).push(
//           MaterialPageRoute(builder: (context) => PegarElemento(elemento: 'Inseto',)))),
//   ListTile(
//       leading: CircleAvatar(
//         backgroundImage:
//             NetworkImage('https://i.ibb.co/3BPySRD/lutador.png'),
//         backgroundColor: Colors.white,
//       ),
//       tileColor: Colors.yellow[50],
//       title: Text('Lutador'),
//       subtitle: Text('Listagem de todos os pokemons do tipo Lutador'),
//       onTap: () => Navigator.of(context).push(
//           MaterialPageRoute(builder: (context) => PegarElemento(elemento: 'Lutador',)))),
//   ListTile(
//       leading: CircleAvatar(
//         backgroundImage:
//             NetworkImage('https://i.ibb.co/CswrXPb/metallico.png'),
//         backgroundColor: Colors.black12,
//       ),
//       tileColor: Colors.blue.shade50,
//       title: Text('Metalico'),
//       subtitle:
//           Text('Listagem de todos os pokemons do tipo Metalico'),
//       onTap: () => Navigator.of(context).push(
//           MaterialPageRoute(builder: (context) => PegarElemento(elemento: 'Metalico',)))),
//   ListTile(
//       leading: CircleAvatar(
//         backgroundImage:
//             NetworkImage('https://i.ibb.co/kxCGBcx/normal.png'),
//         backgroundColor: Colors.black12,
//       ),
//       tileColor: Colors.white70,
//       title: Text('Normal'),
//       subtitle: Text('Listagem de todos os pokemons do tipo Normal'),
//       onTap: () => Navigator.of(context).push(
//           MaterialPageRoute(builder: (context) => PegarElemento(elemento: 'Normal',)))),
//   ListTile(
//       leading: CircleAvatar(
//         backgroundImage:
//             NetworkImage('https://i.ibb.co/TYGMwJ7/noturno.png'),
//         backgroundColor: Colors.black12,
//       ),
//       tileColor: Colors.indigo[50],
//       title: Text('Noturno'),
//       subtitle: Text('Listagem de todos os pokemons do tipo Noturno'),
//       onTap: () => Navigator.of(context).push(
//           MaterialPageRoute(builder: (context) => PegarElemento(elemento: 'Noturno',)))),
//   ListTile(
//       leading: CircleAvatar(
//         backgroundImage:
//             NetworkImage('https://i.ibb.co/QpqJdVS/psiquico.png'),
//         backgroundColor: Colors.white,
//       ),
//       tileColor: Colors.yellow[50],
//       title: Text('Psíquico'),
//       subtitle:
//           Text('Listagem de todos os pokemons do tipo Psíquico'),
//       onTap: () => Navigator.of(context).push(
//           MaterialPageRoute(builder: (context) => PegarElemento(elemento: 'Psíquico',)))),
//   ListTile(
//       leading: CircleAvatar(
//         backgroundImage:
//             NetworkImage('https://i.ibb.co/tHZt3xJ/rocha.png'),
//         backgroundColor: Colors.white,
//       ),
//       tileColor: Colors.grey[50],
//       title: Text('Rocha'),
//       subtitle: Text('Listagem de todos os pokemons do tipo Rocha'),
//       onTap: () => Navigator.of(context)
//           .push(MaterialPageRoute(builder: (context) => PegarElemento(elemento: 'Rocha',)))),
//   ListTile(
//       leading: CircleAvatar(
//         backgroundImage:
//             NetworkImage('https://i.ibb.co/Wxjmtq6/terra.png'),
//         backgroundColor: Colors.white,
//       ),
//       tileColor: Colors.brown[50],
//       title: Text('Terra'),
//       subtitle: Text('Listagem de todos os pokemons do tipo Terra'),
//       onTap: () => Navigator.of(context)
//           .push(MaterialPageRoute(builder: (context) => PegarElemento(elemento: 'Terra',)))),
//   ListTile(
//       leading: CircleAvatar(
//         backgroundImage:
//             NetworkImage('https://i.ibb.co/p438s3K/venenoso.png'),
//         backgroundColor: Colors.white,
//       ),
//       tileColor: Colors.purple[50],
//       title: Text('Venenoso'),
//       subtitle:
//           Text('Listagem de todos os pokemons do tipo Venenoso'),
//       onTap: () => Navigator.of(context).push(
//           MaterialPageRoute(builder: (context) => PegarElemento(elemento: 'Venenoso',)))),
//   ListTile(
//       leading: CircleAvatar(
//         backgroundImage:
//             NetworkImage('https://i.ibb.co/yBmPW0q/voador.png'),
//         backgroundColor: Colors.white,
//       ),
//       tileColor: Colors.blue[50],
//       title: Text('Voador'),
//       subtitle: Text('Listagem de todos os pokemons do tipo Voador'),
//       onTap: () => Navigator.of(context).push(
//           MaterialPageRoute(builder: (context) => PegarElemento(elemento: 'Voador',)))),
//],
