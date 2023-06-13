import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //Qui saranno inseriti i text che mostreranno l'ammontare economico dell'utente
          const Row(
            children: [
              //Questo text contiene il budget dell'utente
              Expanded(
                child: Text(""),
              ),
              //Questo mostrerà la variazione economica
              Expanded(
                child: Text(""),
              )
            ],
          ),
          //Qui verrà visuazizzata la lista delle transazioni
          Expanded(
            child: ListView(),
          )
        ],
      ),
    );
  }
}
