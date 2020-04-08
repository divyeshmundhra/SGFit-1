
import 'package:flutter/material.dart';
import 'package:sgfit/view/containers.dart';

class ContainerClass extends StatefulWidget {
  ContainerClass({Key key, this.title}) : super(key: key);
  final String title;

  @override
  ContainerClassState createState() => ContainerClassState();
}

class ContainerClassState extends State<ContainerClass> {

  @override
  Widget build(BuildContext context) {

  }

  Widget popupBodyContainer(BuildContext context) {
    return Container(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(children: <Widget>[
                Containers.container1(context),
                Containers.container2(context),
              ]),
              Row(children: <Widget>[
                Containers.container3(context),
                Containers.container4(context),
              ]),
              Row(children: <Widget>[
                Containers.container5(context),
                Containers.container6(context),
              ]),
            ],
          ),
        ),
      ),
    );
  }



}