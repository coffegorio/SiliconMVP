# Silicon MVP

Проект для создания презентаций с использованием архитектуры MVP.

## Структура MVP в проекте

### Model

- Содержит бизнес-логику и работу с данными
- Не зависит от View и Presenter
- Примеры:
  - `UserModel.swift` - модель пользователя и сервис для работы с ней
  - `LoginValidation.swift` - валидация форм

### View

- Отвечает за отображение UI
- Передает события пользователя в Presenter
- Получает команды на обновление UI от Presenter
- Примеры:
  - `GreetingsView.swift` - контроллер для экрана приветствия
  - `LoginView.swift` - контроллер для экрана входа

### Presenter

- Содержит логику взаимодействия между View и Model
- Управляет View через протокол
- Обрабатывает события от пользователя
- Примеры:
  - `GreetingsViewPresenter.swift` - презентер экрана приветствия
  - `LoginPresenter.swift` - презентер экрана входа с валидацией форм

## Взаимодействие компонентов

1. View передает события пользователя (нажатие кнопок, ввод текста) в Presenter
2. Presenter обрабатывает события, взаимодействует с Model
3. Presenter отправляет команды View для обновления UI
4. View обновляет UI, но не содержит бизнес-логики

## Примеры взаимодействия

### Нажатие кнопки:
```swift
// View - передача события в Presenter
CustomButtonView(title: "Начать", isFill: true) {
    presenter?.onStartButtonTapped()
}

// Presenter - обработка события
func onStartButtonTapped() {
    let _ = userService.createAnonymousUser()
    view?.navigateToMain()
}
```

### Валидация формы:
```swift
// View - передача данных в Presenter
CustomButtonView(title: "Войти", isFill: true) {
    presenter?.validateAndLogin(email: email, password: password)
}

// Presenter - валидация и обработка
func validateAndLogin(email: String, password: String) {
    // Валидация через Model
    let emailResult = validator.validateEmail(email)
    switch emailResult {
    case .failure(let error):
        view?.showEmailError(error.message)
        return
    case .success:
        // Продолжение логики...
    }
}
``` 