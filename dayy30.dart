class Equipment {
  final String name;
  bool _available = true;

  Equipment(this.name);

  bool get isAvailable => _available;

  void borrow() {
    _available = false;
  }

  void giveBack() {
    _available = true;
  }
}

class Student {
  final String name;
  final List<Equipment> _borrowed = [];

  Student(this.name);

  bool borrowItem(Equipment item) {
    if (!item.isAvailable) {
      return false;
    }

    item.borrow();
    _borrowed.add(item);
    return true;
  }

  void returnItem(Equipment item) {
    if (_borrowed.remove(item)) {
      item.giveBack();
    }
  }

  void printBorrowed() {
    for (var item in _borrowed) {
      print(item.name);
    }
  }
}

class Lab {
  final List<Equipment> _items = [];

  void addItem(String name) {
    _items.add(Equipment(name));
  }

  Equipment? findItem(String name) {
    for (var item in _items) {
      if (item.name == name) {
        return item;
      }
    }
    return null;
  }

  void printAvailableItems() {
    for (var item in _items) {
      if (item.isAvailable) {
        print(item.name);
      }
    }
  }
}

void main() {
  Lab lab = Lab();

  lab.addItem("Microscope");
  lab.addItem("Test Tube");
  lab.addItem("Bunsen Burner");

  Student s1 = Student("Kofi");

  Equipment? item = lab.findItem("Microscope");

  if (item != null && s1.borrowItem(item)) {
    print("Item borrowed");
  }

  s1.printBorrowed();
  lab.printAvailableItems();

  s1.returnItem(item!);

  lab.printAvailableItems();
}