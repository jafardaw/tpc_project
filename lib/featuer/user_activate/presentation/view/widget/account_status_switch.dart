import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:tcp/constants/my_app_colors.dart';

class AccountStatusSwitch extends StatefulWidget {
  final bool initialStatus;
  final ValueChanged<bool> onChanged;
  final double width;
  final double height;

  const AccountStatusSwitch({
    super.key,
    required this.initialStatus,
    required this.onChanged,
    this.width = 120,
    this.height = 40,
  });

  @override
  State<AccountStatusSwitch> createState() => _AccountStatusSwitchState();
}

class _AccountStatusSwitchState extends State<AccountStatusSwitch> {
  late final ValueNotifier<bool> _controller;

  @override
  void initState() {
    super.initState();
    _controller = ValueNotifier(widget.initialStatus);
    _controller.addListener(_handleSwitchChange);
  }

  void _handleSwitchChange() {
    widget.onChanged(_controller.value);
  }

  @override
  void dispose() {
    _controller.removeListener(_handleSwitchChange);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AdvancedSwitch(
        controller: _controller,
        activeColor: Colors.green,
        inactiveColor: Colors.orange,
        width: widget.width,
        height: widget.height,
        activeChild: const _StatusLabel(
          text: 'مفعل',
          icon: Icons.check_circle,
        ),
        inactiveChild: const _StatusLabel(
          text: 'غير مفعل',
          icon: Icons.cancel,
        ),
        thumb: ValueListenableBuilder<bool>(
          valueListenable: _controller,
          builder: (_, value, __) {
            return Container(
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: MyAppColors.kGrayscaleDark100.withValues(alpha: 0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                value ? Icons.check : Icons.close,
                color: value ? Colors.green : Colors.orange,
                size: 20,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _StatusLabel extends StatelessWidget {
  final String text;
  final IconData icon;

  const _StatusLabel({
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 16, color: Colors.white),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool _isAccountActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('حالة الحساب'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'حالة الحساب:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    AccountStatusSwitch(
                      initialStatus: _isAccountActive,
                      onChanged: (bool value) {
                        setState(() {
                          _isAccountActive = value;
                        });
                        // هنا يمكنك إضافة منطق تحديث الحالة في الخادم
                        _updateAccountStatus(value);
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              _isAccountActive
                  ? 'الحساب مفعل حالياً'
                  : 'الحساب غير مفعل حالياً',
              style: TextStyle(
                fontSize: 18,
                color: _isAccountActive ? Colors.green : Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _updateAccountStatus(bool isActive) async {
    // هنا يمكنك إضافة كود الاتصال بالخادم لتحديث الحالة
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isActive ? 'تفعيل الحساب' : 'تعطيل الحساب'),
        content:
            Text('هل أنت متأكد من ${isActive ? 'تفعيل' : 'تعطيل'} الحساب؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content:
                      Text('تم ${isActive ? 'تفعيل' : 'تعطيل'} الحساب بنجاح'),
                  backgroundColor: isActive ? Colors.green : Colors.orange,
                ),
              );
            },
            child: const Text('تأكيد'),
          ),
        ],
      ),
    );
  }
}
