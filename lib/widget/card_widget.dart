import 'package:crm_app/features/homescreen/bloc/home_screen_bloc.dart';
import 'package:crm_app/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactContact extends StatelessWidget {
  final String phoneNumber;
  final String? name;
  VoidCallback? onPressed;
  final String description;
  final String id;

  ContactContact(
      {super.key, required this.phoneNumber, this.name, this.onPressed,required this.description,required this.id});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * .3,
      child: Card(
        elevation: 10,
        shadowColor: Colors.black54,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SizedBox(
            child: Column(
              children: [
                Expanded(flex: 1, child: SizedBox()),
                Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          phoneNumber,
                          style: AppTextStyles.cardText,
                        ),
                        Text(
                          'Name:${name ?? 'no name'}',
                          style: AppTextStyles.cardText,
                        ),
                       
                           
                               Text(
                                description,
                                style: AppTextStyles.cardText,
                              ),
                           
                          
                         
                        Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    onPressed:onPressed,
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.black54,
                                    )),
                                Icon(
                                  Icons.favorite,
                                  color: Colors.black54,
                                ),
                              ],
                            ))
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}


