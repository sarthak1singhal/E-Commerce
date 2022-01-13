import 'package:fix_feels/DataClasses/Categories.dart';

class CategoriesModel{




  List<Categories3> list2 = [
    Categories3(Categories("Accessories","assets/categories/category1.png",''),
      Categories("Accessories","assets/categories/category2.png",''),
      Categories("Accessories","assets/categories/category3.png",''),),

    Categories3( Categories("Accessories","assets/categories/category4.png",''),
      Categories("Accessories","assets/categories/category5.png",''),
      Categories("Accessories","assets/categories/category6.png",''),),

    Categories3(Categories("Accessories","assets/categories/category7.png",''),
      Categories("Accessories","assets/categories/category8.png",''),
      Categories("Accessories","assets/categories/category9.png",''),),

    Categories3(Categories("Accessories","assets/categories/category10.png",''),
      Categories("Accessories","assets/categories/category8.png",''),
      Categories("Accessories","assets/categories/category9.png",''),)

  ];

  List<Categories3> getCategories3(){
    return list2;
  }



}


