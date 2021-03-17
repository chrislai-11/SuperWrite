import 'package:fltwrite/store/file.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> storeProviders = [Provider(create: (_) => FileStore)];
