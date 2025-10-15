enum DeliveryMethod { DELIVERY, PICKUP }

class Product {
  final String name;
  final double price;

  Product({required this.name, required this.price});
}

class Customer {
  final String name;
  final String? address;

  Customer({required this.name, required this.address});
}

class Order {
  final Customer customer;
  final List<Product> products;
  final DeliveryMethod deliveryMethod;

  Order({
    required this.customer,
    required this.products,
    required this.deliveryMethod,
  });

  double getTotal() {
    double total = 0;
    for (var product in products) {
      total += product.price;
    }

    if (deliveryMethod == DeliveryMethod.DELIVERY) {
      total += 3.0;
    }
    return total;
  }

  void printDetails() {
    print('Customer: ${customer.name}\n'
          'Delivery Method: ${deliveryMethod.name}');
    if (deliveryMethod == DeliveryMethod.DELIVERY){
      print('Delivery Address: ${customer.address ?? "No Address"}');
    }
    print('Product: ');
    for (var pName in products) {
      print(' - ${pName.name}: \$${pName.price}');
    }
    print('Total: \$${getTotal()}\n');
  }
}

void main () {
  var product1 = Product(name: 'Coffee', price: 2);
  var product2 = Product(name: 'Latte', price: 1.75);
  var product3 = Product(name: 'Matcha', price: 2.5);
  var product4 = Product(name: 'BLACK coffee', price: 1.50);

  var customer1 = Customer(name: 'Ronan', address: 'St. 62, Phnom Penh, 1234');
  var customer2 = Customer(name: 'Sokea', address: null);

  var order1 = Order(
    customer: customer1,
    products: [product1, product2],
    deliveryMethod: DeliveryMethod.DELIVERY,
  );

  var order2 = Order(
    customer: customer2,
    products: [product3],
    deliveryMethod: DeliveryMethod.PICKUP,
  );

  order1.printDetails();
  order2.printDetails();
}