import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:testassignment/UI/base_widget.dart';
import 'package:testassignment/utils/color.dart';

class Loader extends StatefulWidget {
  final String text;

  const Loader({Key key, this.text}) : super(key: key);
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      builder: (context, sizingInformation) => Center(
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // LoadingIndicator(
              //   indicatorType: Indicator.values[12],
              //   color: Colors.blue,
              // ),

              SpinKitCubeGrid(size: 50.0, color: primaryColor),

              //SizedBox(height: 10,),
              // FittedBox(
              //   fit: BoxFit.contain,
              //   child: Text(widget.text,style: TextStyle(
              //       fontSize: 17,
              //       color: white,
              //   ),),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
