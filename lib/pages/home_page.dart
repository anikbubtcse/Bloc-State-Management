import 'package:bloc_state_management/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_state_management/cubit/users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController echoTextEditingController =
      TextEditingController();

  @override
  void initState() {
    final cubit = context.read<UsersCubit>();
    cubit.fetchUsers();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cubit and Bloc State Management"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, counterState) {
                  if (counterState is CounterStateEchoLoaded) {
                    return Container(
                      width: double.infinity,
                      height: 200,
                      color: Colors.green.shade100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: echoTextEditingController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: Colors.black, width: 2)),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: Colors.black, width: 2),
                                        )),
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                ElevatedButton(
                                    onPressed:
                                        echoTextEditingController.text.isEmpty
                                            ? null
                                            : () {
                                                context.read<CounterBloc>().add(
                                                    CounterEventEcho(
                                                        echoValue:
                                                            echoTextEditingController
                                                                .text));
                                              },
                                    child: Text('Go')),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(child: Text(counterState.echoValue)),
                        ],
                      ),
                    );
                  }
                  if (counterState is CounterEchoLoading) {
                    return const Text("Loading .....");
                  }
                  return Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.green.shade100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: echoTextEditingController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: Colors.black, width: 2)),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.black, width: 2),
                                      )),
                                  onChanged: (value) {
                                    setState(() {});
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              ElevatedButton(
                                  onPressed:
                                      echoTextEditingController.text.isEmpty
                                          ? null
                                          : () {
                                              context.read<CounterBloc>().add(
                                                  CounterEventEcho(
                                                      echoValue:
                                                          echoTextEditingController
                                                              .text));
                                            },
                                  child: Text('Go')),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(child: Text('Empty')),
                      ],
                    ),
                  );
                },
              ),
              Container(
                width: double.infinity,
                height: 200,
                color: Colors.red.shade100,
              ),
              BlocBuilder<UsersCubit, UsersState>(builder: (context, state) {
                if (state is UsersInitial || state is UsersLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is UsersResponse) {
                  final usersInfo = state.usersModel;
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.usersModel.length,
                      itemBuilder: (context, index) {
                        final user = usersInfo[index];
                        return ListTile(
                          title: Text(user.name),
                          subtitle: Text(user.phone),
                          trailing: Text(user.email),
                        );
                      });
                }
                if (state is UsersError) {
                  Text(state.message);
                }

                return Container();
                // return widget here based on BlocA's state
              }),
            ],
          ),
        ));
  }
}
