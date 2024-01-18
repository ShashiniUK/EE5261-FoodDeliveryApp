class UnboardingContent{
  String image;
  String title;
  String description;
  UnboardingContent({required this.description,required this.image, required this.title,});
}

List<UnboardingContent> contents=[
  UnboardingContent(
      description: 'pick your food from our menu\n    more than 35 times',
      image: "images/screen1.png",
      title: 'select from Our\n    Best Menu',),
  UnboardingContent(
      description: 'You can pay cash on delivery and\n    card payment is available,',
      image: "images/screen2.png",
      title: 'Easy and online payment'),
  UnboardingContent(
      description: 'Deliver you food at your\n   Doorstep,',
      image: "images/screen3.png",
      title: 'Quick Delivery at your Doorstep'),

];