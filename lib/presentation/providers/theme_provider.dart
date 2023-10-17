import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// Listado de colores inmutable
final colorListProvider = Provider((ref) => colorList);

//Los state son para mantener una pieza de estado
// Un simple booleano
final isDarkmodeProvider = StateProvider((ref) => false);

// Un simple entero
final selectedColorProvider = StateProvider((ref) => 0);


//* El StateNotifierProvider permite tener un estado más complejo, ese estado 
//* es administrado por el ThemeNotifier, en ete caso el state es de tipo  AppTheme 



// Un objeto de tipo AppTheme (custom)
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

// Controller o Notifiers
class ThemeNotifier extends StateNotifier<AppTheme> {

  // STATE = Estado = nueva instancia del AppTheme = new AppTheme();
  ThemeNotifier(): super( AppTheme() );


  void toggleDarkmode() {
    state = state.copyWith( isDarkmode: !state.isDarkmode);
  }

  void changeColorIndex( int colorIndex ) {
    state = state.copyWith( selectedColor: colorIndex );
  }

}