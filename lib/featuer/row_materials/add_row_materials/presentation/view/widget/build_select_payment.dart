import 'package:flutter/material.dart';

class CustomDropdownWithSearch extends StatefulWidget {
  final List<String> items;
  final String hintText;
  final Function(String)? onSelected;

  const CustomDropdownWithSearch({
    super.key,
    required this.items,
    this.hintText = 'طريقة الدفع',
    this.onSelected,
  });

  @override
  _CustomDropdownWithSearchState createState() =>
      _CustomDropdownWithSearchState();
}

class _CustomDropdownWithSearchState extends State<CustomDropdownWithSearch> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<String> _filteredItems = [];
  bool _showDropdown = false;

  @override
  void initState() {
    super.initState();
    _filteredItems = widget.items;
    _focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    setState(() {
      _showDropdown = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _controller,
          focusNode: _focusNode,
          decoration: InputDecoration(
            labelText: widget.hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            suffixIcon: const Icon(Icons.arrow_drop_down),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
          onChanged: _handleTextChanged,
          onTap: _handleTextFieldTap,
        ),
        if (_showDropdown && _filteredItems.isNotEmpty)
          Container(
            margin: const EdgeInsets.only(top: 4),
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: _filteredItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_filteredItems[index]),
                  onTap: () => _handleItemSelected(_filteredItems[index]),
                );
              },
            ),
          ),
      ],
    );
  }

  void _handleTextChanged(String value) {
    setState(() {
      _filteredItems = widget.items
          .where((item) => item.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
    widget.onSelected?.call(value);
  }

  void _handleTextFieldTap() {
    setState(() {
      _showDropdown = true;
    });
  }

  void _handleItemSelected(String value) {
    _controller.text = value;
    widget.onSelected?.call(value);
    setState(() {
      _showDropdown = false;
      _focusNode.unfocus();
    });
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}
