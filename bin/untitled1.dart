// Call the main method
void main() {
  StudentManagementSystem.main();
}

// Interface: Role
abstract class Role {
  void displayRole();
}

// Base Class: Person
class Person implements Role {
  String name;
  int age;
  String address;
  Role? role;

  Person(this.name, this.age, this.address);

  // Getter methods
  String get getName => name;
  int get getAge => age;
  String get getAddress => address;

  @override
  void displayRole() {
    print('Role: Undefined');
  }
}

// Student Class
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
    print('Role: Student');
  }

  double calculateAverageScore() {
    if (courseScores.isEmpty) return 0.0;
    double sum = courseScores.reduce((a, b) => a + b);
    return double.parse((sum / courseScores.length).toStringAsFixed(1));
  }

  void displayStudentInfo() {
    print('Student Information:');
    displayRole();
    print('Name: $name');
    print('Age: $age');
    print('Address: $address');
    print('Average Score: ${calculateAverageScore()}');
    print('');
  }
}

// Teacher Class
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
    print('Role: Teacher');
  }

  void displayCoursesTaught() {
    print('Courses Taught:');
    for (var course in coursesTaught) {
      print('- $course');
    }
  }

  void displayTeacherInfo() {
    print('Teacher Information:');
    displayRole();
    print('Name: $name');
    print('Age: $age');
    print('Address: $address');
    displayCoursesTaught();
    print('');
  }
}

// Main Class: StudentManagementSystem
class StudentManagementSystem {
  static void main() {
    // Creating a Student instance
    Student student = Student('John Doe', 20, '123 Main St', 'S001', 'A', [
      90,
      85,
      92,
    ]);

    // Creating a Teacher instance
    Teacher teacher = Teacher('Mrs. Smith', 35, '456 Oak St', 'T001', [
      'Math',
      'English',
      'Bangla',
    ]);

    // Display Information
    student.displayStudentInfo();
    teacher.displayTeacherInfo();
  }
}
