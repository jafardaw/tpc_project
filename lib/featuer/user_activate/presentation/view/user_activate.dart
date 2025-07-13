import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tcp/constants/my_app_colors.dart';
import 'package:tcp/core/util/style.dart';
import 'package:tcp/core/util/widget/custom_text_field.dart';
import 'package:tcp/featuer/row_materials/add_row_materials/presentation/view/widget/clip_r_rict_widget.dart';
import 'package:tcp/featuer/user_activate/presentation/view/widget/account_status_switch.dart';

class UserActivationPage extends StatefulWidget {
  const UserActivationPage({super.key});

  @override
  UserActivationPageState createState() => UserActivationPageState();
}

class UserActivationPageState extends State<UserActivationPage> {
  final List<Map<String, dynamic>> _users = [
    {
      'id': '1',
      'name': 'أحمد محمد',
      'email': 'ahmed@example.com',
      'phone': '+966501234567',
      'status': 'pending',
      'registeredAt': '2023-05-15',
    },
    {
      'id': '2',
      'name': 'سارة علي',
      'email': 'sara@example.com',
      'phone': '+966501234568',
      'status': 'pending',
      'registeredAt': '2023-05-16',
    },
    {
      'id': '3',
      'name': 'خالد عبدالله',
      'email': 'khaled@example.com',
      'phone': '+966501234569',
      'status': 'active',
      'registeredAt': '2023-05-10',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              MyAppColors.kPrimary.withValues(alpha: 0.05),
            ],
          ),
        ),
        child: Column(
          children: [
            Align(alignment: Alignment.topLeft, child: ClipRRectWiget()),
            _buildFilterCard(),
            SizedBox(height: 12.h),

            // Users List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _users.length,
                itemBuilder: (context, index) {
                  final user = _users[index];
                  return _buildUserCard(user);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterCard() {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
                child: CustomTextField(
              hint: 'ابجث عن  مستخدم...',
              hintText: 'ابجث عن  مستخدم...',
              label: Text('بحث...'),
              prefixIcon: Icon(Icons.search),
              suffixIcon: Icon(Icons.person_outline),
            )),
            const SizedBox(width: 10),
            PopupMenuButton<String>(
              icon: Icon(Icons.filter_list, color: MyAppColors.kPrimary),
              itemBuilder: (context) => [
                const PopupMenuItem(value: 'all', child: Text('الكل')),
                const PopupMenuItem(
                    value: 'pending', child: Text('بانتظار التنشيط')),
                const PopupMenuItem(value: 'active', child: Text('مفعل')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserCard(Map<String, dynamic> user) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: MyAppColors.kPrimary.withValues(alpha: 0.2),
                  child: Icon(Icons.person, color: MyAppColors.kPrimary),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user['name'],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(height: 4),
                      Text(user['email'],
                          style: AppTextStyles.calibri13ItalicGrey600),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: user['status'] == 'active'
                        ? Colors.green.withValues(alpha: 0.2)
                        : Colors.orange.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    user['status'] == 'active' ? 'مفعل' : 'بانتظار التنشيط',
                    style: TextStyle(
                      color: user['status'] == 'active'
                          ? Colors.green
                          : Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.phone, size: 18, color: MyAppColors.kPrimary),
                const SizedBox(width: 8),
                Text(user['phone']),
                const Spacer(),
                Icon(Icons.calendar_today,
                    size: 18, color: MyAppColors.kPrimary),
                const SizedBox(width: 8),
                Text(user['registeredAt']),
              ],
            ),
            const SizedBox(height: 16),
            // if (user['status'] == 'pending')
            AccountStatusSwitch(
              initialStatus: true,
              onChanged: (bool value) {},
            )
          ],
        ),
      ),
    );
  }
}
