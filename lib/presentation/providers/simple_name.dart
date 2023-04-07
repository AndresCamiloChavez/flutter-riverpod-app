import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/config/config.dart';


//Solo lectura
/*Provider.autoDispose se cierra la pantalla o donde se esta utilizando se limpia
se crea una nueva instancia cada vez que se abre la pantalla pero se elimina la anterior
*/
final simpleNameProvider = Provider.autoDispose<String>((ref) { 
  return RandomGenerator.getRandomName();
});