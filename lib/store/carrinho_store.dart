import 'package:mobx/mobx.dart';
import 'package:panucci_delivery/models/item.dart';

part 'carrinho_store.g.dart';

class CarrinhoStore = _CarrinhoStore with _$CarrinhoStore;

abstract class _CarrinhoStore with Store {
  @observable
  List<Item> listaItem = ObservableList<Item>();

  @observable
  double totalDaCompra = 0;

  @computed
  int get quantidadeItem => listaItem.length;

  @computed
  bool get listaVazia => listaItem.isEmpty;

  @action
  void adicionaItem(Item item) {
    listaItem.add(item);
  }

  @action
  void removerItem(Item item) {
    if (listaItem.isNotEmpty) listaItem.remove(item);
  }

  @action
  void atualizaTotalDaCompra() {
    totalDaCompra = 0;
    for (var item in listaItem) {
      totalDaCompra += item.preco;
    }
  }
}
