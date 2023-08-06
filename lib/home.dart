import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/products_cubit.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Testing Api'),
      ),
      body: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoding) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductsError) {
            return Center(
              child: Text(
                state.message.toString(),
              ),
            );
          } else if (state is productsloded) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 3,
                mainAxisSpacing: 3,
                childAspectRatio: 1 / 1.4,
              ),
              itemCount: state.productsList.length,
              itemBuilder: (context, itemIndex) {
                final productsModel = state.productsList[itemIndex];
                return SizedBox(
                  height: 400,
                  width: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 150,
                          width: 180,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color.fromARGB(255, 243, 237, 237)),
                          child: Image.network(productsModel.image.toString()),
                        ),
                      ),
                      Text(
                        productsModel.title.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            productsModel.price.toString(),
                            style: const TextStyle(
                                color: Colors.orange,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 23,
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
