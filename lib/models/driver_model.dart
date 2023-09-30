import 'package:vtc/models/course_model.dart';

class Driver {
  final String id;
  final String name;
  final String email;
  List<Course> courses;

  Driver({
    required this.id,
    required this.name,
    required this.email,
    required this.courses,
  });
}
