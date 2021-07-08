import 'package:actividad_05/models/thumbnail.dart';
import 'package:actividad_05/services/marvel_api_service.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  var searchText = ''.obs;
  var searchResults = [].obs;

  changeSearchText(newSearchText) {
    searchText.value = newSearchText;
    update();
    // MarvelApiService().getAllComics(queryParams: {
    //   "orderBy": "-modified",
    //   "titleStartsWith": newSearchText
    // }).then((response) {
    //   searchResults.value = response.data.results
    //       .map<Thumbnail>((item) => item.thumbnail)
    //       .toList();
    //   update();
    // });
  }
}
