import 'package:flutter/material.dart';
import 'package:stack_board/src/case_group/item_case.dart';
import 'package:stack_board/src/helper/case_style.dart';

import 'stack_board_item.dart';

/// 画板
class StackDrawing extends StackBoardItem {
  const StackDrawing({
    ItemCaseController? controller,
    this.size = const Size(260, 260),
    Widget background = const SizedBox(width: 260, height: 260),
    final int? id,
    final Future<bool> Function()? onDel,
    CaseStyle? caseStyle,
    bool? tapToEdit,
  }) : super(
          controller: controller,
          id: id,
          onDel: onDel,
          child: background,
          caseStyle: caseStyle,
          tapToEdit: tapToEdit ?? false,
        );

  /// 画布初始大小
  final Size size;

  @override
  StackDrawing copyWith({
    ItemCaseController? controller,
    int? id,
    Widget? child,
    Function(bool)? onEdit,
    Future<bool> Function()? onDel,
    CaseStyle? caseStyle,
    Size? size,
    bool? tapToEdit,
  }) {
    return StackDrawing(
      controller: this.controller,
      background: child ?? this.child,
      id: id ?? this.id,
      onDel: onDel ?? this.onDel,
      caseStyle: caseStyle ?? this.caseStyle,
      size: size ?? this.size,
      tapToEdit: tapToEdit ?? this.tapToEdit,
    );
  }
}
