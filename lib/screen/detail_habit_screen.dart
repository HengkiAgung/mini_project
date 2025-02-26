import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailHabitScreen extends StatelessWidget {
  DetailHabitScreen({super.key});
  late bool isDark;

  @override
  Widget build(BuildContext context) {
    isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 217, 227, 251),
        title: const Text(
          'Insight & Data',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const SizedBox(height: 32),
            Center(
              child: const Text(
                'Insight & Data',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 32),
            _buildTrackedRate(),
            const SizedBox(height: 32),

            // Work Streaks
            _buildWorkStreaks(),

            const SizedBox(height: 32),

            // Yearly View
            Text(
              'Yearly View',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.grey : Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 10, height: 10, color: Colors.blue),
                const SizedBox(width: 4),
                Text(
                  'Tracked',
                  style: TextStyle(
                    fontSize: 12,
                    color: isDark ? Colors.grey : Colors.black,
                  ),
                ),
                const SizedBox(width: 8),
                Container(width: 10, height: 10, color: Colors.grey.shade700),
                const SizedBox(width: 4),
                Text(
                  'Untracked',
                  style: TextStyle(
                    fontSize: 12,
                    color: isDark ? Colors.grey : Colors.black,
                  ),
                ),
              ],
            ),

            // Year label
            Text(
              '2024',
              style: TextStyle(
                fontSize: 14,
                color: isDark ? Colors.grey : Colors.black,
              ),
            ),

            const SizedBox(height: 8),

            // Month labels
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Jan',
                  style: TextStyle(
                    fontSize: 10,
                    color: isDark ? Colors.grey : Colors.black,
                  ),
                ),
                Text(
                  'Feb',
                  style: TextStyle(
                    fontSize: 10,
                    color: isDark ? Colors.grey : Colors.black,
                  ),
                ),
                Text(
                  'Mar',
                  style: TextStyle(
                    fontSize: 10,
                    color: isDark ? Colors.grey : Colors.black,
                  ),
                ),
                Text(
                  'Apr',
                  style: TextStyle(
                    fontSize: 10,
                    color: isDark ? Colors.grey : Colors.black,
                  ),
                ),
                Text(
                  'May',
                  style: TextStyle(
                    fontSize: 10,
                    color: isDark ? Colors.grey : Colors.black,
                  ),
                ),
                Text(
                  'Jun',
                  style: TextStyle(
                    fontSize: 10,
                    color: isDark ? Colors.grey : Colors.black,
                  ),
                ),
                Text(
                  'Jul',
                  style: TextStyle(
                    fontSize: 10,
                    color: isDark ? Colors.grey : Colors.black,
                  ),
                ),
                Text(
                  'Aug',
                  style: TextStyle(
                    fontSize: 10,
                    color: isDark ? Colors.grey : Colors.black,
                  ),
                ),
                Text(
                  'Sep',
                  style: TextStyle(
                    fontSize: 10,
                    color: isDark ? Colors.grey : Colors.black,
                  ),
                ),
                Text(
                  'Oct',
                  style: TextStyle(
                    fontSize: 10,
                    color: isDark ? Colors.grey : Colors.black,
                  ),
                ),
                Text(
                  'Nov',
                  style: TextStyle(
                    fontSize: 10,
                    color: isDark ? Colors.grey : Colors.black,
                  ),
                ),
                Text(
                  'Dec',
                  style: TextStyle(
                    fontSize: 10,
                    color: isDark ? Colors.grey : Colors.black,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Activity grid
            _buildYearlyGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildTrackedRate() {
    return Center(
      child: SizedBox(
        width: 150,
        height: 150,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 150,
              height: 150,
              child: CircularProgressIndicator(
                value: 1.0,
                strokeWidth: 8,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '100%',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  'August',
                  style: TextStyle(
                    fontSize: 14,
                    color: isDark ? Colors.grey : Colors.black,
                  ),
                ),
                Text(
                  'Tracked Rate',
                  style: TextStyle(
                    fontSize: 14,
                    color: isDark ? Colors.grey : Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkStreaks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Work Streaks
        Text(
          'Work Streaks',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.grey : Colors.black,
          ),
        ),
        const SizedBox(height: 16),

        // Streak Info
        Row(
          children: [
            Icon(Icons.workspace_premium, color: Colors.blueAccent, size: 40),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Longest & Current',
                  style: TextStyle(
                    fontSize: 14,
                    color: isDark ? Colors.grey : Colors.black,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '29',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Days',
                      style: TextStyle(
                        fontSize: 16,
                        color: isDark ? Colors.grey : Colors.black,
                      ),
                    ),
                  ],
                ),
                Text(
                  '28 Jul 2024 - Today',
                  style: TextStyle(
                    fontSize: 14,
                    color: isDark ? Colors.grey : Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildYearlyGrid() {
    return SizedBox(
      height: 200,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 53,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        itemCount: 371, // 7 days * 53 weeks
        itemBuilder: (context, index) {
          // Highlight boxes for the current streak in July/August
          bool isHighlighted = false;

          // Simplified logic to match the image pattern
          int row = index ~/ 53;
          int col = index % 53;

          if (col >= 38 && col <= 41) {
            isHighlighted = true;
          }

          if (col == 37 && row == 4) {
            isHighlighted = true;
          }

          Color fillerColor =
              isDark ? Colors.grey.shade700 : Colors.grey.shade200;

          return Container(
            width: 5,
            height: 5,
            color: isHighlighted ? Colors.blue : fillerColor,
          );
        },
      ),
    );
  }
}
