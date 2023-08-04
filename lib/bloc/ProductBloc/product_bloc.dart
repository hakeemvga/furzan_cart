import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:furzan_app/repository/api/product_api/product_api.dart';
import 'package:furzan_app/repository/model_class/ProductModel.dart';
import 'package:furzan_app/repository/model_class/UserModel.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {

  late List<ProductModel> productModel;
  ProductApi productApi =ProductApi();

  ProductBloc() : super(ProductInitial()) {
    on<FetchProduct>((event, emit)async {
      emit(ProductLoading());
      try{
        productModel=await productApi.fetchProducts();
        emit(ProductLoaded());
      }catch(e){
        print(e);
        emit(ProductError());
      }
      // TODO: implement event handler
    });
  }
}
