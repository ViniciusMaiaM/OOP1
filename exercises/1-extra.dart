void main(){
    Produto cerveja = new Produto(10.50,"Cerveja",DateTime.now());
    Produto banana = new Produto(2.00,"Banana",DateTime.now());
    
    Item engradado = new Item(2, cerveja);
    Item penca = new Item(4, banana);


    Venda venda = new Venda(DateTime.now());
    venda.addItem(penca);
    venda.addItem(engradado);
    print(venda);
}

class Venda{
    final DateTime data;
    List<Item> itens = [];

    double total(){
        return itens.fold(0,(soma,elemento) => soma + elemento.total());
    }

    Venda(this.data);
    
    void setItem(double quantidade, Produto produto){
        Item item = Item( quantidade,  produto);
        itens.add(item);
    }

    void addItem(Item item){
        itens.add(item);
    }

    @override
    String toString() => "\nData: ${this.data} \n Itens: (\n${this.itens}\n) \n Total item: ${this.total()}";
}

class Item{
    final double quantidade;
    Produto prod;

    double total(){
        return quantidade * prod.preco;
    }

    Item(this.quantidade, this.prod);

    @override
    String toString() => "\nQuantidade: ${this.quantidade} \n (Produto: ${this.prod}) Preço total: ${this.total()}\n";
}

class Produto{
    final double preco;
    final String desc;
    final DateTime data;

    Produto(this.preco, this.desc, this.data);

    @override
    String toString() => "Preco: ${this.preco} \n Desc: ${this.desc} \n Data: ${this.data}\n";
}
