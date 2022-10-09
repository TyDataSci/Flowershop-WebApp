import '../utils/config.dart';

class Host{
  String get url => configuration['host'];
}
class InventoryHost{
  String get url => configuration['inventory-host'];
}