import 'package:flutter/material.dart';
import 'package:stack_board/stack_board.dart';

/// 自适应文本
class AdaptiveText extends StackBoardItem {
  const AdaptiveText(
    this.data, {
    ItemCaseController? controller,
    ItemCaseConfig? itemConfig,
    OperatState? operatState,
    this.style,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
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
          child: const SizedBox.shrink(),
          caseStyle: caseStyle,
          tapToEdit: tapToEdit ?? false,
        );

  /// 文本内容
  final String data;

  /// 文本样式
  final TextStyle? style;

  /// 文本对齐方式
  final TextAlign? textAlign;

  /// textDirection
  final TextDirection? textDirection;

  /// locale
  final Locale? locale;

  /// softWrap
  final bool? softWrap;

  /// overflow
  final TextOverflow? overflow;

  /// textScaleFactor
  final double? textScaleFactor;

  /// maxLines
  final int? maxLines;

  /// semanticsLabel
  final String? semanticsLabel;

  @override
  AdaptiveText copyWith({
    String? data,
    ItemCaseController? controller,
    ItemCaseConfig? itemConfig,
    OperatState? operatState,
    int? id,
    Widget? child,
    Function(bool)? onEdit,
    Future<bool> Function()? onDel,
    TextStyle? style,
    TextAlign? textAlign,
    TextDirection? textDirection,
    Locale? locale,
    bool? softWrap,
    TextOverflow? overflow,
    double? textScaleFactor,
    int? maxLines,
    String? semanticsLabel,
    CaseStyle? caseStyle,
    bool? tapToEdit,
  }) {
    return AdaptiveText(
      data ?? this.data,
      controller: this.controller,
      itemConfig: this.itemConfig,
      operatState: this.operatState,
      id: id ?? this.id,
      onDel: onDel ?? this.onDel,
      style: style ?? this.style,
      textAlign: textAlign ?? this.textAlign,
      textDirection: textDirection ?? this.textDirection,
      locale: locale ?? this.locale,
      softWrap: softWrap ?? this.softWrap,
      overflow: overflow ?? this.overflow,
      textScaleFactor: textScaleFactor ?? this.textScaleFactor,
      maxLines: maxLines ?? this.maxLines,
      semanticsLabel: semanticsLabel ?? this.semanticsLabel,
      caseStyle: caseStyle ?? this.caseStyle,
      tapToEdit: tapToEdit ?? this.tapToEdit,
    );
  }
}
