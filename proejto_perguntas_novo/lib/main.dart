import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
      {
        'texto': 'Qual é a sua cor favorita',
        'respostas': [
          {'text': 'Preto', 'pontuacao': 10},
          {'text': 'Vermelho', 'pontuacao': 5},
          {'text': 'Verde', 'pontuacao': 3},
          {'text': 'Branco', 'pontuacao': 1},
        ],
      },
      {
        'texto': 'Qual é o seu animal favorito',
        'respostas': [
          {'text': 'Coelho', 'pontuacao': 10},
          {'text': 'Cobra', 'pontuacao': 5},
          {'text': 'Elefante', 'pontuacao': 3},
          {'text': 'Leão', 'pontuacao': 1},
        ],
      },
      {
        'texto': 'Qual seu instrutor favorito',
        'respostas': [
          {'text': 'Maria', 'pontuacao': 10},
          {'text': 'Joao', 'pontuacao': 5},
          {'text': 'Leo', 'pontuacao': 3},
          {'text': 'Pedro', 'pontuacao': 1},
        ]
      }
    ];

  void _responder(int pontuacao) {
    if(temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
          ? Questionario(
            perguntas: _perguntas,
            perguntaSelecionada: _perguntaSelecionada,
            quantoResponder: _responder,
          )
          : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget{

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}