
import 'dart:developer' as developer;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crm_app/features/homescreen/bloc/home_screen_bloc.dart';
import 'package:crm_app/widget/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondTab extends StatelessWidget {

  List<ContactContact> droppedContacts = [];

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: height,
      width: width,
      child: Column(
        children: [
          Container(
            height: 40,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(),
            ),
            child: Center(child: Text('Completed')),
          ),
          SizedBox(height: 20),
          Expanded(
            child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
              builder: (context, state) {
                if(state is DescriptionAdded){
                  final completedEntries = state.callLogs.where((entry) =>
                      state.completedKeys.contains('${entry.number}-${entry.timestamp}')).toList();
                  return ListView.separated(
                    itemCount: completedEntries.length,
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemBuilder: (context,index){
                      final entry = completedEntries[index];
                    return ListTile(
                      leading: Icon(Icons.person),
                      title: Text(
                        entry.name ?? 'noname',
                      ),
                      subtitle: Text(entry.number!),
                    );
                    
                  });
                }
                return Container();
              },
            )
          ),
        ],
      ),
    );
  }
}
