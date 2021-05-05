import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imcapp/imc.dart';

class IMCResultado extends StatefulWidget {
  final IMC imc;
  IMCResultado({this.imc});

  @override
  _IMCResultadoState createState() => _IMCResultadoState(imc: this.imc);
}

class _IMCResultadoState extends State<IMCResultado> {
  // Atributos da classe para receber os dados necessários
  // para o cálculo do IMC:
  final IMC _imc;
  Color _corFaixa;

  //Construtor da Classe IMCResultado com parâmetros para
  //receber os valores da primeira tela:
  _IMCResultadoState({
    @required IMC imc,
  }) : _imc = imc {
    switch (imc.faixa) {
      case FaixaIMC.AbaixoIdeal:
        _corFaixa = Colors.green;
        break;
      case FaixaIMC.PesoIdeal:
        _corFaixa = Colors.blue;
        break;
      case FaixaIMC.AcimaIdeal:
        _corFaixa = Colors.orange;
        break;
      case FaixaIMC.ObesidadeI:
        _corFaixa = Colors.orangeAccent;
        break;
      case FaixaIMC.ObesidadeII:
        _corFaixa = Colors.red;
        break;
      case FaixaIMC.ObesidadeIII:
        _corFaixa = Colors.deepPurple;
        break;
    }
  }

  // Método build, responsável pela criação da árvore de widgets
  // para a tela de resultado:
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado do IMC'),
        backgroundColor: _corFaixa,
      ),

      // O widget SingleChildScrollView permite que o conteúdo da tela
      // seja rolado e impede que os demais componentes sejam cortados.
      body: SingleChildScrollView(
        child:          
          Center(
            child: Container(
                height: MediaQuery.of(context).size.height*0.8,
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    border: Border.all(color: _corFaixa, width: 9),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Índice IMC apresentado com uma fonte personalizada.
                    // Foi utilizado o pacote Google Fonts.
                    Padding(
                        padding: EdgeInsets.all(0),
                        child: Text(_imc.imc.toStringAsPrecision(3),
                            style: GoogleFonts.caladea(fontSize: 90))),

                    // Faixa na qual se encontra a pessoa conforme o IMC
                    // A cor do texto é personalizada conforme a faixa.
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Classificação:',
                          style: TextStyle(fontSize: 16, color: _corFaixa),
                        )),
                    Padding(
                        padding: EdgeInsets.all(0),
                        child: Text(
                          '${_imc.faixa.descricao}',
                          style: TextStyle(fontSize: 20, color: _corFaixa),
                        )),

                    // Texto padrão de orientação ao usuário.
                    Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Text(
                            'O seu IMC indica se você possui o peso ideal, se '
                            'está acima ou abaixo do peso. Lembre-se que uma boa alimentação '
                            'e exercícios físicos regulares são fundamentais para '
                            'manter uma boa saúde. ')),
                  ],
                ),
        ),
          ),
      ),
    );
  }
}
