import '../models/thrift_item.dart';

class MockData {
  static const List<String> styleOptions = [
    'Y2K',
    'Streetwear',
    'Prep',
    'Grunge',
    'Clean Minimal',
    'Vintage Sport',
  ];

  static List<ThriftItem> getMockThriftItems() {
    return [
      ThriftItem(
      id: '1',
      title: 'Vintage Denim Jacket',
      brand: 'Levi\'s',
      price: 45.00,
      imageUrl: 'https://images.unsplash.com/photo-1544022613-e87ca75a784a?w=400&h=600&fit=crop',
      tags: ['Vintage', 'Denim', 'Streetwear'],
      description: 'Classic 90s denim jacket in excellent condition',
    ),
      ThriftItem(
      id: '2',
      title: 'Y2K Baby Tee',
      brand: 'Bratz',
      price: 25.00,
      imageUrl: 'https://y2k-glory.com/cdn/shop/files/bratz-baby-tee-y2k-4.webp',
      tags: ['Y2K', 'Streetwear', 'Casual'],
      description: 'Cropped baby tee for a bold Y2K look',
    ),
      ThriftItem(
      id: '3',
      title: 'Grunge Flannel Shirt',
      brand: 'Urban Rebel',
      price: 30.00,
      imageUrl: 'https://i.ebayimg.com/images/g/CC8AAOSwpolmTLRV/s-l400.jpg',
      tags: ['Grunge', 'Plaid', 'Vintage'],
      description: 'Oversized flannel for layered grunge vibes',
    ),
      ThriftItem(
      id: '4',
      title: 'Minimalist Linen Pants',
      brand: 'Everlane',
      price: 40.00,
      imageUrl: 'https://i.etsystatic.com/33478656/r/il/867e4d/6365370132/il_570xN.6365370132_sydx.jpg',
      tags: ['Clean Minimal', 'Neutral', 'Linen'],
      description: 'Lightweight linen for a clean summer look',
    ),
      ThriftItem(
      id: '5',
      title: 'Preppy Cable Knit Sweater',
      brand: 'Ralph Lauren',
      price: 55.00,
      imageUrl: 'https://cubicoriginal.com/cdn/shop/files/12_01642451-bea1-4930-94bd-91b59dedb70c.jpg?v=1749639544',
      tags: ['Prep', 'Sweater', 'Classic'],
      description: 'Cable knit perfection with preppy vibes',
    ),
      ThriftItem(
      id: '6',
      title: 'Vintage Sports Windbreaker',
      brand: 'Nike',
      price: 50.00,
      imageUrl: 'https://www.thevintagetwin.com/cdn/shop/products/41015_batch19_17298.jpg?v=1673910032&width=1445',
      tags: ['Vintage Sport', 'Outerwear', '90s'],
      description: 'Throwback windbreaker with bold colors',
    ),
      ThriftItem(
      id: '7',
      title: 'Y2K Mini Skirt',
      brand: 'Forever 21',
      price: 20.00,
      imageUrl: 'https://boogzelclothing.com/cdn/shop/files/Crime-Time-Y2K-Mini-Skirt-Boogzel-Clothing-2_800x.jpg?v=1693128672
      description: 'Bright, bold, and made to turn heads',
    ),
      ThriftItem(
      id: '8',
      title: 'Clean White Button-Up',
      brand: 'Uniqlo',
      price: 28.00,
      imageUrl: 'https://media.istockphoto.com/id/1373292562/photo/long-sleeved-collared-white-shirt-isolated-on-white-background.jpg?s=612x612&w=0&k=20&c=6lyG81A0TQAJRuIqV7Amr458kD50nBNNrj7mh2vDTt4='
      tags: ['Clean Minimal', 'Essential', 'Workwear'],
      description: 'Timeless and crisp white shirt for any fit',
    ),
      ThriftItem(
      id: '9',
      title: 'Streetwear Graphic Hoodie',
      brand: 'Supreme',
      price: 65.00,
      imageUrl: 'https://m.media-amazon.com/images/I/61g7gVXv4sL._AC_UY1000_.jpg',
      tags: ['Streetwear', 'Hoodie', 'Bold'],
      description: 'Statement piece hoodie with street flair',
    ),
      ThriftItem(
      id: '10',
      title: 'Grunge Combat Boots',
      brand: 'Dr. Martens',
      price: 70.00,
      imageUrl: 'https://static.vecteezy.com/system/resources/previews/044/646/673/large_2x/old-used-broken-black-leather-army-lace-boots-trendy-autumn-boots-stylish-womens-mens-unisex-grunge-boots-with-bootlace-high-military-shoes-isolated-on-white-background-flat-lay-copy-space-photo.jpg',
      tags: ['Grunge', 'Footwear', 'Durable'],
      description: 'Chunky leather boots made to stomp',
    ),
  ];
}
}
 