import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Constants/constants.dart';
import '../Models/models.dart';
import '../Providers/providers.dart';
import '../Routes/routes.dart';
import '../Widgets/widgets.dart';

class CatalogScreen extends StatefulWidget {
  static const String routeName = PageRoutes.catalog;
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  late CatalogProvider catalogProvider;
  late List<Catalog> catalog;

  @override
  void initState() {
    super.initState();
    catalogProvider = Provider.of<CatalogProvider>(context, listen: false);
    catalog = [];
    getCatalogs();
  }

  getCatalogs() {
    catalog = catalogProvider.catalogList;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.defaultColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 25.0,
            color: AppColors.textColor,
          ),
        ),
        title: const Text(
          'Catalog',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: GridView.builder(
        itemCount: catalog.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15.0,
          crossAxisSpacing: 10.0,
          mainAxisExtent: size.height / 3,
        ),
        itemBuilder: (builder, index) {
          return CatalogCard(
            size: size,
            imageUrl: catalog[index].catalogImage ?? '',
            productName: catalog[index].name ?? '',
            onDownload: () {},
          );
        },
      ),
    );
  }
}
