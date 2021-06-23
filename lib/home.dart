import 'package:consumo_api/getElemento/getagua.dart';
import 'package:consumo_api/getElemento/getbyelemento%20copy.dart';
import 'package:consumo_api/getElemento/getdragao.dart';
import 'package:consumo_api/getElemento/getfada.dart';
import 'package:consumo_api/getElemento/getfatasma.dart';
import 'package:consumo_api/getElemento/getgelo.dart';
import 'package:consumo_api/getElemento/getgrama.dart';
import 'package:consumo_api/getElemento/getinseto.dart';
import 'package:consumo_api/getElemento/getlutador.dart';
import 'package:consumo_api/getElemento/getnormal.dart';
import 'package:consumo_api/getElemento/getnoturno.dart';
import 'package:consumo_api/getElemento/getpsiquico.dart';
import 'package:consumo_api/getElemento/getrocha.dart';
import 'package:consumo_api/getElemento/getterra.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'getElemento/getall.dart';
import 'getElemento/getbyelemento.dart';
import 'getElemento/getmetalico.dart';
import 'getElemento/getvenenoso.dart';
import 'getElemento/getvoador.dart';

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
        body: ListView(
          children: [
            ListTile(
                leading: CircleAvatar(
                  backgroundImage: 
                  NetworkImage('https://image.flaticon.com/icons/png/512/188/188918.png'),
                ),
                tileColor: Colors.red[50],
                title: Text('Todos Pokemons'),
                subtitle: Text('Listagem de todos os pokemons'),
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => MyApp()))),
            ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("icones/fogo.png"),
                ),
                title: Text('Fogo'),
                subtitle: Text('Listagem de todos os pokemons do tipo Fogo'),
                tileColor: Colors.orange[50],
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => GetElemento()))),
            ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("icones/agua.png"),
                  backgroundColor: Colors.white,
                ),
                tileColor: Colors.blue[50],
                title: Text('Água'),
                subtitle: Text('Listagem de todos os pokemons do tipo Água'),
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => GetAgua()))),
            ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("icones/raio.png"),
                  backgroundColor: Colors.white,
                ),
                tileColor: Colors.yellow[50],
                title: Text('Elétrico'),
                subtitle:
                    Text('Listagem de todos os pokemons do tipo Elétrico'),
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => GetEletrico()))),
            ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("icones/grama.png"),
                  backgroundColor: Colors.white,
                ),
                tileColor: Colors.green[50],
                title: Text('Grama'),
                subtitle: Text('Listagem de todos os pokemons do tipo Grama'),
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => GetGrama()))),
            ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("icones/gelo.png"),
                  backgroundColor: Colors.white,
                ),
                tileColor: Colors.blue[70],
                title: Text('Gelo'),
                subtitle: Text('Listagem de todos os pokemons do tipo Gelo'),
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => GetGelo()))),
            ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://i.ibb.co/4KBWNVP/dragao.png'),
                  backgroundColor: Colors.white,
                ),
                tileColor: Colors.yellow[50],
                title: Text('Dragão'),
                subtitle: Text('Listagem de todos os pokemons do tipo Dragão'),
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => GetDragao()))),
            ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://i.ibb.co/kcCGQKJ/fada.png'),
                  backgroundColor: Colors.white,
                ),
                tileColor: Colors.black12,
                title: Text('Fada'),
                subtitle: Text('Listagem de todos os pokemons do tipo Fada'),
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => GetFada()))),
            ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://i.ibb.co/2NJCPd9/fantasma.png'),
                  backgroundColor: Colors.white,
                ),
                tileColor: Colors.blue.shade50,
                title: Text('Fantasma'),
                subtitle:
                    Text('Listagem de todos os pokemons do tipo Fantasma'),
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => GetFantasma()))),
            ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://i.ibb.co/Gxg7DKJ/inseto.png'),
                  backgroundColor: Colors.white,
                ),
                tileColor: Colors.brown[50],
                title: Text('Inseto'),
                subtitle: Text('Listagem de todos os pokemons do tipo Inseto'),
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => GetInseto()))),
            ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://i.ibb.co/3BPySRD/lutador.png'),
                  backgroundColor: Colors.white,
                ),
                tileColor: Colors.yellow[50],
                title: Text('Lutador'),
                subtitle: Text('Listagem de todos os pokemons do tipo Lutador'),
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => GetLutador()))),
            ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://i.ibb.co/CswrXPb/metallico.png'),
                  backgroundColor: Colors.black12,
                ),
                tileColor: Colors.blue.shade50,
                title: Text('Metalico'),
                subtitle:
                    Text('Listagem de todos os pokemons do tipo Metalico'),
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => GetMetalico()))),
            ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://i.ibb.co/kxCGBcx/normal.png'),
                  backgroundColor: Colors.black12,
                ),
                tileColor: Colors.white70,
                title: Text('Normal'),
                subtitle: Text('Listagem de todos os pokemons do tipo Normal'),
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => GetNormal()))),
            ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://i.ibb.co/TYGMwJ7/noturno.png'),
                  backgroundColor: Colors.black12,
                ),
                tileColor: Colors.indigo[50],
                title: Text('Noturno'),
                subtitle: Text('Listagem de todos os pokemons do tipo Noturno'),
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => GetNoturno()))),
            ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://i.ibb.co/QpqJdVS/psiquico.png'),
                  backgroundColor: Colors.white,
                ),
                tileColor: Colors.yellow[50],
                title: Text('Psíquico'),
                subtitle:
                    Text('Listagem de todos os pokemons do tipo Psíquico'),
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => GetPsiquico()))),
            ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://i.ibb.co/tHZt3xJ/rocha.png'),
                  backgroundColor: Colors.white,
                ),
                tileColor: Colors.grey[50],
                title: Text('Rocha'),
                subtitle: Text('Listagem de todos os pokemons do tipo Rocha'),
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => GetRocha()))),
            ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://i.ibb.co/Wxjmtq6/terra.png'),
                  backgroundColor: Colors.white,
                ),
                tileColor: Colors.brown[50],
                title: Text('Terra'),
                subtitle: Text('Listagem de todos os pokemons do tipo Terra'),
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => GetTerra()))),
            ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://i.ibb.co/p438s3K/venenoso.png'),
                  backgroundColor: Colors.white,
                ),
                tileColor: Colors.purple[50],
                title: Text('Venenoso'),
                subtitle:
                    Text('Listagem de todos os pokemons do tipo Venenoso'),
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => GetVenenoso()))),
            ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://i.ibb.co/yBmPW0q/voador.png'),
                  backgroundColor: Colors.white,
                ),
                tileColor: Colors.blue[50],
                title: Text('Voador'),
                subtitle: Text('Listagem de todos os pokemons do tipo Voador'),
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => GetVoador()))),
          ],
        ));
  }
}
