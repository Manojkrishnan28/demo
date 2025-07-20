import 'package:flutter/material.dart';

void main() => runApp(StudentApp());

class StudentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student List App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      home: StudentHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Student {
  String name;
  String id;
  String course;

  Student({required this.name, required this.id, required this.course});
}

class StudentHomePage extends StatefulWidget {
  @override
  _StudentHomePageState createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  final List<Student> _students = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _courseController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();

  List<Student> _filteredStudents = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterList);
  }

  void _filterList() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredStudents = _students
          .where((student) =>
              student.name.toLowerCase().contains(query) ||
              student.id.toLowerCase().contains(query) ||
              student.course.toLowerCase().contains(query))
          .toList();
    });
  }

  void _addOrEditStudent({int? index}) {
    String name = _nameController.text.trim();
    String id = _idController.text.trim();
    String course = _courseController.text.trim();

    if (name.isEmpty || id.isEmpty || course.isEmpty) return;

    setState(() {
      if (index == null) {
        _students.add(Student(name: name, id: id, course: course));
      } else {
        _students[index] = Student(name: name, id: id, course: course);
      }
      _filteredStudents = _students;
      _nameController.clear();
      _idController.clear();
      _courseController.clear();
    });
  }

  void _editStudent(int index) {
    final student = _students[index];
    _nameController.text = student.name;
    _idController.text = student.id;
    _courseController.text = student.course;
    _addOrEditStudent(index: index);
  }

  void _deleteStudent(int index) {
    setState(() {
      _students.removeAt(index);
      _filteredStudents = _students;
    });
  }

  @override
  Widget build(BuildContext context) {
    final studentsToShow =
        _searchController.text.isEmpty ? _students : _filteredStudents;

    return Scaffold(
      appBar: AppBar(
        title: Text('Student List App'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Search bar
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search by Name, ID or Course',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 10),

            // Form inputs
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Student Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _idController,
                    decoration: InputDecoration(
                      labelText: 'Student ID',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            TextField(
              controller: _courseController,
              decoration: InputDecoration(
                labelText: 'Course',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            // Add button
            ElevatedButton.icon(
              onPressed: () => _addOrEditStudent(),
              icon: Icon(Icons.add),
              label: Text('Add Student'),
            ),
            SizedBox(height: 10),

            // Student list
            Expanded(
              child: studentsToShow.isEmpty
                  ? Center(child: Text('No students found.'))
                  : ListView.builder(
                      itemCount: studentsToShow.length,
                      itemBuilder: (context, index) {
                        final student = studentsToShow[index];
                        return Card(
                          child: ListTile(
                            title: Text(student.name),
                            subtitle: Text('ID: ${student.id} | Course: ${student.course}'),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit, color: Colors.blue),
                                  onPressed: () {
                                    _nameController.text = student.name;
                                    _idController.text = student.id;
                                    _courseController.text = student.course;
                                    _editStudent(index);
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete, color: Colors.red),
                                  onPressed: () => _deleteStudent(index),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
