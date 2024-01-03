final reviewsList = [
  Review(
    image: "images/review1.png",
    title: "Product",
    subtitle:
        "Add a Review For a tangible or not tangible \n Product you experienced it",
  ),
  Review(
    image: "images/review2.png",
    title: "Place",
    subtitle:
        "Add a Review For a Place that Served  \n you, a Tourist place or any other place",
  ),
];

class Review {
  final String image;

  final String title;

  final String subtitle;

  Review({required this.image, required this.title, required this.subtitle});
}
