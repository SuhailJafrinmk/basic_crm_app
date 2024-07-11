import 'package:crm_app/features/homescreen/bloc/home_screen_bloc.dart';
import 'package:crm_app/widget/page_view_one.dart';
import 'package:crm_app/widget/page_view_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    
    super.initState();
    BlocProvider.of<HomeScreenBloc>(context).add(FetchContacts());
  }
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    final pageController=PageController(
      initialPage: 0,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('crm application'),
      ),
 
      body: PageView(

        scrollDirection: Axis.horizontal,
        controller: pageController,
        children:  [
          FirstTab(),
          SecondTab(),
        ],
      ),
     
    );
}
}