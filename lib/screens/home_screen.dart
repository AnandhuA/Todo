import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/featchdata_bloc.dart';
import 'package:todo_app/screens/add_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FeatchdataBloc>().add(FeatchdataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<FeatchdataBloc, FeatchdataState>(
        builder: (context, state) {
          if (state is FeatchdataLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FeatchdataSuccess) {
            return ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.data["event"] ?? "no"),
                  subtitle: Text(state.data["date"] ?? "no"),
                );
              },
            );
          } else {
            return const Center(
              child: Text("error"),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
