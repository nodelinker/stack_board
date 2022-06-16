import 'package:flutter/material.dart';
import 'package:stack_board/stack_board.dart';

/// 画板
class StackDrawing extends StackBoardItem {
  const StackDrawing({
    ItemCaseController? controller,
    ItemCaseConfig? itemConfig,
    OperatState? operatState,
    this.size = const Size(260, 260),
    Widget background = const SizedBox(width: 260, height: 260),
    final int? id,
    final Future<bool> Function()? onDel,
    CaseStyle? caseStyle,
    bool? tapToEdit,
  }) : super(
          controller: controller,
          itemConfig: itemConfig,
          operatState: operatState,
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
    ItemCaseConfig? itemConfig,
    OperatState? operatState,
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
      itemConfig: this.itemConfig,
      operatState: this.operatState,
      background: child ?? this.child,
      id: id ?? this.id,
      onDel: onDel ?? this.onDel,
      caseStyle: caseStyle ?? this.caseStyle,
      size: size ?? this.size,
      tapToEdit: tapToEdit ?? this.tapToEdit,
    );
  }
}
