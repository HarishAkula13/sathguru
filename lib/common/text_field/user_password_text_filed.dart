import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class UserPasswordTextField extends StatelessWidget {
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
  final  _iconStream;
  final _onChange;
  final Function(bool value)?  _onPressed;
  final _validationStream;
  final Widget? iconWidget;

  UserPasswordTextField(
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
        iconStream,
        onChange,onPressed, iconWidget,validationStream,controller})
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
        _iconStream = iconStream,
        _onPressed=onPressed,
        this.iconWidget=iconWidget,
        _validationStream = validationStream,
        this._controller=controller,
        _onChange = onChange {
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Container(
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
                  maxLines: linesLimit,
                  onChanged: _onChange,
                  cursorColor: Colors.black26,
                  style: TextStyle(fontSize: 16,color: Colors.black),
                  onSubmitted: _onSubmit,
                  obscureText:  obscureText,
                  focusNode: _focusNode,
                  inputFormatters: [
                    if (charactersLimit != null)
                      LengthLimitingTextInputFormatter(charactersLimit)
                  ],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintStyle: TextStyle(fontSize: 14,color: Colors.black.withOpacity(0.4)),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(width: 1,color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(width: 1,color: Colors.grey)),
                    labelStyle: TextStyle(fontSize: 14,color: Colors.black),
                    labelText: labelText,
                    hintText: hintText,
                    suffixIcon: IconButton(
                      icon: obscureText ? Icon(Icons.visibility_off_outlined,size: 20,color: Colors.black,) : Icon(Icons.visibility_outlined,size: 20,color: Colors.black),
                      onPressed:() => _onPressed!(obscureText ? false:true),


                    ),
                  ),
                ),
              ),
              /*  (snap.data.toString()!="")?Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(snap.data!, style: TextStyle(color: Colors.red,fontSize:10),),
            ):SizedBox()*/
            ],
          ),
        )


    );
  }
}