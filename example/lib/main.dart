import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:stack_board/stack_board.dart';
import 'package:stack_board_example/model/offset_model.dart';
import 'package:stack_board_example/model/sized_model.dart';
import 'package:stack_board_example/model/temp_model.dart';
import 'package:stack_board_example/model/widget_model.dart';

///自定义类型 Custom item type
class CustomItem extends StackBoardItem {
  const CustomItem({
    required this.color,
    Future<bool> Function()? onDel,
    ItemCaseController? controller,
    ItemCaseConfig? itemConfig,
    OperatState? operatState,
    int? id, // <==== must
  }) : super(
          controller: controller,
          itemConfig: itemConfig,
          operatState: operatState,
          child: const Text('CustomItem'),
          onDel: onDel,
          id: id, // <==== must
        );

  final Color? color;

  @override // <==== must
  CustomItem copyWith({
    ItemCaseController? controller,
    ItemCaseConfig? itemConfig,
    OperatState? operatState,
    CaseStyle? caseStyle,
    Widget? child,
    int? id,
    Future<bool> Function()? onDel,
    dynamic Function(bool)? onEdit,
    bool? tapToEdit,
    Color? color,
  }) =>
      CustomItem(
        controller: this.controller,
        itemConfig: this.itemConfig,
        operatState: this.operatState,
        onDel: onDel,
        id: id,
        color: color ?? this.color,
      );
}

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late StackBoardController _boardController;

  @override
  void initState() {
    super.initState();
    _boardController = StackBoardController();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _boardController.add(
        AdaptiveText(
          'INITIAL XXXXX',
          controller: ItemCaseController(),
          itemConfig: ItemCaseConfig(
              size: Size(333, 215), offset: Offset(39, 241), angle: 0.51),
          operatState: OperatState.complate,
          tapToEdit: true,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      );
    });
  }

  @override
  void dispose() {
    _boardController.dispose();
    super.dispose();
  }

  /// 删除拦截
  Future<bool> _onDel() async {
    final bool? r = await showDialog<bool>(
      context: context,
      builder: (_) {
        return Center(
          child: SizedBox(
            width: 400,
            child: Material(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 60),
                      child: Text('确认删除?'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        IconButton(
                            onPressed: () => Navigator.pop(context, true),
                            icon: const Icon(Icons.check)),
                        IconButton(
                            onPressed: () => Navigator.pop(context, false),
                            icon: const Icon(Icons.clear)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );

    return r ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Stack Board Demo'),
        elevation: 0,
      ),
      body: StackBoard(
        controller: _boardController,

        caseStyle: const CaseStyle(
          borderColor: Colors.grey,
          iconColor: Colors.white,
        ),

        /// 背景
        background: ColoredBox(color: Colors.grey[100]!),

        /// 点击取消全部选中状态
        /// tapToCancelAllItem: true,

        /// 如果使用了继承于StackBoardItem的自定义item
        /// 使用这个接口进行重构
        customBuilder: (StackBoardItem t) {
          if (t is CustomItem) {
            return ItemCase(
              key: Key('StackBoardItem${t.id}'), // <==== must
              isCenter: false,
              controller: t.controller,
              onDel: () async => _boardController.remove(t.id),
              onTap: () => _boardController.moveItemToTop(t.id),
              caseStyle: const CaseStyle(
                borderColor: Colors.grey,
                iconColor: Colors.white,
              ),
              child: Container(
                width: 100,
                height: 100,
                color: t.color,
                alignment: Alignment.center,
                child: const Text(
                  'Custom item',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          }

          return null;
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  const SizedBox(width: 25),
                  FloatingActionButton(
                    onPressed: () {
                      _boardController.add(
                        AdaptiveText(
                          'Flutter Candies',
                          controller: ItemCaseController(),
                          tapToEdit: true,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      );
                    },
                    child: const Icon(Icons.border_color),
                  ),
                  _spacer,
                  FloatingActionButton(
                    onPressed: () {
                      _boardController.add(
                        StackBoardItem(
                          controller: ItemCaseController(),
                          child: Image.network(
                              'https://avatars.githubusercontent.com/u/47586449?s=200&v=4'),
                        ),
                      );
                    },
                    child: const Icon(Icons.image),
                  ),
                  _spacer,
                  FloatingActionButton(
                    onPressed: () {
                      _boardController.add(
                        StackDrawing(
                          controller: ItemCaseController(),
                          caseStyle: const CaseStyle(
                            borderColor: Colors.grey,
                            iconColor: Colors.white,
                            boxAspectRatio: 1,
                          ),
                        ),
                      );
                    },
                    child: const Icon(Icons.color_lens),
                  ),
                  _spacer,
                  FloatingActionButton(
                    onPressed: () {
                      _boardController.add(
                        StackBoardItem(
                          controller: ItemCaseController(),
                          child: const Text(
                            'Custom Widget',
                            style: TextStyle(color: Colors.black),
                          ),
                          onDel: _onDel,
                          // caseStyle: const CaseStyle(initOffset: Offset(100, 100)),
                        ),
                      );
                    },
                    child: const Icon(Icons.add_box),
                  ),
                  _spacer,
                  FloatingActionButton(
                    onPressed: () {
                      _boardController.add<CustomItem>(
                        CustomItem(
                          controller: ItemCaseController(),
                          color: Color((math.Random().nextDouble() * 0xFFFFFF)
                                  .toInt())
                              .withOpacity(1.0),
                          onDel: () async => true,
                        ),
                      );
                    },
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
          ),
          FloatingActionButton(
            // onPressed: () => _boardController.getConfig(),
            onPressed: () {
              final List<WidgetModel> children2 = [];
              final TempModel tp = TempModel(
                  id: '123', name: 'test-template-model', children: children2);

              final List<StackBoardItem>? children =
                  _boardController.getAllChildren();
              children?.forEach((StackBoardItem element) {
                // if (element is CustomItem) {
                //   print(element.color);
                // } else if (element is AdaptiveText) {
                //   print(element.data);
                // } else if (element is StackDrawing) {
                //   debugPrint('StackDrawing Item');
                // } else if (element is StackBoardItem) {
                //   debugPrint('StackBoardItem Item');
                // } else {}

                final ItemCaseController? c = element.controller;
                final ItemCaseConfig x = c?.getConfig() as ItemCaseConfig;

                final OffsetModel offset =
                    OffsetModel(x: x.offset!.dx, y: x.offset!.dy);
                final SizedModel size =
                    SizedModel(width: x.size!.width, height: x.size!.height);
                final double angle = x.angle!;

                tp.children?.add(
                    WidgetModel(offset: offset, size: size, angle: angle));

                // debugPrint('====================${x.offset} ${x.size}');
              });

              final String ss = jsonEncode(tp.toJson());
              debugPrint(ss);
            },
            child: const Icon(Icons.save),
          ),
        ],
      ),
    );
  }

  Widget get _spacer => const SizedBox(width: 5);
}

class ItemCaseDemo extends StatefulWidget {
  const ItemCaseDemo({Key? key}) : super(key: key);

  @override
  _ItemCaseDemoState createState() => _ItemCaseDemoState();
}

class _ItemCaseDemoState extends State<ItemCaseDemo> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ItemCase(
          isCenter: false,
          child: const Text('Custom case'),
          onDel: () async {},
          onOperatStateChanged: (OperatState operatState) => null,
          onOffsetChanged: (Offset offset) => null,
          onSizeChanged: (Size size) => null,
        ),
      ],
    );
  }
}
