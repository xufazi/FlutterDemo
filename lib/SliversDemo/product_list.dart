/**
 *  Create by fazi
 *  Date: 2019-07-05
 */

class ProductItem {
  final String name;
  final String tag;
  final String asset;
  final int stock;
  final double price;

  ProductItem({
    this.name,
    this.tag,
    this.asset,
    this.stock,
    this.price,
  });
}

final List<ProductItem> products = [
  ProductItem(
      name: 'Time flies.',
      tag: '1',
      asset: 'images/image1.png',
      stock: 1,
      price: 71.0),
  ProductItem(
      name: 'Time and tide wait for no man.',
      tag: '2',
      asset: 'images/image2.png',
      stock: 1,
      price: 71.0),
  ProductItem(
      name: 'Work makes the workman.',
      tag: '3',
      asset: 'images/image3.png',
      stock: 1,
      price: 71.0),
  ProductItem(
      name: 'I’m born to succeed.',
      tag: '4',
      asset: 'images/image4.png',
      stock: 1,
      price: 71.0),
];

