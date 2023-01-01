class StoreTransactionType {
  static const String buy = 'Buy', sell = 'Sell';
}

class DatabaseCollection {
  static const storeTransactions = 'StoreTransactions', inventory = 'inventory';
}

class AuthData {
  static const String email = 'zellorine@gmail.com';
}

enum RouteName { dashboard, inventory, addItems, login, home }

enum SharedPreferenceName { userData }
