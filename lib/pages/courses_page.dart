import 'package:flutter/material.dart';
import 'package:vtc/models/course_model.dart';
import 'package:vtc/pages/course_page.dart';
import '../data/data.dart' as data;

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  List<Course> courseEntente = [];
  TextEditingController searchController = TextEditingController();
  final List<Course> courses = data.courses;

  @override
  void initState() {
    super.initState();
    courseEntente =
        courses.where((course) => course.status == "en_attente").toList();
  }

  /*  List<Course> filteredCourses = [...courseEntente];

  void filterCourses(String query) {
    setState(() {
      if (query.isNotEmpty) {
        filteredCourses = data.courses
            .where((course) =>
                course.numeroDeLaCourse.contains(query) ||
                course.client.toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else {
        filteredCourses = data.courses;
      }
    });
  } */

  List<Course> filteredCourses = [];
  void filterCourses(String query) {
    setState(() {
      if (query.isNotEmpty) {
        filteredCourses = courseEntente
            .where((course) =>
                course.numeroDeLaCourse.contains(query) ||
                course.client.toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else {
        filteredCourses = courses;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: Colors.yellow,
        title: const Text(
          'Courses en attente',
          style: TextStyle(color: Colors.black, fontSize: 28),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 2,
                color: Colors.white,
              ),
              color: Colors.white,
            ),
            child: Image.asset(
              "assets/user.png",
              width: 60,
              height: 60,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: [
          Column(
            children: [
              const Center(
                child: Text(
                  "Vous avez 10 courses en attente.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.yellow.shade100.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    focusColor: Colors.transparent,
                    hintText: "Entrer le numéro de la course ou le client",
                    border: InputBorder.none,
                    prefixIcon: const Icon(Icons.search),
                    prefixIconColor: Colors.yellow,
                    suffixIconColor: Colors.black,
                    suffixIcon: IconButton(
                      onPressed: () {
                        searchController.clear();
                      },
                      icon: const Icon(Icons.clear),
                    ),
                  ),
                  onChanged: (value) {
                    filterCourses(value);
                  },
                ),
              ),
              const SizedBox(height: 15),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: filteredCourses.isEmpty
                    ? courseEntente.length
                    : filteredCourses.length,
                itemBuilder: (context, index) {
                  var course = filteredCourses.isEmpty
                      ? courseEntente[index]
                      : filteredCourses[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.yellow.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CoursePage(course: course),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.car_crash,
                                color: Colors.black,
                              ),
                              Icon(
                                Icons.lock_clock,
                                size: 30,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Course: ${course.numeroDeLaCourse}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'Départ: ${course.heureDepart}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
