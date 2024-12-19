main() {
  //Creating a library:
  final library = Library();

  //Adding some users:
  library.addUser(user: Users(id: 'u1', name: "Karim Adel"));
  library.addUser(user: Users(id: 'u2', name: "Omar Ahmed"));
  library.addUser(user: Users(id: 'u3', name: "Ola Yasser"));
  library.addUser(user: Users(id: 'u4', name: "Sameh Morad"));

  //Adding some books:
  library.addBook(book: Books(id: 'b1', title: "Bedtime stories"));
  library.addBook(book: Books(id: 'b2', title: "The power of youth"));
  library.addBook(book: Books(id: 'b3', title: "World war 2"));
  library.addBook(book: Books(id: 'b4', title: "Bedtime stories"));
  library.addBook(
      book: Books(id: 'b5', title: "Fundamentals of promlem solving"));
  library.addBook(book: Books(id: 'b6', title: "Nature and science"));

  //Some Operations:
  library.borrowBook(userID: 'u1', bookID: 'b1');
  library.borrowBook(userID: 'u2', bookID: 'b3');
  library.returnBook(bookID: 'b1');
  library.borrowBook(userID: 'u4', bookID: 'b2');

  //Printing l;ibrary info:
  library.displayInfo();
}

class Books {
  String id;
  String title;
  bool borrowed;

  Books({required this.id, required this.title, this.borrowed = false});

  displayInfo() {
    print(
        "Book ID: $id, Book Title: $title, Book State: ${borrowed ? 'borrowed' : 'existed'}");
  }
}

class Users {
  String id;
  String name;

  Users({required this.id, required this.name});

  displayInfo() {
    print("User ID: $id, User name: $name");
  }
}

class Library {
  List<Users> usersList = [];
  List<Books> booksList = [];

  addBook({required Books book}) {
    booksList.add(book);
    print("Book with ID: ${book.id} and title: ${book.title} has been added.");
  }

  addUser({required Users user}) {
    usersList.add(user);
    print("User with ID: ${user.id} and name: ${user.name} has been added.");
  }

  borrowBook({required String userID, required String bookID}) {
    booksList.firstWhere((book) => book.id == bookID).borrowed = true;
    print("Book with ID: $bookID has been borrowed.");
  }

  returnBook({required String bookID}) {
    booksList.firstWhere((book) => book.id == bookID).borrowed = false;
    print("Book with ID: $bookID has been returned.");
  }

  displayInfo() {
    print(
        "Users in library: ${usersList.length}, Books In library: ${booksList.length}, Out books (borrowed): ${booksList.where((book) => book.borrowed == true).length}");
  }
}
