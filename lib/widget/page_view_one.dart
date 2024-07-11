import 'dart:developer';
import 'package:crm_app/features/homescreen/bloc/home_screen_bloc.dart';
import 'package:crm_app/features/homescreen/cubit/homescreen_cubit.dart';
import 'package:crm_app/widget/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final scrollController = ScrollController();

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
            child: const Center(child: Text('Trigger')),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: height * 0.7,
            width: width * 0.7,
            child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
              builder: (context, state) {
                log('total calll count is ${state.callLogs.length}');
                log('the current state is $state');
                if (state is DescriptionAdded) {
                  return Scrollbar(
                    controller: scrollController,
                    thumbVisibility: true,
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: state.callLogs.length,
                      itemBuilder: (context, index) {
                        final data = state.callLogs[index];
                        final key = '${data.number}-${data.timestamp}';
                        final description =
                            state.descriptions[key] ?? 'No description';
                        final contactCard = ContactContact(
                          id: key,
                          description: description,
                          onPressed: () => showDescriptionDialogue(
                              context, data.timestamp, data.number),
                          phoneNumber: data.number!,
                          name: data.name,
                        );
                        return LongPressDraggable<ContactContact>(
                          data: contactCard,
                          feedback: SizedBox(
                            width: width * 0.7,
                            child: contactCard,
                          ),
                          childWhenDragging: Opacity(
                            opacity: 0.1,
                            child: contactCard,
                          ),
                          child: contactCard,
                        );
                      },
                    ),
                  );
                }
                return Container();
              },
            ),
          ),
          Expanded(
            child: DragTarget<ContactContact>(
              builder: (context, candidateData, rejectedData) {
                return BlocBuilder<HomescreenCubit, bool>(
                  builder: (context, isDropped) {
                    return AnimatedContainer(
                      decoration: BoxDecoration(
                        color: isDropped?  Colors.amber: Colors.green.shade200,
                        shape:  isDropped ? BoxShape.circle: BoxShape.rectangle,     
                      ),
                      duration: const Duration(seconds: 1),
                      child:  Center(
                        child: Text(isDropped ? 'Completed' : 'Drop here'),
                      ),
                    );
                  },
                );
              },
              onAccept: (data) {
                context.read<HomescreenCubit>().markDropped();
                BlocProvider.of<HomeScreenBloc>(context)
                    .add(MoveTocompleted(id: data.id));
                Future.delayed(const Duration(seconds: 1), () {
                 context.read<HomescreenCubit>().reset();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

void showDescriptionDialogue(
    BuildContext context, int? timestamp, String? number) {
  final TextEditingController description = TextEditingController();
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('add details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: description,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<HomeScreenBloc>(context).add(
                        SubmitDescription(
                            number: number!,
                            timestamp: timestamp!,
                            description: description.text));
                    Navigator.of(context).pop();
                  },
                  child: const Text('Submit')),
            ],
          ),
        );
      });
}
