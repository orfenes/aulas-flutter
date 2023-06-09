import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  String title;
  String value;

  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Novo tenis de corrida',
      value: 310.76,
      date: DateTime.now()
    ),
    Transaction(
      id: 't2',
      title: 'Conta de luz',
      value: 255.30,
      date: DateTime.now()
    ),
  ];

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas pessoais'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('Grafico'),
              elevation: 5,
            ),
          ),
          Column(
            children: _transactions.map((tr) {
              return Card(
                child: Row(children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.purple,
                        width: 2,
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'R\$ ${tr.value.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text(
                      tr.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      DateFormat('d MMM y').format(tr.date),
                      style: TextStyle(
                         color: Colors.grey,
                      ),
                    )
                  ])
                ],),
              );
            }).toList(),
          ),
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    onChanged: (newValue) => title = newValue,
                    decoration: InputDecoration(
                      labelText: 'Titulo'
                    ),
                  ),
                  TextField(
                    onChanged: (newValue) => value = newValue,
                    decoration: InputDecoration(
                      labelText: 'Valor'
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print('realizando teste');
                      print('novidades');
                    },
                    child: Text('Nova transacao'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                      onPrimary: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}