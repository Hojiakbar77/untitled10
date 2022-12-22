

class Calendar{
  String? number;
  String ? month;

  Calendar(this.number,this.month);
  static List<Calendar> information=[
    Calendar("15",'Sep'),
    Calendar("16",'Sep'),
    Calendar("17",'Sep'),
    Calendar("18",'Sep'),
    Calendar("19",'Sep')

  ];
}
class Foods{
  String ? image;
  String ? name;
  Foods(this.image,this.name);
  static List<Foods>info=[
    Foods('assets/images/menu1.png','Первое'),
    Foods('assets/images/menu1.png','Второй'),
    Foods('assets/images/menu1.png','третьих'),

  ];
}
class Users{
  String ?image;
  String? name;
  String ?assessment;
  String? price;
  String image2;
  Users(this.image,this.name,this.assessment,this.price,this.image2);
  static List<Users>information2=[
    Users('assets/images/food1.jpg','Азиза Каримова','4.5', '12','assets/images/avatar1.png'),
    Users('assets/images/food1.jpg','Татяна Ракитина', '4.5', '10','assets/images/avatar1.png'),
    Users('assets/images/food1.jpg', 'Гулзода Зокирова', '20', '15','assets/images/avatar1.png'),
  ];

}

