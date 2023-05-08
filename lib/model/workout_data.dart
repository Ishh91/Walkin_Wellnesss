class UpperBodyWorkout {
  final String imagePath, name, instruction;

  UpperBodyWorkout(
      {required this.imagePath, required this.name, required this.instruction});
}

final upperBody = [
  [
    UpperBodyWorkout(
      imagePath: "assets/images/workout/chest.png",
      name: "Bench press",
      instruction: "3 sets - 12 repetitions",
    ),
    UpperBodyWorkout(
      imagePath: "assets/images/workout/chest.png",
      name: "Dumbbell press",
      instruction: "4 sets - 12 repetitions",
    ),
    UpperBodyWorkout(
      imagePath: "assets/images/workout/chest.png",
      name: "Dips",
      instruction: "2 sets - 10 repetitions",
    ),
  ],
  [
    UpperBodyWorkout(
      imagePath: "assets/images/workout/back.png",
      name: "Pull ups",
      instruction: "2 sets - 8 repetitions",
    ),
    UpperBodyWorkout(
      imagePath: "assets/images/workout/back.png",
      name: "Deadlift",
      instruction: "2 sets - 5 repetitions",
    ),
    UpperBodyWorkout(
      imagePath: "assets/images/workout/back.png",
      name: "Lat pulldown",
      instruction: "4 sets - 12 repetitions",
    ),
  ],
  [
    UpperBodyWorkout(
      imagePath: "assets/images/workout/chest.png",
      name: "Bench press",
      instruction: "3 sets - 6 repetitions",
    ),
    UpperBodyWorkout(
      imagePath: "assets/images/workout/chest.png",
      name: "Dumbbell press",
      instruction: "4 sets - 6 repetitions",
    ),
    UpperBodyWorkout(
      imagePath: "assets/images/workout/chest.png",
      name: "Dips",
      instruction: "2 sets - 10 repetitions",
    ),
  ],
  [
    UpperBodyWorkout(
      imagePath: "assets/images/workout/biceps.png",
      name: "Bicep curl",
      instruction: "3 sets - 10 repetitions",
    ),
    UpperBodyWorkout(
      imagePath: "assets/images/workout/biceps.png",
      name: "Hammer curl",
      instruction: "3 sets - 12 repetitions",
    ),
    UpperBodyWorkout(
      imagePath: "assets/images/workout/biceps.png",
      name: "Barbell curl",
      instruction: "4 sets - 10 repetitions",
    ),
  ],
];
