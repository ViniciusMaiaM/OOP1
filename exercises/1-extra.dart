void main(){
    Produto cerveja = new Produto(preco: 10.50,desc: "Cerveja",data: DateTime.now());
    Produto banana = new Produto(preco: 2.00,desc: "Banana",data: DateTime.now());
    
    Item engradado = new Item(quantidade: 2, prod: cerveja);
    Item penca = new Item(quantidade: 4, prod: banana);


    Venda venda = new Venda(DateTime.now());
    // O item deve ser adicionado a lista utilizando a função
    venda.addItem(penca);
    venda.addItem(engradado);
    print(venda);
}

class Venda{
    final DateTime data;
    List<Item> itens = [];

    double total() => itens.fold(0,(soma,elemento) => soma + elemento.total());
    

    Venda(this.data);

    void addItem(Item item){
        itens.add(item);
    }

    @override
    String toString() => "\nData: ${this.data} \n Itens: (\n${this.itens}\n) \n Preço total da venda: ${this.total()}";
}

class Item{
    final double quantidade;
    Produto prod;

    double total(){
        return quantidade * prod.preco;
    }

    Item({required double this.quantidade, required Produto this.prod});

    @override
    String toString() => "\nQuantidade: ${this.quantidade} \n (Produto: ${this.prod}) Preço total do item: ${this.total()}\n -____________________________-";
}

class Produto{
    final double preco;
    final String desc;
    final DateTime data;

    Produto({required double this.preco, required String this.desc, required DateTime this.data});

    @override
    String toString() => "Preco do produto: ${this.preco} \n Desc: ${this.desc} \n Data: ${this.data}\n";
}
