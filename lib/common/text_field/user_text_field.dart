import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class UserTextField extends StatelessWidget {
  final TextEditingController? _controller;
  final labelText;
  final hintText;
  final initialText;
  final obscureText;
  final double height;
  final inputAction;
  final keyboardType;
  final int linesLimit;
  final int? charactersLimit;
  final _focusNode;
  final _onSubmit;
  final _validationStream;
  final _onChange;
  final bool? readOnly;
  final Widget? iconWidget;
  final Widget? iconWidget1;


  UserTextField(
      {labelText,
        hintText = '',
        initialText = '',
        obscureText = false,
        height = 50.0,
        inputAction,
        keyboardType,
        charactersLimit,
        linesLimit = 1,
        focusNode,
        onSubmit,
        validationStream,
        onChange,readOnly,iconWidget,iconWidget1,controller})
      : this.labelText = labelText,
        this.hintText = hintText,
        this.initialText = initialText,
        this.obscureText = obscureText,
        this.height = height,
        this.inputAction = inputAction,
        this.charactersLimit=charactersLimit,
        this.linesLimit = linesLimit,
        this.keyboardType = keyboardType,
        _focusNode = focusNode,
        _onSubmit = onSubmit,
        _validationStream = validationStream,
        this.iconWidget=iconWidget,
        this.iconWidget1=iconWidget1,
        this._controller=controller,
        this.readOnly=readOnly,
        _onChange = onChange {
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: StreamBuilder<String>(
        initialData: '',
        stream: _validationStream,
        builder: (c, s) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    height: 50,
                    child: TextField(
                      enableInteractiveSelection: false,
                      toolbarOptions: ToolbarOptions(
                        copy: false,
                        cut: false,
                        paste: false,
                        selectAll: false,
                      ),
                      controller: _controller,
                      keyboardType: keyboardType,
                      textInputAction: inputAction,
                      cursorColor: Colors.black26,
                      maxLines: linesLimit,
                      readOnly: (readOnly!=null)?readOnly!:false,
                      onChanged: _onChange,
                      style: TextStyle(fontSize: 16,color: Colors.black),
                      onSubmitted: _onSubmit,
                      obscureText: obscureText,
                      focusNode: _focusNode,
                      inputFormatters: [
                        if (charactersLimit != null)
                          LengthLimitingTextInputFormatter(charactersLimit)
                      ],
                      decoration: InputDecoration(
                        suffixIcon: iconWidget,
                        prefixIcon: iconWidget1,
                        border: OutlineInputBorder(),
                        hintStyle: TextStyle(fontSize: 14,color: Colors.black.withOpacity(0.4)),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(width: 1,color: Colors.grey)),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(width: 1,color: Colors.grey)),
                        labelStyle: TextStyle(fontSize: 14,color: Colors.black),
                        labelText: labelText,
                        hintText: hintText,
                      ),)
                ),

              ],
            ),
          );
        },
      ),
    );
  }
}