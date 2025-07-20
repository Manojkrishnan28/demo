import 'package:flutter/material.dart';

void main() => runApp(StudentApp());

class StudentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: StudentListScreen(),
    );
  }
}

class StudentListScreen extends StatefulWidget {
  @override
  _StudentListScreenState createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  final List<Map<String, String>> _students = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _rollController = TextEditingController();

  void _addStudent() {
    String name = _nameController.text.trim();
    String roll = _rollController.text.trim();
    if (name.isEmpty || roll.isEmpty) return;

    setState(() {
      _students.add({'name': name, 'roll': roll});
    });

    _nameController.clear();
    _rollController.clear();
  }

  void _deleteStudent(int index) {
    setState(() {
      _students.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student List')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Student Name'),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: _rollController,
                  decoration: InputDecoration(labelText: 'Roll Number'),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 12),
                ElevatedButton.icon(
                  onPressed: _addStudent,
                  icon: Icon(Icons.add),
                  label: Text('Add Student'),
                ),
              ],
            ),
          ),
          Expanded(
            child: _students.isEmpty
                ? Center(child: Text('No students added yet!'))
                : ListView.builder(
                    itemCount: _students.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        child: ListTile(
                          title: Text(_students[index]['name'] ?? ''),
                          subtitle: Text('Roll No: ${_students[index]['roll']}'),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _deleteStudent(index),
                          ),
                        ),
                      );
                    },
                  ),
          )
        ],
      ),
    );
  }
}
