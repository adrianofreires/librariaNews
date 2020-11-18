import 'package:libraria_news/data/providers/post_provider.dart';
import 'package:meta/meta.dart';

class PostRepository {

final ApiClient apiClient;

PostRepository({@required this.apiClient}) : assert(apiClient != null);

getAll(){
  return apiClient.getAll();
}
getId(id){
  return apiClient.getId(id);
}
delete(id){
  return apiClient.delete(id);
}
edit(obj){
  return apiClient.edit( obj );
}
add(obj){
    return apiClient.add( obj );
}

}