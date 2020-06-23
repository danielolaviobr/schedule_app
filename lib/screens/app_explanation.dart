import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:schedule_app/constants.dart';

class AppExplanation extends StatelessWidget {
  final _controler = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: PageView.builder(
          itemCount: 3,
          controller: _controler,
          itemBuilder: (context, index) => Cards(index, _controler),
        ),
      ),
    );
  }
}

class Cards extends StatelessWidget {
  final int index;
  final PageController controller;
  Cards(this.index, this.controller);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 400,
            width: 400,
            child: SvgPicture.asset(kSvgCards[this.index]),
          ),
          SizedBox(height: 100.0),
          Text('Lorem Ipsum'),
          SizedBox(height: 200.0),
          index == 2
              ? Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 80),
                  decoration: BoxDecoration(
                      color: Color(0xFF00BFA6),
                      borderRadius: BorderRadius.circular(40)),
                  child: FlatButton(
                    onPressed: () {},
                    child: Text('Schedule your session'),
                  ))
              : Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        icon: Icon(Icons.arrow_forward_ios),
                        onPressed: () => this.controller.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn)),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                )
        ],
      ),
    );
  }
}
