import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderStatusRow extends StatefulWidget {
  final String orderStatus;
  final Color color;
  const OrderStatusRow({super.key, required this.orderStatus, required this.color});

  @override
  State<OrderStatusRow> createState() => _OrderStatusRowState();
}

class _OrderStatusRowState extends State<OrderStatusRow> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    Color? textColor = _checked ? Colors.black : Colors.grey[600]; // Lighter shade

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 100,
              width: 40,
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.orderStatus,
                style: GoogleFonts.sourceSans3(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 80,
            width: 40,
            decoration: const BoxDecoration(
              color: Color(0xFFDBDBDB),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Checkbox(
                value: _checked,
                onChanged: (bool? value) {
                  setState(() {
                    _checked = value!;
                  });
                },
                checkColor: Colors.white,
                activeColor: widget.color,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
