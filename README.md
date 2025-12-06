# MuscleMate
Aplicativo de gerenciamento de treinos em SwiftUI, com calendário semanal, cadastro de treinos, exercícios e sets, e persistência local usando JSON.

## Principais funcionalidades
* `HomeView`: Lista de treinos filtrada por data.
* `AddWorkoutView`: Modal para criar novo treino.
* `AddExerciseView`: Modal para adicionar exercício.
* `AddSetModalView`: Modal para adicionar sets.
* `WorkoutDetailView`: Lista detalhada com os exercícios do treino.

### `HomeView`
* Calendário horizontal
* Seleção de dia
* Lista de treinos do dia
* Botão de adicionar treino

### WorkoutDetailView
* DisclosureGroup com controle de expansão único
* Adição de sets e exercícios
* Exclusão de sets possível (menos o botão de adicionar)

### AddWorkoutView
* Modal para criar treino
* Validação: nome vazio → "Novo Treino"
* Adição de exercícios via modal

### AddExerciseView
* Modal para adicionar exercício
* Reutiliza AddSetModalView para adicionar sets

### AddSetModalView
* Modal reutilizável para qualquer Exercise
* Adiciona sets com Stepper
* Fechamento automático após adicionar

### AppIntent


## Screenshots

## Observações

## Próximos passos
* Filtragem por semana ou mês
* Gráficos de progresso
* App Intents com mais funcionalidades (adicionar exercícios aos treinos)
* Testes unitários

### Autor
Carolina Ortega
