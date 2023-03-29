import 'package:flutter/material.dart';
import './resposta.dart';
import './questao.dart';

class Questionario extends StatelessWidget {

  final List<Map<String, Object>> perguntas;
  final int perguntasSelecionada;
  final void Function(int) responder;

  Questionario({
    required this.perguntas,
    required this.perguntasSelecionada,
    required this.responder
  });

   bool get temPerguntaSelecionada {
    return perguntasSelecionada < perguntas.length;
  }

  setResponder(resp) {
    responder(int.parse(resp['pontuacao'].toString()));
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas  = temPerguntaSelecionada ?
      perguntas[perguntasSelecionada].cast()['respostas']
    : [];

    return Column(
      children: [
        Questao(perguntas[perguntasSelecionada]['texto'].toString()),
        ...respostas.map((resp) => Resposta(resp['texto'].toString(),
        () => setResponder(resp))).toList()
      ]
    );
  }
}