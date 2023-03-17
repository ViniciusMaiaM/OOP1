class Account{
  late final String _accountNumber;
  late final double _balance;
  late final double _interestRate;

  Account({required accountNumber, required balance, required interestRate}){
    this._accountNumber = accountNumber;
    this._balance = balance;
    this._interestRate = interestRate;
  }

  String get accountNumber => _accountNumber;

  double get balance => _balance;

  double get interestRate => _interestRate;

  set balance(double value) {
    _balance = value;
  }

  void Deposit(double amount){
    if(amount <= 0.0){
      throw Exception("You can't deposit");
    }

    this.balance += amount;
  }

  void withdraw(double amount){
    if(amount > balance){
      throw Exception('Insufficient funds');
    }

    balance -= amount;
  }

  double calculateInterest(){
    return balance * this.interestRate/100;
  }

  @override
  String toString() => '\n Account number: $_accountNumber\n Balance: $_balance\n Interest Rate: $_interestRate';
}

void main(){
  Account account = new Account(accountNumber: '1234', balance: 1000.00, interestRate: 10.10);
  print(account);
  print(account.calculateInterest());
}
