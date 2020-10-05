import 'package:flutter/material.dart';
import 'package:myloading/myloading.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Show Popup'),
              onPressed: () {
              },
            ),
            FlatButton(child: Text('Show loading'), onPressed: (){
              _showLoadingFiveSec();
            },),
          ],
        ),
      ),
    );
  }

  _showLoadingFiveSec()async{
    showLoading(context, message: 'Start\ncountdown');
    await Future.delayed(Duration(seconds: 1));
    updateLoading('Countdown: 4');
    await Future.delayed(Duration(seconds: 1));
    updateLoading('Countdown: 3');
    await Future.delayed(Duration(seconds: 1));
    updateLoading('Countdown: 2');
    await Future.delayed(Duration(seconds: 1));
    updateLoading('Countdown: 1');
    await Future.delayed(Duration(seconds: 1));
    updateLoading('');
    await Future.delayed(Duration(seconds: 1));
    hideLoading(context);
    await Future.delayed(Duration(seconds: 1));
  }
}
