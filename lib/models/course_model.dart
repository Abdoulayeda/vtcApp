class Course {
  final String client;
  final String numeroDeLaCourse;
  final String vehicule;
  final String heureDepart;
  final String heureArrive;
  final String lieuDepart;
  final String lieuArrive;
  final int nombreDeBagage;
  final int nombreDePassagers;
  final String date;
  final String status;

  Course({
    required this.status,
    required this.date,
    required this.client,
    required this.numeroDeLaCourse,
    required this.vehicule,
    required this.heureDepart,
    required this.heureArrive,
    required this.lieuDepart,
    required this.lieuArrive,
    required this.nombreDeBagage,
    required this.nombreDePassagers,
  });
}
