# Decisões técnicas.

### **Decoder:**

Logo no decoder do Json me deparei com um problema, onde algumas das chaves, recebiam mais de um tipo de valor diferente dentro delas, como ints, doubles e strings, precisei utilizar **propertywrappe**r para verificar todos os valores recebidos nessas chaves e transforma-las no valor que meu modelo esperava, optei por esperar o tipo String, pois nesse aplicativo os dados foram usados apenas para exibição ao usuário, mas caso precisa-se deles como número, poderia converte-los em double, ou ja espera-lo no decoder como double ao invés de string.

### Persistencia:

Para persistência dos dados da lead, utilizei coreData, que é um framework nativo da apple que manipula SQLite por trás dos panos, permitindo que o usuário trabalhe as informações de uma forma mais amigável.

### Navegação:

Para deixar o aplicativo mais interativo com o usuário e evitar uma experiência muito estática, resolvi deixá-lo com três telas, a primeira é a lista em si, apenas com a marca dos veículos, a segunda é uma tela com mais detalhes do veiculo escolhido para que o usuário possa analisar melhor sua escolha, ao clicar no botão “eu quero” aparece a terceira tela no modelo presenter ao invés do push como a segunda, essa tela apenas tem alguns dados do usuário para que ele possa ser identificado, e um botão de confirmação, como essa tela tem poucos elementos, fiz de forma que ela suba apenas até a metade do espaço da tela do aparelho, para que esses elementos sejam suficientes para preencher adequadamente a tela.

### Views:

foram feitas de forma programática, dispensando o uso de storyboards ou xib’s, incluindo a célula customizada, para facilitar o versionamento do código via Git.

### Rotina de post:

Para realizar os posts de forma automática e cronometrada, utilizei o método Timer.scheduledtimer, onde eu consigo definir um bloco de código a ser executado, que no caso é meu post, consigo definir também o tempo de intervalo entre os disparos do bloco e se eu desejo que esse método fique se repetindo, e chamei esse método em uma função do ciclo de vida do app que é disparado logo na sua inicialização, para que a rotina seja iniciada sempre que o app for aberto.

### Construção das leads:

as leads são compostas por 3 campos para identificação do usuário, sendo nome, telefone e cpf, um quarto campo que é o id do veiculo escolhido, para que possa ser feita a identificação da escolha do usuário e por fim um campo isNeedUpload, que nada mais é que um boolean que inicia como true, meu fetchLeads busca apenas os que tiverem esse campo como true para que quando componham meu body no post, após serem postados, o campo será alterado para false, fazendo com que não sejam mais adicionados na próxima lista de postagem, evitando o upload de dados repetidos e também sem a necessidade de deletados antes de chamar o post também é verificado se foi encontrado pelo menos uma lead com o isNeedUpload true, caso contrário o bloco do post será pulando, evitando requests vazias.
