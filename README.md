# MVVM-ListFilms

## ScreenShots da Aplicação

![image](https://ibb.co/CzmGz43)
![image](https://ibb.co/VxSXqZ3)
![image](https://ibb.co/QCpVkff)
![image](https://ibb.co/yprnqxD)


## Base Arquitetural


Este projeto utiliza como base arquitetural MVVM. 

![image](https://benoitpasquier.com/images/2018/01/mvvm-pattern.png)

Na implementação da MVVM deste projeto o Fluxo se inicia sempre Quando uma camada provedora de dados é injetada em uma viewModel. 

(Os Fluxos podem receber dados pela camada de Networking ou pela Camada de Persistencia de dados.)

Logo em seguida, com os dados injetados a ViewModel, trabalha os dados e entrega para a ViewController para ser exibida. 

**Um ponto importante a se notar:**

Como o projeto trabalha com Injeções de dependencias para não fazer acoplamento de classes fortes dentro do projeto, ViewControllers não trocam dados diretamente entre si. Caso um dado precise ser persistido e entregue para outra tela, o dado é entregue a ViewModel e a ViewModel entrega para a camada de persistencia de dados. 

**Beneficios da arquitetura:**

Como a proposta dessa arquitetura era que cada camada tivesse uma função bem definida. a implementação de testes será facilitada e a manutenção da arquitetura também. 

Uma vez que cada módulo espera apenas um resultado para ser carregado. eu posso por exemplo trocar a forma que a camada de networking faz chamadas HTTPS com o minimo de impacto dentro das viewmodels, posso trocar a persistencia de dados, retornar mocks para fazer testes e etc. Tudo isso com o minimo de esforço.

## Módulos da Aplicação. 

**App**

AppDelegate e Info.Plist

**Foundation**

A Camada de Foudation contem como responsabilidade criar e disponibilizar para a aplicação os recursos básicos para que ela exista. 


**DependencyInjection**

Com o objetivo de remover o acoplamento de ViewModels dentro das ViewControllers, a camada de Dependency Injecton registra e resolve todas as dependencias de todas as classes da Aplicação. 


**FlowController**

Similar a um controller de fluxo, a camada de FlowController ela chama e gerencia os fluxos da aplicação. Com a crucial diferença que a FlowController não registra nenhuma ViewController, ela apenas pede para que ela a instancia seja resolvida.


**UIKit**

Camada de UIKit da Aplicação, onde fica todas os componentes e recursos para criação de Layouts. 

**Scenes**

Todas as Scenas/Telas da aplicação.

## Debitos Técnicos

**1 -** Implementação da paginação na lista de filmes.

**1 -** Implementação do uso dos parameters entregue pelos Requests à camada de Network.

## Pods Instalados:
```  
  pod 'Swinject'
  pod 'IQKeyboardManager'
  pod 'lottie-ios' 
``` 
	
## Lottie-iOS

**Link:** https://github.com/airbnb/lottie-ios

**Função:** Lottie é uma biblioteca móvel para Android e iOS que renderiza nativamente animações e arte com base em vetor em tempo real com o mínimo de código.

**Como foi utilizado?:** Para demonstrar a animação de Loading na lista, estilo Skeleton.

## Swinject

**Link:** https://github.com/Swinject/Swinject

**Função:** Injeção de Dependência (DI) é um padrão de design de software que implementa Inversão de Controle (IoC) para resolver dependências. No padrão, o Swinject ajuda seu aplicativo a se dividir em componentes de acoplamento fraco, que podem ser desenvolvidos, testados e mantidos com mais facilidade. O Swinject é desenvolvido com o sistema de tipos genéricos Swift e funções de primeira classe para definir dependências do seu aplicativo de maneira simples e fluente.

**Como foi utilizado?:** Swinject foi um meio para remover o acomplamento das ViewModels nas ViewControllers, agora todas as dependencias são registras e a aplicação já conhece o que injetar em cada fluxo de tela.

## IQKeyboardManager

**Link:** https://github.com/hackiftekhar/IQKeyboardManager

**Função:** Ao desenvolver aplicativos para iOS, geralmente encontramos problemas nos quais o teclado do iPhone desliza para cima e cobre o UITextField / UITextView. O IQKeyboardManager permite evitar que esse problema do teclado deslize para cima e cubra o UITextField / UITextView sem precisar escrever nenhum código ou fazer qualquer configuração adicional. Para usar o IQKeyboardManager, basta adicionar arquivos de origem ao seu projeto.

**Como foi utilizado?:** Apenas adicionado ao projeto e ele passou a fazer sua função

