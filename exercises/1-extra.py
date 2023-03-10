from datetime import datetime

class Produto:
    def __init__(self, preco, desc, data):
        self.preco = preco
        self.desc = desc
        self.data = data
    
    def __str__(self):
        return ("Preco: ${self.preco} \n Desc: ${self.desc} \n Data: ${this.data}")

class Item: 
    def __init__(self,quantidade, produto):
        self.quantidade = quantidade
        self.produto = produto

    def total(self):
        return self.quantidade * self.produto.preco
    
    def __str__(self):
        return "\nQuantidade: ${self.quantidade} \n Produtos: ${self.prod}"

class Venda: 
    def __init__(self, data):
        self.data = data
        self.itens = [] 
    
    def total():
            return sum(map(lambda item: item.total(), this.itens))

    def __str__(self):
        return "\nData: ${self.data} \nTotal: ${self.itens}"    


cerveja = Produto(10.50,"Cerveja",datetime.now())
banana = Produto(2.00,"Banana",datetime.now())
print(cerveja)
print(banana)

engradado = Item(2, cerveja)
print(engradado)
print("Preço total item: ${engradado.total()}")

venda = Venda(datetime.now(),[engradado])
venda.setItem(2, banana)
print(venda)
print("Preço total: ${venda.total()}")
