class Article{
  final String title,shortDescription,date,img,description;

  Article({this.title, this.shortDescription, this.date, this.img, this.description});
}

List <Article> articles = [
  Article(
    title: "About Sajjad nagori",
    shortDescription: sDes,
    description: sDes,
    date: "10/20/2020",
    img: "assets/images/coverphoto/sazzaddesimage.jpg",
  ),
  Article(
    title: "About Sddik nagori",
    shortDescription: sDes,
    description: sDes,
    date: "10/20/2020",
    img: "assets/images/coverphoto/siddiknagoricover.jpg",
  ),
];

String sDes = "There are only a few people in thisworld in comparison to the vastpopulation of the earth who sleep, eatand drink in remembrance to thealmighty one. Those who do this are";