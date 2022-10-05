import 'i_product_dto.dart';

abstract class IProductsService {

  Future<List<IProductDto>> getTastySnacks();
}
