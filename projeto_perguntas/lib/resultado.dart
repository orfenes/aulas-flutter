import 'package:flutter/material.dart';
class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;
  String texto = 'Reiniciar ?';

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if(pontuacao < 8) {
      return 'parabens';
    } else if (pontuacao < 12) {
      return 'vc e bom';
    } else if (pontuacao < 16) {
      return 'impressionante';
    } else {
      return 'nivel jedi';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          )
        ),
        ElevatedButton(
          onPressed: quandoReiniciarQuestionario,
          child: Text(texto),
          )
      ],
    );
  }
}