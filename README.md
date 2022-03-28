# MVVM-ListFilms

## ScreenShots da Aplicação

!<img src="https://i.ibb.co/BtcMtv5/1.png" width="282" height="531">
!<img src="https://i.ibb.co/3vNtCqk/2.png" width="282" height="531">
!<img src="https://i.ibb.co/8dNwb00/3.png" width="282" height="531">
!<img src="https://i.ibb.co/C6f5QSq/4.png" width="282" height="531">

## Base Arquitetural


Este projeto utiliza como base arquitetural MVVM. 

![image](https://benoitpasquier.com/images/2018/01/mvvm-pattern.png)

Aonde cada camada da arquitetura tem sua responsabilidade definida. 

**UseCases**

* São formas de consultar dados externos a Scena, seja em API, Banco de dados e etc

**ViewModel**

*\** Única camada com a responsabilidade de conhecer os UseCases. 
* Transforma os Responses recebidos em models, tratando os dados
* Contém as regras de negócio 
* Encaminha os dados para a ViewController

**ViewController**

* Única camada que conhece a View, ViewModel e FlowController. 
* Ela tem como característica ser uma camada de passagens gerenciando o fluxo de informação dentro da scena. 

**View**

* Camada que contém as regras de Layout. 

**Beneficios da arquitetura:**

Como a proposta dessa arquitetura era que cada camada tivesse uma função bem definida. a implementação de testes será facilitada e a manutenção da arquitetura também. 

Uma vez que cada módulo espera apenas um resultado para ser carregado. eu posso por exemplo trocar a forma que a camada de networking faz chamadas HTTPS com o minimo de impacto dentro das viewmodels, posso trocar a persistencia de dados, retornar mocks para fazer testes e etc. Tudo isso com o minimo de esforço.

**Malefícios da arquitetura:**

Como este projeto tem em sua base ao Swininject, que é um container de dependências registrado no inicializador da aplicação, significa que, caso eu precise trocar dentro deste container quem resolve protocolo x ou y eu não irei conseguir sem reiniciar a aplicação. 

## Módulos da Aplicação. 

**App:**

AppDelegate e Info.Plist

**Foundation:**

A Camada de Foudation contem como responsabilidade criar e disponibilizar para a aplicação os recursos básicos para que ela exista. 


**DependencyInjection:**

Com o objetivo de remover o acoplamento de ViewModels dentro das ViewControllers, a camada de Dependency Injecton registra e resolve todas as dependencias de todas as classes da Aplicação. 


**FlowController:**

Similar a um controller de fluxo, a camada de FlowController ela chama e gerencia os fluxos da aplicação. Com a crucial diferença que a FlowController não registra nenhuma ViewController, ela apenas pede para que ela a instancia seja resolvida.


**UIKit:**

Camada de UIKit da Aplicação, onde fica todas os componentes e recursos para criação de Layouts. 

**Scenes:**

Todas as Scenas/Telas da aplicação.

## Debitos Técnicos

**1 -** Implementar a paginação na lista de filmes.

**2 -** Implementar o uso dos parameters entregue pelos Requests à camada de Network.

**3 -** Implementar o Cache de Imagens. 

**4 -** As camadas de network poderiam dividir a função de parsable de objeto, para faciltar o teste da camada. 

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

