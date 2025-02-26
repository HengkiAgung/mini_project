import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/screen/detail_habit_screen.dart';

// ignore: must_be_immutable
class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});
  late bool isDark;

  @override
  Widget build(BuildContext context) {
    isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          isDark
              ? Color.fromARGB(255, 18, 18, 18)
              : Color.fromARGB(255, 246, 243, 247),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_buildWorkLogSection(), _buildInsights(context)],
        ),
      ),
    );
  }

  Widget _buildWorkLogSection() {
    return Container(
      color: isDark ? Colors.black : Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          _buildHeaderDashbord(),
          const SizedBox(height: 15),
          const Text(
            "Work Log Focus",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 20),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatItem("564", "Remaining"),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: CircularProgressIndicator(
                        value: 656 / 1220,
                        strokeWidth: 8,
                        backgroundColor:
                            isDark
                                ? Colors.grey.shade800
                                : Colors.grey.shade300,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.blueAccent,
                        ),
                      ),
                    ),
                    const Text(
                      "656\nWorking",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                _buildStatItem("1220", "Target"),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatusItem("Failed", 42, 77),
              _buildStatusItem("Progress", 20, 40),
              _buildStatusItem("Success", 85, 136),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  "Worked",
                  style: TextStyle(color: isDark ? Colors.black : Colors.white),
                ),
              ),
              const SizedBox(width: 10),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: isDark ? Colors.black : Colors.white,
                ),
                child: Text("Remaining"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderDashbord() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("SUNDAY, 26 AUGUST", style: TextStyle(fontSize: 13)),
        const Text(
          "Dashboard",
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildStatusItem(String label, int value, int target) {
    Color color = Colors.greenAccent;
    if (label == "Failed") {
      color = Colors.redAccent;
    } else if (label == "Progress") {
      color = Colors.orangeAccent;
    }
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 15)),
        const SizedBox(height: 5),
        // progress bar
        SizedBox(
          width: 100,
          child: LinearProgressIndicator(
            value: value / target,
            backgroundColor:
                isDark ? Colors.grey.shade800 : Colors.grey.shade300,
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          "$value / $target %",
          style: const TextStyle(color: Colors.white70, fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildInsights(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetailHabitScreen();
            },
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  "Insight & Analytics",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailHabitScreen();
                        },
                      ),
                    );
                  },
                  // icon: const Icon(Icons.more_horiz, ),
                  icon: const Icon(Icons.chevron_right_rounded, size: 30),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: _buildInsightCard(
                    "Expenditure",
                    totalTask: "1426",
                    date: "19 Aug - Now",
                    data: [
                      FlSpot(0, 3),
                      FlSpot(1, 2.5),
                      FlSpot(2, 2),
                      FlSpot(3, 1.8),
                      FlSpot(4, 1.5),
                      FlSpot(5, 1.3),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildInsightCard(
                    "Habits Trend",
                    totalTask: "1426",
                    date: "19 Aug - Now",
                    data: [
                      FlSpot(0, 3),
                      FlSpot(1, 2.5),
                      FlSpot(2, 2),
                      FlSpot(3, 1.8),
                      FlSpot(4, 1.5),
                      FlSpot(5, 1.3),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInsightCard(
    String title, {
    required String totalTask,
    required String date,
    required List<FlSpot> data,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey.shade900 : Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 15)),
          Text(
            date,
            style: TextStyle(
              color: isDark ? Colors.white70 : Colors.grey,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 50,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: data,
                    isCurved: true,
                    color: Colors.redAccent,
                    dotData: FlDotData(show: false),
                  ),
                ],
              ),
            ),
          ),
          // horizontal line
          const Divider(color: Colors.grey),
          Row(
            children: [
              Text(totalTask),
              const SizedBox(width: 5),
              Text(
                "Task",
                style: TextStyle(
                  color: isDark ? Colors.white70 : Colors.grey,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
