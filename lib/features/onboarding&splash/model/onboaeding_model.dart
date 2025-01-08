class OnboaedingModel {
  final String image;
  final String title;
  final String description;

  OnboaedingModel({
    required this.image,
    required this.title,
    required this.description,
  });

  static List<OnboaedingModel> onBoardingObjects = [
    OnboaedingModel(
        image: "assets/images/on2.jpeg",
        title: "More Quotes Offers & Outstanding Service",
        description:
            "SUPPLIER is a maeketplace app that bridges the gap between Buyers and Sellers in Printing , Packaging and advertising industry"),
    OnboaedingModel(
        image: "assets/images/on3.jpeg",
        title: "Quote Requests & Comparison",
        description:
            "Buyers Can submit detailed requests for spacific Services like packaging , designing and large format printing, Sellers respond with qutes What is easier than that !"),
    OnboaedingModel(
        image: "assets/images/onBoarding.jpeg",
        title: "Categories & Quality",
        description:
            "Our app offers a wide range of Categories such Digital Printing , offset printing , Packaging and more than that, We guarantee quality and efficient execution"),
  ];
}
