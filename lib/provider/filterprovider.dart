
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FilterNotifier extends StateNotifier<Map<Filter,bool>>{
  FilterNotifier() : super({
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false,
  });

  void setfilter(Filter filter , bool isActive){
    state={
      ...state,filter : isActive,
    };
  }
void setfilters(Map<Filter,bool> choosenfilter){
    state=choosenfilter;
    print('setting state of filter');
}

}

//creating varible of provider  of StateNotifierProvider class  defining data type
final filtermealProvider = StateNotifierProvider<FilterNotifier,Map<Filter,bool>>((ref) {
  return FilterNotifier();     //returing instance of FilterNotiferclass
});