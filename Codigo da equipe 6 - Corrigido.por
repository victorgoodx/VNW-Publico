programa {
  inclua biblioteca Util --> ut

  // O algoritmo � um cadastro de filmes
  // � poss�vel cadastrar at� 12 filmes com o seu g�nero correspondente
  // O usu�rio pode escolher entre 6 op��es
  // 1)cadastrar; 2)listar; 3)atualizar; 4)excluir; 5)filtrar por g�nero
  // e 0)encerrar programa

  cadeia filmes[12]
  cadeia genero[12]
  inteiro contadorFilmes = 0

  funcao inicio() {
    inteiro opcao
    
    escreva("\n\nBem-vindo ao aplicativo de cadastro de filmes Vai na Web!")
    ut.aguarde(1000)
    escreva("!")
    ut.aguarde(1000)
    escreva("!")
    ut.aguarde(800)

    enquanto(opcao != '0') {
      limpa()
      escreva("\n\n1) Cadastrar um filme\n")
      escreva("2) Listar filmes cadastrados\n")
      escreva("3) Atualizar um filme cadastrado\n")
      escreva("4) Excluir um filme cadastrado\n")
      escreva("5) Filtrar por gênero\n")
      escreva("0) Sair do sistema\n\n")
      escreva("Selecione uma das opções acima: ")

      leia(opcao)
      
      executaOpcaoSelecionada(opcao)
    }
  }

 funcao executaOpcaoSelecionada(inteiro opcao) {
    escolha(opcao) {
        caso 1:
            cadastrafilme()
            pare
        caso 2:
          listaFilmes()
            pare
        caso 3: 
          atualizarFilme()
            pare
        caso 4: 
          excluirFilme()
            pare
        caso 5: 
          escreva("Op��o padr�o")
          filtrarFilmes()
          pare
        caso contrario:
          escreva("Op��o padr�o")
    }  
  }

  //Essa fun��o faz o cadastro de filmes. 
  //Se a vari�vel "contadorFilmes" for menor que 12, ele pergunta o T�tulo e G�nero do filme e adiciona dentro do vetor na posi��o da vari�vel contadorFilmes.
  funcao cadastrafilme() {
    se (contadorFilmes < 12) {
      escreva("T�tulo do filme: ")
      leia(filmes[contadorFilmes])
      escreva("G�nero do filme: ")
      leia(genero[contadorFilmes])
      contadorFilmes++
      escreva("Cadastrado com sucesso!")
    } senao {
      escreva("Imposs�vel cadastrar mais filmes. ")
    }
    ut.aguarde(3000)
  }

  //Verifica se h� filmes cadastrados. Se n�o houver, exibe a mensagem "Nenhum filme cadastrado."
  //Se houver filmes cadastrados, ele percorre o vetor de filmes e seus g�neros usando um loop para.
  //Para cada filme cadastrado, exibe o n�mero do filme, t�tulo e g�nero na tela.
   funcao listaFilmes() {
    se (contadorFilmes == 0) {
      escreva("Nenhum filme cadastrado.\n")
    } senao {
      escreva("\nLista de Filmes Cadastrados:\n")
      para (inteiro i = 0; i < contadorFilmes; i++) {
        escreva("Filme ", i + 1, ":\n")
        escreva("T�tulo: ", filmes[i], "\n")
        escreva("G�nero: ", genero[i], "\n\n")
      }
    }
    ut.aguarde(8000)
  }

  //Esta fun��o permite ao usu�rio atualizar informa��es de um filme cadastrado.
  //Se n�o houver filmes cadastrados, exibe uma mensagem de aviso.
  //Caso contr�rio, solicita o n�mero do filme a ser atualizado, verifica se o n�mero � v�lido
  //e permite a atualiza��o do t�tulo e do g�nero do filme.
  //Ap�s a atualiza��o, exibe uma mensagem de sucesso ou erro, conforme o caso.
funcao atualizarFilme() {
  se (contadorFilmes == 0) {
    escreva("Nenhum filme cadastrado.\n")
  } senao {
    escreva("Digite o n�mero do filme que deseja atualizar: ")
    inteiro numeroFilme
    leia(numeroFilme)

    se (numeroFilme >= 1 e numeroFilme <= contadorFilmes) {
      escreva("Novo t�tulo do filme: ")
      leia(filmes[numeroFilme - 1])
      escreva("Novo g�nero do filme: ")
      leia(genero[numeroFilme - 1])

      escreva("Filme atualizado com sucesso!\n")
    } senao {
      escreva("N�mero do filme inv�lido!\n")
    }
  }
  ut.aguarde(3000)
}

  // Fun��o Excluir Filme:
  // Verificamos se existe filmes no vetor, caso n�o tenha, imprime o texto: "Nenhum filme para excluir";
  // Tendo filmes cadastrados, o codigo gera uma lista com loop para, utilizando a mesma n�mera��o da listagem de filmes para a exclus�o;
  // � solicitado ao usu�rio que digite o n�mero correspondente ao filme que deseja excluir;
  // Caso o n�mero seja inexistente, imprime a frase: "N�mero de filme inv�lido. Tente novamente.";
  // Em caso de sucesso na exclus�o, recebe-se o informe: "Filme removido com sucesso!" e retorna ao menu inicial.
  funcao excluirFilme() {
  se (contadorFilmes == 0) {
    escreva("Nenhum filme para excluir.\n")
  } senao {
    escreva("\nLista de filmes:\n")

    para (inteiro i = 0; i < contadorFilmes; i++) {
      escreva("Filme ", i + 1, ") T�tulo: ", filmes[i], "\n")
    }

    escreva("\nEscolha um dos filmes acima para excluir (1 a ", contadorFilmes, "): ")
    inteiro excluir_opc
    leia(excluir_opc)

    se (excluir_opc >= 1 e excluir_opc <= contadorFilmes) {
      para (inteiro j = excluir_opc - 1; j < contadorFilmes - 1; j++) {
        filmes[j] = filmes[j + 1]
        genero[j] = genero[j + 1]
      }
      contadorFilmes--
      escreva("Filme removido com sucesso!\n")
    } senao {
      escreva("N�mero de filme inv�lido. Tente novamente.\n")
    }
  }
  ut.aguarde(2000)
}

  //exibe uma lista de filmes que pertecem ao genero escolhido pelo usuario
  //  acima do primeiro "para" 
  // compara o genero buscado com a lista de generos cadastrados alocando os filmes na lista que vir� a ser exibida posteriormente
  //  acima da ultima condi��o 
  // verifica se existe filmes do g�nero buscado, se sim retorna a lista, caso contrario retorna uma mensagem indicando aus�ncia
  funcao filtrarFilmes() {
  cadeia filtrados[12]
  inteiro posicao = 0
  cadeia escolhido

  escreva("Digite o g�nero: ")
  leia(escolhido)

  para (inteiro i = 0; i < contadorFilmes; i++) {
    se (escolhido == genero[i]) {
      filtrados[posicao] = filmes[i]
      posicao++
    }
  }

    limpa()
    escreva("Buscando")
    ut.aguarde(1000)
    escreva(".")
    ut.aguarde(1000)
    escreva(".")
    ut.aguarde(1000)
    escreva(".")
    ut.aguarde(1000)
    limpa()

  se (posicao > 0) {
    escreva("Filmes de ", escolhido, ":\n")
    para (inteiro j = 0; j < posicao; j++) {
      escreva(filtrados[j], "\n")
    }
  } senao {
    escreva("Nenhum filme de ", escolhido, " encontrado!")
  }
  ut.aguarde(6000)
}
}
