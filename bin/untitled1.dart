// Role interface
abstract class Role {
  void displayRole();
}

// Person class
class Person implements Role {
  String name;
  int age;
  String address;
  Role? role;

  Person(this.name, this.age, this.address);

  String getName() => name;
  int getAge() => age;
  String getAddress() => address;

  @override
  void displayRole() {
    print("Role: Undefined");
  }
}

// Student class extending Person
class Student extends Person {
  String studentID;
  String grade;
  List<double> courseScores;

  Student(
      String name,
      int age,
      String address,
      this.studentID,
      this.grade,
      this.courseScores,
      ) : super(name, age, address);

  @override
  void displayRole() {
    print("Role: Student");
  }

  double calculateAverageScore() {
    if (courseScores.isEmpty) return 0.0;
    double total = courseScores.reduce((a, b) => a + b);
    return total / courseScores.length;
  }
}

// Teacher class extending Person
class Teacher extends Person {
  String teacherID;
  List<String> coursesTaught;

  Teacher(
      String name,
      int age,
      String address,
      this.teacherID,
      this.coursesTaught,
      ) : super(name, age, address);

  @override
  void displayRole() {
    print("Role: Teacher");
  }

  void displayCoursesTaught() {
    print("Courses Taught:");
    for (var course in coursesTaught) {
      print("- $course");
    }
  }
}

// Example usage
void main() {
  Student student = Student(
    "Alice",
    20,
    "123 Main St",
    "S123",
    "A",
    [85.5, 90.0, 78.5],
  );
  student.displayRole();
  print("Average Score: ${student.calculateAverageScore()}");

  Teacher teacher = Teacher(
    "Mr. Smith",
    45,
    "456 Elm St",
    "T456",
    ["Math", "Physics", "Chemistry"],
  );
  teacher.displayRole();
  teacher.displayCoursesTaught();
}