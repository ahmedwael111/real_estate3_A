import 'package:flutter/material.dart';


class OrderStatusBadge extends StatelessWidget {
  final String status;

  const OrderStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final config = _getConfig(status);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: config.bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        config.label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: config.text,
        ),
      ),
    );
  }

  _StatusConfig _getConfig(String status) {
    switch (status.toLowerCase()) {
      case 'paid':
      case 'completed':
        return _StatusConfig(
          label: 'Paid',
          bg: const Color(0xFFE8F5E9),
          text: const Color(0xFF2E7D32),
        );
      case 'cancelled':
      case 'failed':
        return _StatusConfig(
          label: 'Failed',
          bg: const Color(0xFFFFEBEE),
          text: const Color(0xFFC62828),
        );
      case 'pending':
      default:
        return _StatusConfig(
          label: 'Pending',
          bg: const Color(0xFFFFF8E1),
          text: const Color(0xFFF57F17),
        );
    }
  }
}

class _StatusConfig {
  final String label;
  final Color bg;
  final Color text;
  _StatusConfig({required this.label, required this.bg, required this.text});
}
