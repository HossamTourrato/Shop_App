import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/HomeLayout/Cubit/home_cubit.dart';
import 'package:shop_app/Models/home_products_model.dart';

class HomeProductsScreen extends StatelessWidget {
  const HomeProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder:  (context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
            body: cubit.homeModel != null
                ? buildProductHome(cubit.homeModel!)
                : Center(child: CircularProgressIndicator()),
          );
        },
        );
  }

  Widget buildProductHome(HomeModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildProductBanners(model.data!.banners),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('Hot deals 🔥',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
        ),
        Expanded(
            child: buildProductGrid(model)
        ),
      ],
    );
  }

  // Build the product banners
  Widget buildProductBanners(List<dynamic> bannsers) {
    return CarouselSlider(
      options: CarouselOptions(
          height: 250.0,
          initialPage: 0,
          enableInfiniteScroll: true,
          viewportFraction: 1.0,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
      ),
      items: bannsers.map((e)=>
      bannerCard(e.image)
      ).toList() ,
      );
  }
  Widget bannerCard(String imageUrl,) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.all(16),
      child: Container(

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.all(16),

      ),
    );
  }

  // Build the product grid
  Widget buildProductGrid(HomeModel model) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 0.7,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      children: List.generate(model.data!.products.length, (index) {
        return buildProductCard(model.data!.products,index);
      }),

    );
  }





  Widget buildProductCard(List<dynamic> products, int index) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image + icons
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(
                  products[index].image!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '-${products[index].discount}%',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.red,
                    // isFavorite ? Icons.favorite : Icons.favorite_border,
                    // color: isFavorite ? Colors.red : Colors.white,
                  ),
                  onPressed: (){},
                ),
              ),
            ],
          ),

          // Product Info
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  products[index].name!,
                  style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      '\$${products[index].price!.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '\$${products[index].oldPrice!.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const Spacer(),

                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }







}
