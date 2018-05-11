import 'package:helloforms/View.dart';

abstract class Presenter<T extends View> {
  initState(T view);
}