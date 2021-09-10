import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stackedapp/services/navigation/navigation.dart';
import 'package:stackedapp/services/set_up.dart';
import 'package:stackedapp/widgets/suspense.dart';

import '../../view_models/index/product_view_model.dart';
import 'package:stackedapp/extentions/num.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        elevation: 0.0,
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              locator<NavigationsService>().pushNamed("/sign_out");
            },
            child: Text(
              "Log out",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: ViewModelBuilder<ProductViewModel>.reactive(
        viewModelBuilder: () => ProductViewModel(),
        onModelReady: (viewModel) => viewModel.fetchProducts(),
        builder: (context, viewModel, child) => STACKEDSuspense(
          appState: viewModel.appstate,
          loadingWidget: Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          errorWidget: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Error in fetching data"),
              ],
            ),
          ),
          successWidget: (widget) => ListView.builder(
            itemCount: viewModel.products.length,
            itemBuilder: (context, index) {
              final product = viewModel.products[index];
              return Container(
                width: 80.w,
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 10.h,
                      height: 10.h,
                      child: Image.network(product.picture!),
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "Product from: ${product.shopName}",
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
