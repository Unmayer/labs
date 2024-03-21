import 'dart:io';

class Machine {
  int _coffeeBeans = 200;
  int _milk = 500;
  int _water = 1000;
  double _cash = 0.0;

  int get coffeeBeans => _coffeeBeans;
  set coffeeBeans(int value) => _coffeeBeans = value;

  int get milk => _milk;
  set milk(int value) => _milk = value;

  int get water => _water;
  set water(int value) => _water = value;

  double get cash => _cash;
  set cash(double value) => _cash = value;

  void getResource() {
    print('Ресурсы:');
    print('Кофейные зерна: $coffeeBeans г');
    print('Молоко: $milk мл');
    print('Вода: $water мл');
    print('Деньги в кассе: $cash руб');
  }

  bool isAvailable() {
    return _coffeeBeans >= 50 && _water >= 100;
  }

  void subtractResources() {
    _coffeeBeans -= 50;
    _water -= 100;
  }

  bool makingCoffee() {
    if (isAvailable()) {
      subtractResources();
      _cash += 2.0;
      return true;
    } else {
      return false;
    }
  }

  void setResource() {
    _coffeeBeans += 100;
    _milk += 200;
    _water += 300;
  }
}

void main() {
  Machine coffeeMachine = Machine();
  print('Добро пожаловать!');

  while (true) {
    print('Выберите ваш кофе (1 - эспрессо, 2 - капучино, 3 - латте, 4 - выход, 5 - пополнить ресурсы, 6 - Показать ресурсы):');
    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        if (coffeeMachine.makingCoffee()) {
          print('Ваш эспрессо готов!');
        } else {
          print('Извините, ресурсы закончились.');

          stdout.write('Хотите пополнить ресурсы? (Да - любая клавиша/Нет - enter): ');
          String response = stdin.readLineSync()!.toLowerCase().trim();
          if (response.isNotEmpty) {
            coffeeMachine.setResource();
            print('Ресурсы пополнены!');
          } else {
            print('Ладно');
          }
        }
        break;
      case 4:
        exit(0);
      case 5:
        coffeeMachine.setResource();
      case 6:
        coffeeMachine.getResource();
    }
    
  }
}