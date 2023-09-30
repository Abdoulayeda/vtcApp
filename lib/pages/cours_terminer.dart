import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vtc/models/course_model.dart';
import 'package:vtc/pages/course_page.dart';
import '../data/data.dart' as data;

class CoursTerminer extends StatefulWidget {
  const CoursTerminer({super.key});

  @override
  State<CoursTerminer> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursTerminer> {
  List<Course> courses = data.courses;
  List<Course> courseTermine = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    courseTermine =
        courses.where((course) => course.status == "terminé").toList();
  }

  List<Course> filteredCourses = [];
  void filterCourses(String query) {
    setState(() {
      if (query.isNotEmpty) {
        filteredCourses = courseTermine
            .where((course) =>
                course.numeroDeLaCourse.contains(query) ||
                course.client.toLowerCase().contains(query.toLowerCase()))
            .toList();
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
          'Courses Terminés',
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
                  "5 courses terminés.",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 30,
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
                  color: Colors.green.shade100.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    focusColor: Colors.transparent,
                    hintText: "Entrer le numéro de la course ou le client",
                    border: InputBorder.none,
                    prefixIcon: const Icon(Icons.search),
                    prefixIconColor: Colors.green,
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
                    ? courseTermine.length
                    : filteredCourses.length,
                itemBuilder: (context, index) {
                  var course = filteredCourses.isEmpty
                      ? courseTermine[index]
                      : filteredCourses[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
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
                                'Date: ${course.date}',
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
