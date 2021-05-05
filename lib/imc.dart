//Enumeração para representar as diferentes faixas de IMC.
enum FaixaIMC {
  AbaixoIdeal,
  PesoIdeal,
  AcimaIdeal,
  ObesidadeI,
  ObesidadeII,
  ObesidadeIII,
}

// Extensão aplicada à enumeração FaixaIMC, para 
// adicionar propriedade de descrição.
extension FaixaIMCExt on FaixaIMC {
  String get descricao {
    switch (this) {
      case FaixaIMC.AbaixoIdeal:
        return 'Abaixo do Peso';
      case FaixaIMC.PesoIdeal:
        return 'Peso Ideal';
      case FaixaIMC.AcimaIdeal:
        return 'Acima do Peso'; 
      case FaixaIMC.ObesidadeI:
        return 'Obesidade Grau I';               
      case FaixaIMC.ObesidadeII:
        return 'Obesidade Grau II';
      case FaixaIMC.ObesidadeIII:
        return 'Obesidade Grau III';      
      default:
        return null;
    }
  }
}

/// Representa o IMC - Índice de Massa Corpórea.
/// 
class IMC{
  //Atributos da classe IMC, necessários para o cálculo do índice.
  double peso;
  double altura;

  //Construtor para receber os parâmetros.  
  IMC({this.peso, this.altura});

  //Propriedade que realiza o cálculo do índice.
  double get imc{
    return peso / (altura * altura);
  }

  //Propriedade que realizada a apuração da faixa conforme 
  //o índice calculdado.
  FaixaIMC get faixa {
      double valueIMC = this.imc;

      if(valueIMC < 18.6)
        return  FaixaIMC.AbaixoIdeal;
      if(valueIMC >= 18.6 && valueIMC < 24.9)
        return FaixaIMC.PesoIdeal;
      if(valueIMC >= 24.9 && valueIMC < 29.9)
        return FaixaIMC.AcimaIdeal;
      if(valueIMC >= 29.9 && valueIMC < 34.9)
        return FaixaIMC.ObesidadeI;
      if(valueIMC >= 34.9 && valueIMC < 39.9)
        return FaixaIMC.ObesidadeII;
      if(valueIMC >= 40)
        return FaixaIMC.ObesidadeIII;

      return null;
  } 
}