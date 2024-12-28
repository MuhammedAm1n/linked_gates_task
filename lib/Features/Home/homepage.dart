import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linked_gates_task/Features/Home/Components/CutsomCard.dart';
import 'package:linked_gates_task/Features/Home/Components/custom_snackbar.dart';
import 'package:linked_gates_task/Features/Home/Logic/cubit/getproducts_cubit.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    context.read<GetproductsCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<GetproductsCubit, GetproductsState>(
          builder: (context, state) {
            if (state is GetproductsLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetproductsSuccess) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 80),
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    return CustomCard(
                      product: state.products[index],
                    );
                  },
                ),
              );
            } else if (state is GetproductsFaliure) {
              CustomSnackbar.showSnackbar(context, state.errMessage);
            } else {
              return Center(
                child: Text('Something went wrong'),
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
