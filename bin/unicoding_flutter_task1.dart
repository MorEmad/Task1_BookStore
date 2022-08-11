// ignore_for_file: non_constant_identifier_names

import 'dart:io';

int? book_sequence;
List<Book> booksList = [];

class Book {
  String _name = "";
  String _author = "";
  String _rate = "";

  get_name() {
    return _name;
  }

  get_author() {
    return _author;
  }

  get_rate() {
    return _rate;
  }

  set_name() {
    String name = stdin.readLineSync()!;
    _name = name;
  }

  set_author() {
    String author = stdin.readLineSync()!;
    _author = author;
  }

  set_rate() {
    String rate = stdin.readLineSync()!;
    _rate = rate;
  }
}

add_book() {
  print("Enter the count of books want to add:");
  try {
    String count = stdin.readLineSync()!;
    int i = int.parse(count);
    int len = i;
    for (i; i > 0; i--) {
      Book book = Book();
      print("Enter book ${len - i + 1} name:");
      book.set_name();

      print("Enter book ${len - i + 1} auther:");
      book.set_author();

      print("Enter book ${len - i + 1} rate:");
      book.set_rate();
      booksList.add(book);
    }
    print("done!");
  } catch (e) {
    print("wrong value! try again with correct number.");
  }
}

display_all_books() {
  if (booksList.isNotEmpty) {
    print("Book name\t\tBook author\t\t rate");

    for (int i = 0; i < booksList.length; i++) {
      print(
          '${booksList[i].get_name()}\t\t${booksList[i].get_author()}\t\t${booksList[i].get_rate()}');
    }
  } else {
    print("There is no Books!");
  }
}

display_up4rate_books() {
  if (check_rate_book()) {
    print("Book name\t\tBook author\t\t rate");

    for (int i = 0; i < booksList.length; i++) {
      print(
          '${booksList[i].get_name()}\t\t${booksList[i].get_author()}\t\t${booksList[i].get_rate()}');
    }
  } else {
    print("There is no Books!");
  }
}

check_rate_book() {
  if (booksList.isNotEmpty) {
    for (int i = 0; i < booksList.length; i++) {
      if (double.parse(booksList[i].get_rate()) >= 4) {
        return true;
      } else {
        return false;
      }
    }
  } else {
    return false;
  }
}

del_book() {
  if (booksList.isNotEmpty) {
    print("Enter the book name: ");
    String name = stdin.readLineSync()!;
    for (int i = 0; i < booksList.length; i++) {
      if (name == booksList[i].get_name()) {
        booksList.remove(booksList[i]);
        print("book has been deleted");
      } else {
        print("thear are no book in this name!");
      }
    }
  } else
    print("sorry! you don't have any books");
}

uodate_book() {
  if (booksList.isNotEmpty) {
    print("Enter the book name: ");
    String name = stdin.readLineSync()!;
    for (int i = 0; i < booksList.length; i++) {
      if (name == booksList[i].get_name()) {
        Book book = Book();
        print("Enter book name:");
        book.set_name();

        print("Enter book auther:");
        book.set_author();

        print("Enter book rate:");
        book.set_rate();

        booksList[i] = book;
        print("book has been updated");
      } else {
        print("thear are no book in this name!");
      }
    }
  } else
    print("sorry! you don't have any books");
}

search_book() {
  print("Enter a query: ");
  String name = stdin.readLineSync()!;
  if (search(name)) {
    for (int i = 0; i < booksList.length; i++) {
      if (name == booksList[i].get_name()) {
        print("Book name\t\tBook author\t\t rate");
        print(
            '${booksList[i].get_name()}\t\t${booksList[i].get_author()}\t\t${booksList[i].get_author()}');
      }
    }
  } else {
    print("thear are no book in this name!");
  }
}

search(name) {
  if (booksList.isNotEmpty) {
    for (int i = 0; i < booksList.length; i++) {
      if (name == booksList[i].get_name()) {
        return true;
      } else {
        return false;
      }
    }
  } else {
    return false;
  }
}

main_menu() {
  print('''Main menu
      1- Display all books
      2- Display books with rate +4.
      3- Add book
      4- Update book
      5- Delete book
      6- Search
      Write your choice:''');
  String? MenuSelct = stdin.readLineSync();
  switch (MenuSelct) {
    case "1":
      display_all_books();
      break;
    case "2":
      display_up4rate_books();
      break;
    case "3":
      add_book();
      break;
    case "4":
      uodate_book();
      break;
    case "5":
      del_book();
      break;
    case "6":
      search_book();
      break;
    default:
      print("Wrong input! try again with correct chose");
  }
}

void main(List<String> arguments) {
  main_menu();
}
