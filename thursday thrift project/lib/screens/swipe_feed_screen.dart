import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../providers/app_state.dart';
import '../models/thrift_item.dart';
import '../widgets/thrift_card.dart';
import '../utils/dotted_background.dart';

class SwipeFeedScreen extends StatefulWidget {
  const SwipeFeedScreen({super.key});

  @override
  State<SwipeFeedScreen> createState() => _SwipeFeedScreenState();
}

class _SwipeFeedScreenState extends State<SwipeFeedScreen> {
  final CardSwiperController controller = CardSwiperController();
  List<ThriftItem> _items = [];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final appState = Provider.of<AppState>(context, listen: false);
      _items = List.from(appState.availableItems);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DottedBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image.network(
                'https://framerusercontent.com/images/DfXvZZobnIAt78GBp1cKXe6uDc.png?scale-down-to=512',
                height: 200,
                width: 600,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => SizedBox(height: 200, width: 600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Column(
                children: [
                  Expanded(
                    child: _items.isEmpty
                        ? _buildEmptyState()
                        : _buildSwipeArea(),
                  ),
                  _buildActionButtons(),
                ],
              ),
            ),
            Positioned(
              top: 40,
              right: 40,
              child: Row(
                children: [
                  IconButton(
                    onPressed: _showSavedItems,
                    icon: Icon(Icons.favorite, color: Colors.red),
                  ),
                  IconButton(
                    onPressed: _showProfile,
                    icon: Icon(Icons.person_outline),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwipeArea() {
    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 420,
          maxHeight: 600,
        ),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: CardSwiper(
          controller: controller,
          cardsCount: _items.length,
          onSwipe: _onSwipe,
          onEnd: _onEnd,
          cardBuilder: (context, index, horizontalOffset, verticalOffset) {
            return ThriftCard(item: _items[index]);
          },
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 40),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(32),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.inventory_2_outlined,
              size: 80,
              color: Colors.grey[400],
            ),
            SizedBox(height: 20),
            Text(
              'No more items!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Check back Thursday for new drops',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[500],
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _resetItems,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text('Reset Items'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildActionButton(
            icon: Icons.close,
            color: Colors.red,
            onTap: () => controller.swipeLeft(),
          ),
          _buildActionButton(
            icon: Icons.favorite,
            color: Colors.green,
            onTap: () => controller.swipeRight(),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  bool _onSwipe(int previousIndex, int? currentIndex, CardSwiperDirection direction) {
    if (direction == CardSwiperDirection.right) {
      _saveItem(_items[previousIndex]);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Saved ${_items[previousIndex].title}'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 1),
        ),
      );
    }
    
    setState(() {
      _currentIndex = currentIndex ?? 0;
    });
    
    return true;
  }

  void _onEnd() {
    setState(() {
      _currentIndex = 0;
    });
  }

  void _saveItem(ThriftItem item) {
    final appState = Provider.of<AppState>(context, listen: false);
    appState.saveItem(item);
  }

  void _showSavedItems() {
    final appState = Provider.of<AppState>(context, listen: false);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildSavedItemsSheet(appState.savedItems),
    );
  }

  Widget _buildSavedItemsSheet(List<ThriftItem> savedItems) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Text(
                  'Saved Items (${savedItems.length})',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close),
                ),
              ],
            ),
          ),
          Expanded(
            child: savedItems.isEmpty
                ? Center(
                    child: Text(
                      'No saved items yet',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  )
                : ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    itemCount: savedItems.length,
                    itemBuilder: (context, index) {
                      final item = savedItems[index];
                      return Card(
                        margin: EdgeInsets.only(bottom: 12),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: CachedNetworkImage(
                              imageUrl: item.imageUrl,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Container(
                                color: Colors.grey[300],
                                child: Icon(Icons.image),
                              ),
                              errorWidget: (context, url, error) => Container(
                                color: Colors.grey[300],
                                child: Icon(Icons.error),
                              ),
                            ),
                          ),
                          title: Text(
                            item.title,
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                          trailing: IconButton(
                            onPressed: () {
                              final appState = Provider.of<AppState>(context, listen: false);
                              appState.removeSavedItem(item.id);
                              Navigator.pop(context);
                              _showSavedItems();
                            },
                            icon: Icon(Icons.delete_outline, color: Colors.red),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  void _showProfile() {
    final appState = Provider.of<AppState>(context, listen: false);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Profile'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${appState.user?.name ?? "N/A"}'),
            SizedBox(height: 8),
            Text('Email: ${appState.user?.email ?? "N/A"}'),
            SizedBox(height: 8),
            Text('Styles: ${appState.user?.selectedStyles.join(", ") ?? "None"}'),
            SizedBox(height: 8),
            Text('Saved Items: ${appState.savedItems.length}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
          TextButton(
            onPressed: () {
              appState.resetApp();
              Navigator.pop(context);
              Navigator.of(context).pushReplacementNamed('/');
            },
            child: Text('Reset App'),
          ),
        ],
      ),
    );
  }

  void _resetItems() {
    final appState = Provider.of<AppState>(context, listen: false);
    setState(() {
      _items = List.from(appState.availableItems);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
} 