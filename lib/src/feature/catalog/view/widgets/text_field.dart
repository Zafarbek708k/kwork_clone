import "package:kwork_clone/src/core/constants/all_library.dart";

class TF extends StatefulWidget {
  const TF({super.key, required this.controller, this.hintText, this.isPassword = false});

  final TextEditingController controller;
  final String? hintText;
  final bool isPassword;

  @override
  State<TF> createState() => _TFState();
}

class _TFState extends State<TF> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      cursorColor: context.appTheme.secondary,
      obscureText: widget.isPassword ? _obscureText : false, // Only obscure text for passwords
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: context.appTheme.primary.withOpacity(0.5),
        hintStyle: TextStyle(color: context.appTheme.secondary),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: _obscureText ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                onPressed: () => setState(() {
                  _obscureText = !_obscureText;
                }),
              ) : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Colors.grey.shade700)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: const BorderSide(color: Colors.black)),
      ),
    );
  }
}
