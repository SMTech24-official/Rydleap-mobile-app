class SafetyModel {
  final String title,subTitle;

  SafetyModel({required this.title, required this.subTitle});
}


List<SafetyModel>safetyItems=[
  SafetyModel(
    title: "1. Verify Your Ride", 
    subTitle: "Always check the driver’s photo, vehicle make, and license plate before getting in."),
    SafetyModel(
    title: "2. Share your Trip Details", 
    subTitle: "Use the app to share your trip details with a friend or family member."),
    SafetyModel(
    title: "3. Sit in the Back Seat", 
    subTitle: "For sefety and confort, always sit in the back seat."),
    SafetyModel(
    title: "4. Trust Your Instincts", 
    subTitle: "If something doesn’t feel right, trust your instincts and exit the vehicle."),
    SafetyModel(
    title: "5. Keep Personal Information Private", 
    subTitle: "Don’t share personal information with the driver."),
];