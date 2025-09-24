import 'package:flutter/material.dart';
import 'custom_text.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width > 600;
    return Card(
      elevation: 8,
      shadowColor: Colors.black38,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: EdgeInsets.all(isLargeScreen ? 32.0 : 16.0),
      child: Padding(
        padding: EdgeInsets.all(isLargeScreen ? 24.0 : 16.0),
        child: isLargeScreen
            ? _buildHorizontalLayout(context)
            : _buildVerticalLayout(context),
      ),
    );
  }

  Widget _buildHorizontalLayout(BuildContext context) {
    return Row(
      children: [
        _buildProfilePicture(true),
        const SizedBox(width: 24),
        Expanded(child: _buildTextContent(true)),
      ],
    );
  }

  Widget _buildVerticalLayout(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildProfilePicture(false),
        const SizedBox(height: 20),
        _buildTextContent(false),
      ],
    );
  }

  Widget _buildProfilePicture(bool isLarge) {
    final size = isLarge ? 150.0 : 120.0;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[300],
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Icon(
        Icons.person,
        size: isLarge ? 80 : 60,
        color: Colors.grey[600],
      ),
    );
  }

  Widget _buildTextContent(bool isLarge) {
    return Column(
      crossAxisAlignment:
          isLarge ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        CustomText(
          text: 'John Doe',
          fontSize: isLarge ? 22 : 18,
          fontWeight: FontWeight.bold,
          textAlign: isLarge ? TextAlign.left : TextAlign.center,
        ),
        SizedBox(height: isLarge ? 12 : 8),
        CustomText(
          text: 'Section A | 3rd Year',
          fontSize: isLarge ? 16 : 14,
          fontWeight: FontWeight.bold,
          color: Colors.red,
          textAlign: isLarge ? TextAlign.left : TextAlign.center,
        ),
        SizedBox(height: isLarge ? 8 : 6),
        CustomText(
          text:
              'Computer Science Student passionate about mobile development and creating innovative solutions.',
          fontSize: isLarge ? 14 : 12,
          textAlign: isLarge ? TextAlign.left : TextAlign.center,
        ),
      ],
    );
  }
}
