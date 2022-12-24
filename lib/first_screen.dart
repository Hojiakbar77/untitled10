import 'package:flutter/material.dart';
import 'package:untitled10/utils/const.dart';


class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  Widget get  calendarData => Column(children: const [
        Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              '28',
              style: TextStyle(color: colorWhite),
            )),
        SizedBox(height: 2),
        Text('Sep', style: TextStyle(color: colorWhite))
      ]);

Widget get calendarDesign => Container(
    decoration: BoxDecoration(
        color: colorOrange, borderRadius: BorderRadius.circular(12)),
    width: MediaQuery.of(context).size.width / 6.5,
    height: MediaQuery.of(context).size.height / 10,
    child: calendarData
);


  Widget get builtCalendar {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child:calendarDesign );
  }


  Widget get builtInfoMenu  => Row(children: [
        Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Image.asset('assets/images/menu1.png')),
        const SizedBox(
          width: 2
        ),
        const Text(
          'Первое',
          style: TextStyle(color: colorWhite),
        )
      ]);
  Widget get builtMenuDesign =>Container(
      decoration: BoxDecoration(
          color: colorGrey, borderRadius: BorderRadius.circular(12)),
      width: MediaQuery.of(context).size.width / 4,
      child: builtInfoMenu
  );


  Widget get builtMenu {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: builtMenuDesign);
  }

  Widget get photoFood => ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.asset(
        'assets/images/food1.jpg',
        width: MediaQuery.of(context).size.width / 0.5,
        height: MediaQuery.of(context).size.height / 4.1,
        fit: BoxFit.fitWidth
      ));

  Widget get chefName => const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text('Азиза Каримова', style: firstNameStyle));



  Widget get  assessmentDetail => Row(children: const [
        Padding(
            padding: EdgeInsets.only(left: 4),
            child: Icon(
              Icons.star,
              color: colorOrange
            )),
        SizedBox(
          width: 2
        ),
        Text('4.5')
      ]);

  Widget get assessment => Padding(
      padding: const EdgeInsets.only(
        left: 4
      ),
      child: Container(
          width: MediaQuery.of(context).size.width / 6.5,
          height: MediaQuery.of(context).size.height / 25,
          decoration: BoxDecoration(
              color: colorGrey, borderRadius: BorderRadius.circular(12)),
          child: assessmentDetail ));


  Widget get deliveryDetail => Row(children: const [
        Padding(
            padding: EdgeInsets.only(left: 4),
            child: Icon(
              Icons.local_taxi,
              color: colorBlack
            )),
        SizedBox(
          width: 2.5
        ),
        Text(
          '12 000 сум',
          style: secondNameStyle
        ),
        SizedBox(
          width: 1.5
        )
      ]);


  Widget get delivery => Padding(
      padding: const EdgeInsets.only(
        left: 10
      ),
      child: Container(
          width: MediaQuery.of(context).size.width / 3.7,
          height: MediaQuery.of(context).size.height / 25,
          decoration: BoxDecoration(
              color: colorGrey, borderRadius: BorderRadius.circular(12)),
          child: deliveryDetail));

  Widget get services => Row(children: [assessment, delivery]);



  Widget builtFoodDetail() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [photoFood, chefName, services ]);


  Widget builtInfoFood() => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: MediaQuery.of(context).size.width / 1.1,
          height: MediaQuery.of(context).size.height / 2.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: colorWhite,
          ),
          child: builtFoodDetail()));

  Widget builtAvatar() => Positioned.fill(
      right: 25,
      top: 90,
      child: Align(
          alignment: Alignment.centerRight,
          child: CircleAvatar(
            maxRadius: MediaQuery.of(context).size.width -
                MediaQuery.of(context).size.width +
                50,
            backgroundImage: const AssetImage('assets/images/avatar1.png'),
          )));


  Widget get builtFood => Stack(alignment: Alignment.center, children: [
        builtInfoFood(),
        builtAvatar(),
      ]);




  Widget get calendar  => SizedBox(
      height: MediaQuery.of(context).size.height / 8.9,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) => builtCalendar));

  Widget get menu => SizedBox(
      height: MediaQuery.of(context).size.height / 16,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (context, index) => builtMenu));

  Widget get food => Flexible(
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (context, index) => builtFood));


  Widget get appbarDetail=>  const Center(
      child: Text(
        'Домашняя еда',
        style: firstNameStyle,
      )
  );

  Widget get view => SingleChildScrollView(
      child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            calendar,
            menu,
            food
          ]
      )
  );

  PreferredSizeWidget get appBar {
    return AppBar(
      title: appbarDetail,
      backgroundColor: colorWhite,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        body: view
    );
  }
}
