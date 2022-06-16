import 'package:flutter/widgets.dart';
import 'package:stack_board/stack_board.dart';

/// 自定义对象
@immutable
class StackBoardItem {
  const StackBoardItem({
    this.controller,
    this.itemConfig,
    this.operatState,
    required this.child,
    this.id,
    this.onDel,
    this.caseStyle,
    this.tapToEdit = false,
  });

  final ItemCaseController? controller;

  // 初始配置信息
  final ItemCaseConfig? itemConfig;

  // 初始状态
  final OperatState? operatState;

  /// item id
  final int? id;

  /// 子控件
  final Widget child;

  /// 移除回调
  final Future<bool> Function()? onDel;

  /// 外框样式
  final CaseStyle? caseStyle;

  /// 点击进行编辑
  final bool tapToEdit;

  /// 对象拷贝
  StackBoardItem copyWith({
    int? id,
    ItemCaseController? controller,
    ItemCaseConfig? itemConfig,
    OperatState? operatState,
    Widget? child,
    Future<bool> Function()? onDel,
    CaseStyle? caseStyle,
    bool? tapToEdit,
  }) =>
      StackBoardItem(
        controller: this.controller,
        itemConfig: this.itemConfig,
        operatState: this.operatState,
        id: id ?? this.id,
        child: child ?? this.child,
        onDel: onDel ?? this.onDel,
        caseStyle: caseStyle ?? this.caseStyle,
        tapToEdit: tapToEdit ?? this.tapToEdit,
      );

  /// 对象比较
  bool sameWith(StackBoardItem item) => item.id == id;

  @override
  bool operator ==(Object other) => other is StackBoardItem && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
