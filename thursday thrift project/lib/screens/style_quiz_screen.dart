import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state.dart';
import '../utils/mock_data.dart';
import 'swipe_feed_screen.dart';
import '../utils/dotted_background.dart';

class StyleQuizScreen extends StatefulWidget {
  const StyleQuizScreen({super.key});

  @override
  State<StyleQuizScreen> createState() => _StyleQuizScreenState();
}

class _StyleQuizScreenState extends State<StyleQuizScreen> {
  List<String> _selectedStyles = [];
  bool _showCompletion = false;

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _buildQuizContent(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuizContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(),
        SizedBox(height: 40),
        Expanded(
          child: _showCompletion ? _buildCompletionView() : _buildQuizView(),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
            child: Text(
              'TIA',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'TIA',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Text(
                'Thrift Intelligence Assistant',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuizView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildChatBubble(
          'What best describes your vibe today?',
          isUser: false,
        ),
        SizedBox(height: 30),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 4.0,
            ),
            itemCount: MockData.styleOptions.length,
            itemBuilder: (context, index) {
              final style = MockData.styleOptions[index];
              final isSelected = _selectedStyles.contains(style);
              
              return GestureDetector(
                onTap: () => _toggleStyle(style),
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.black : Colors.grey[50],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isSelected ? Colors.black : Colors.grey[300]!,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      style,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: isSelected ? Colors.white : Colors.black87,
                        fontFamily: 'Arial',
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 20),
        if (_selectedStyles.isNotEmpty)
          _buildContinueButton(),
      ],
    );
  }

  Widget _buildCompletionView() {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildChatBubble(
              'All set. Let\'s build your Thursday.',
              isUser: false,
            ),
            SizedBox(height: 40),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Icon(
                Icons.check_circle_outline,
                size: 80,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 40),
            Text(
              'Your style preferences have been saved!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            _buildGetStartedButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildChatBubble(String message, {required bool isUser}) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isUser ? Colors.black : Colors.grey[100],
        borderRadius: BorderRadius.circular(20).copyWith(
          bottomLeft: isUser ? Radius.circular(20) : Radius.circular(5),
          bottomRight: isUser ? Radius.circular(5) : Radius.circular(20),
        ),
      ),
      child: Text(
        message,
        style: TextStyle(
          fontSize: 16,
          color: isUser ? Colors.white : Colors.black87,
        ),
      ),
    );
  }

  Widget _buildContinueButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: _selectedStyles.length >= 1 ? _handleContinue : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
        ),
        child: Text(
          'Continue (${_selectedStyles.length} selected)',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildGetStartedButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: _handleGetStarted,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
        ),
        child: Text(
          'Start Swiping',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  void _toggleStyle(String style) {
    setState(() {
      if (_selectedStyles.contains(style)) {
        _selectedStyles.remove(style);
      } else if (_selectedStyles.length < 3) {
        _selectedStyles.add(style);
      }
    });
  }

  Future<void> _handleContinue() async {
    try {
      final appState = Provider.of<AppState>(context, listen: false);
      await appState.completeStyleQuiz(_selectedStyles);
      
      setState(() {
        _showCompletion = true;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Something went wrong. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _handleGetStarted() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => SwipeFeedScreen(),
      ),
    );
  }
} 