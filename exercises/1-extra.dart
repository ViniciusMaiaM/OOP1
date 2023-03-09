void main(){
    Produto cerveja = new Produto(10.50,"Cerveja",DateTime.now());
    Produto banana = new Produto(2.00,"Banana",DateTime.now());
    print(cerveja);
    print(banana);
    
    Item engradado = new Item(2, cerveja);
    print(engradado);
    print("Preço total item: ${engradado.total()}");

    Venda venda = new Venda(DateTime.now(),[engradado]);
    venda.setItem(2, banana);
    print(venda);
    print("Preço total: ${venda.total()}");
}

class Venda{
    final DateTime data;
    final List<Item> itens;

    double total(){
        return itens.fold(0,(soma,elemento) => soma + elemento.total());
    }

    Venda(this.data, this.itens);
    
    void setItem(double quantidade, Produto produto){
        Item item = Item( quantidade,  produto);
        itens.add(item);
    }

    @override
    String toString() => "\nData: ${this.data} \n Itens: ${this.itens}";
}

class Item{
    final double quantidade;
    Produto prod;

    double total(){
        return quantidade * prod.preco;
    }

    Item(this.quantidade, this.prod);

    @override
    String toString() => "\nQuantidade: ${this.quantidade} \n Produtos: ${this.prod}";
}

class Produto{
    final double preco;
    final String desc;
    final DateTime data;

    Produto(this.preco, this.desc, this.data);

    @override
    String toString() => "\nPreco: ${this.preco} \n Desc: ${this.desc} \n Data: ${this.data}";
}
