class Planos {
  String nome;
  String descricao;
  double preco;

  Planos({required this.nome, required this.descricao, required this.preco});
}

class Categorias {
  String nome;
  String img;
  String subCategoria;
  String imgSubCategoria;
  Categorias({
    required this.nome,
    required this.img,
    this.imgSubCategoria = '',
    this.subCategoria = '',
  });
}

class Profissional {
  String nomeCompleto;
  String telefone;
  String cpf;
  String endereco;

  //
  String categoria;
  //
  //Adicionar Sub Categoria

  //Descrição da atividade
  //Fotos
  //Vídeos
  //Redes Sociais
  String profissao;

  //
  String plano;
  //
  bool autorizado;

  //Adicionar validação se estiver pago

  Profissional({
    required this.nomeCompleto,
    required this.telefone,
    required this.cpf,
    required this.endereco,
    required this.categoria,
    required this.profissao,
    required this.plano,
    this.autorizado = false,
  });
}
