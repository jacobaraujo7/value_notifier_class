import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:value_listenable_test/value_listenable_test.dart';
import 'package:value_notifier_class/src/products/services/products_service.dart';
import 'package:value_notifier_class/src/products/states/product_state.dart';
import 'package:value_notifier_class/src/products/stores/product_store.dart';

class ProductServiceMock extends Mock implements ProductService {}

void main() {
  final service = ProductServiceMock();
  final store = ProductStore(service);

  test('deve alterar estado para sucesso', () async {
    when(() => service.fetchProducts()).thenAnswer((_) async => []);

    expect(
      store,
      emitValues([
        isA<LoadingProductState>(),
        isA<SuccessProductState>(),
      ]),
    );

    await store.fetchProducts();
  });

  test('deve alterar estado para error', () async {
    when(() => service.fetchProducts()).thenThrow(Exception('Error'));
    expect(
      store,
      emitValues([
        isA<LoadingProductState>(),
        isA<ErrorProductState>(),
      ]),
    );
    await store.fetchProducts();
  });
}
