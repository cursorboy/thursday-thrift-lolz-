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
        imageUrl: 'https://picsum.photos/id/1011/400/600',
        tags: ['Y2K', 'Streetwear', 'Casual'],
        description: 'Cropped baby tee for a bold Y2K look',
      ),
      ThriftItem(
        id: '3',
        title: 'Grunge Flannel Shirt',
        brand: 'Urban Rebel',
        price: 30.00,
        imageUrl: 'https://images.unsplash.com/photo-1602810317791-4781b31cf779?w=400&h=600&fit=crop',
        tags: ['Grunge', 'Plaid', 'Vintage'],
        description: 'Oversized flannel for layered grunge vibes',
      ),
      ThriftItem(
        id: '4',
        title: 'Minimalist Linen Pants',
        brand: 'Everlane',
        price: 40.00,
        imageUrl: 'https://picsum.photos/id/1015/400/600',
        tags: ['Clean Minimal', 'Neutral', 'Linen'],
        description: 'Lightweight linen for a clean summer look',
      ),
      ThriftItem(
        id: '5',
        title: 'Preppy Cable Knit Sweater',
        brand: 'Ralph Lauren',
        price: 55.00,
        imageUrl: 'https://images.unsplash.com/photo-1627244282904-1e7c95a567a9?w=400&h=600&fit=crop',
        tags: ['Prep', 'Sweater', 'Classic'],
        description: 'Cable knit perfection with preppy vibes',
      ),
      ThriftItem(
        id: '6',
        title: 'Vintage Sports Windbreaker',
        brand: 'Nike',
        price: 50.00,
        imageUrl: 'https://picsum.photos/id/1025/400/600',
        tags: ['Vintage Sport', 'Outerwear', '90s'],
        description: 'Throwback windbreaker with bold colors',
      ),
      ThriftItem(
        id: '7',
        title: 'Y2K Mini Skirt',
        brand: 'Forever 21',
        price: 20.00,
        imageUrl: 'https://images.unsplash.com/photo-1593032457869-b56c12f11f3d?w=400&h=600&fit=crop',
        tags: ['Y2K', 'Skirt', 'Party'],
        description: 'Bright, bold, and made to turn heads',
      ),
      ThriftItem(
        id: '8',
        title: 'Clean White Button-Up',
        brand: 'Uniqlo',
        price: 28.00,
        imageUrl: 'https://picsum.photos/id/1035/400/600',
        tags: ['Clean Minimal', 'Essential', 'Workwear'],
        description: 'Timeless and crisp white shirt for any fit',
      ),
      ThriftItem(
        id: '9',
        title: 'Streetwear Graphic Hoodie',
        brand: 'Supreme',
        price: 65.00,
        imageUrl: 'https://images.unsplash.com/photo-1602810318411-0b51f9c4a972?w=400&h=600&fit=crop',
        tags: ['Streetwear', 'Hoodie', 'Bold'],
        description: 'Statement piece hoodie with street flair',
      ),
      ThriftItem(
        id: '10',
        title: 'Grunge Combat Boots',
        brand: 'Dr. Martens',
        price: 70.00,
        imageUrl: 'https://picsum.photos/id/1045/400/600',
        tags: ['Grunge', 'Footwear', 'Durable'],
        description: 'Chunky leather boots made to stomp',
      ),
    ];
  }
}
 