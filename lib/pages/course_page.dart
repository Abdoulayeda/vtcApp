import 'package:flutter/material.dart';
import 'package:vtc/models/course_model.dart';

class CoursePage extends StatelessWidget {
  final Course course;
  const CoursePage({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: Colors.yellow,
        title: Text(
          "Course: ${course.numeroDeLaCourse}",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 28,
          ),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(
          children: [
            Center(
              child: Text(
                "Détail de la course: ${course.numeroDeLaCourse}",
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 18),
            Center(
              child: Text(
                "Client: ${course.client}",
                style: const TextStyle(fontSize: 25),
              ),
            ),
            const SizedBox(height: 18),
            Container(
              height: 455,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.yellow.shade100.withOpacity(0.5),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.car_crash,
                            color: Colors.black,
                          ),
                          SizedBox(width: 15),
                          Text(
                            "Vehicule",
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        course.vehicule,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.lock_clock,
                            color: Colors.black,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Heure de départ",
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        course.heureDepart,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.punch_clock,
                            color: Colors.black,
                          ),
                          SizedBox(width: 15),
                          Text(
                            "Heure d'arrivé",
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        course.heureArrive,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.map,
                            color: Colors.black,
                          ),
                          SizedBox(width: 15),
                          Text(
                            "Lieu de départ",
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        course.lieuDepart,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.maps_home_work,
                            color: Colors.black,
                          ),
                          SizedBox(width: 15),
                          Text(
                            "Lieu d'arrivé",
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        course.lieuArrive,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.group,
                            color: Colors.black,
                          ),
                          SizedBox(width: 15),
                          Text(
                            "Nombre de passagers",
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        course.nombreDePassagers.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.badge,
                            color: Colors.black,
                          ),
                          SizedBox(width: 15),
                          Text(
                            "Nombre de bagages",
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        course.nombreDeBagage.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
