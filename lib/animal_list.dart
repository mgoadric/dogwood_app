import 'animal.dart';

class AnimalListController {
  final List<Animal> animals = [Animal(name: "Dog")];

  void addAnimal(String name) {
    animals.add(Animal(name: name));
  }

  void removeAnimal(Animal animal) { //not implemented yet
    animals.remove(animal);
  }
}