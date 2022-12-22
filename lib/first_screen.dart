import 'package:flutter/material.dart';
import 'package:untitled10/utils/const.dart';
import 'data/users_info.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  Widget builtCalendar(Calendar info) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: BoxDecoration(
                color: colorOrange, borderRadius: BorderRadius.circular(12)),
            width: MediaQuery.of(context).size.width / 6.5,
            height: MediaQuery.of(context).size.height / 10,
            child: Column(children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    info.number!,
                    style: const TextStyle(color: colorWhite),
                  )),
              const SizedBox(height: 2),
              Text(info.month!, style: const TextStyle(color: colorWhite))
            ])));
  }

  Widget builtMenu(Foods info) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: BoxDecoration(
                color: colorGrey, borderRadius: BorderRadius.circular(12)),
            width: MediaQuery.of(context).size.width / 4,
            child: Row(children: [
              Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Image.asset(info.image!)),
              const SizedBox(
                width: 2,
              ),
              Text(
                info.name!,
                style: const TextStyle(color: colorWhite),
              )
            ])));
  }

  Widget builtFood(Users info) {
    return Stack(alignment: Alignment.center, children: [
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              width: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.height / 2.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: colorWhite,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          info.image!,
                          width: MediaQuery.of(context).size.width / 0.5,
                          height: MediaQuery.of(context).size.height / 4.1,
                          fit: BoxFit.fitWidth,
                        )),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(info.name!, style: firstNameStyle)),
                    Row(children: [
                      Padding(
                          padding: const EdgeInsets.only(
                            left: 4,
                          ),
                          child: Container(
                              width: MediaQuery.of(context).size.width / 6.5,
                              height: MediaQuery.of(context).size.height / 25,
                              decoration: BoxDecoration(
                                  color: colorGrey,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Row(children: [
                                const Padding(
                                    padding: EdgeInsets.only(left: 4),
                                    child: Icon(
                                      Icons.star,
                                      color: colorOrange,
                                    )),
                                const SizedBox(
                                  width: 2,
                                ),
                                Text(info.assessment!)
                              ]))),
                      Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                          ),
                          child: Container(
                              width: MediaQuery.of(context).size.width / 3.7,
                              height: MediaQuery.of(context).size.height / 25,
                              decoration: BoxDecoration(
                                  color: colorGrey,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Row(children: [
                                const Padding(
                                    padding: EdgeInsets.only(left: 4),
                                    child: Icon(
                                      Icons.local_taxi,
                                      color: colorBlack,
                                    )),
                                const SizedBox(
                                  width: 2.5,
                                ),
                                Text(
                                  '${info.price!} 000 сум',
                                  style: secondNameStyle,
                                ),
                                const SizedBox(
                                  width: 1.5,
                                )
                              ])))
                    ])
                  ]))),
      Positioned.fill(
          right: 25,
          top: 90,
          child: Align(
              alignment: Alignment.centerRight,
              child: CircleAvatar(
                maxRadius: MediaQuery.of(context).size.width -
                    MediaQuery.of(context).size.width +
                    50,
                backgroundImage: AssetImage(info.image2),
              )))
    ]);
  }

  Widget view() {
    return SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
      SizedBox(
          height: MediaQuery.of(context).size.height / 8.9,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: Calendar.information.length,
              itemBuilder: (context, index) {
                return builtCalendar(
                  Calendar.information[index],
                );
              })),
      SizedBox(
          height: MediaQuery.of(context).size.height / 16,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: Foods.info.length,
              itemBuilder: (context, index) {
                return builtMenu(
                  Foods.info[index],
                );
              })),
      Flexible(
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: Users.information2.length,
              itemBuilder: (context, index) {
                return builtFood(
                  Users.information2[index],
                );
              }))
    ]));
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      title: const Center(
          child: Text(
        'Домашняя еда',
        style: firstNameStyle,
      )),
      backgroundColor: colorWhite,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        body: view());
  }
}
