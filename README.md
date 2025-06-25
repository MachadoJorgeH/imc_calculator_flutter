# Calculadora de IMC em Flutter 📱

Projeto desenvolvido como parte do meu aprendizado em Flutter, com o objetivo de criar uma calculadora de Índice de Massa Corporal (IMC) funcional e com uma interface amigável.

## ✨ Visão Geral do App

Este aplicativo permite que os usuários insiram seu peso e altura para calcular o IMC. O resultado é exibido juntamente com a classificação da OMS (Organização Mundial da Saúde), ajudando o usuário a entender seu estado físico atual.


![GIF do App](assets/imc_calculator.mp4)

---

## 🚀 Funcionalidades

- [x] Cálculo do IMC baseado em peso (kg) e altura (cm).
- [x] Exibição da classificação do IMC (Abaixo do Peso, Peso Ideal, etc.).
- [x] Interface limpa e intuitiva.
- [x] **Validação de formulário** para evitar cálculos com campos vazios.
- [x] Botão para **resetar** os campos e o resultado.

---

## 🛠️ Conceitos e Tecnologias Aplicadas

Este projeto foi fundamental para solidificar os seguintes conceitos do ecossistema Flutter/Dart:

- **Gerenciamento de Estado Básico:** Uso de `StatefulWidget` e da função `setState` para atualizar a interface de forma reativa.
- **Estrutura de UI e Layouts:** Construção de interfaces com widgets fundamentais como `Scaffold`, `AppBar`, `Column`, `Icon`, `TextField` e `ElevatedButton`.
- **Captura de Input do Usuário:** Utilização de `TextEditingController` para ler os dados inseridos nos campos de texto.
- **Validação de Formulários:** Implementação de um `GlobalKey<FormState>` associado a um `Form` e o uso de `TextFormField` com a propriedade `validator` para garantir a integridade dos dados.
- **Boas Práticas de Código:** Organização da lógica em funções separadas (`_calculate`, `_resetFields`) para maior clareza e manutenibilidade.

---

## ⚙️ Como Executar o Projeto

```bash
# Clone este repositório
$ git clone [https://github.com/MachadoJorgeH/imc_calculator_flutter](https://github.com/MachadoJorgeH/imc_calculator_flutter)

# Acesse a pasta do projeto
$ cd calculadora_imc_flutter

# Instale as dependências
$ flutter pub get

# Execute o aplicativo
$ flutter run
```
