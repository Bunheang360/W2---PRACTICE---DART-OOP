class BankAccount {
  // TODO
  final int accountID;
  final String accountOwner;
  double _balance = 0.0;

  BankAccount(this.accountID, this.accountOwner, [this._balance = 0.0]);

  double get balance => _balance;

  void withdraw(double amount) {
    if (amount <= 0) {
      throw Exception ("The withdraw ammount should be positive");
    } else if (_balance - amount < 0) {
      throw Exception ("Insufficient Amount");
    } else {
      _balance -= amount;
    }
  }

  void credit(double amount) {
    if (amount == 0) {
      throw Exception ("The amount should be positive");
    } else {
      _balance += amount;
    }
  }

  @override
  String toString() =>
      'Account ID: $accountID, '
      'Account Owner: $accountOwner, '
      'Balance: \$$_balance';
}

class Bank {
  // TODO
  final String name;
  final List<BankAccount> _accounts = [];

  Bank( {required this.name} );

  BankAccount createAccount (int accountID, String accountOwner) {
    for (var acc in _accounts) {
      if (acc.accountID == accountID) {
        throw Exception ("Account with $accountID is already exist");
      }
    }

    var newAccount = BankAccount(accountID, accountOwner);
    _accounts.add(newAccount);
    return newAccount;
  }

  @override
  String toString() {
    return ('Bank: $name, Total Accounts in Bank: ${_accounts.length}');
  }
}

void main() {
  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
