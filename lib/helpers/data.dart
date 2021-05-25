import 'package:newsapp/models/catmodel.dart';


//Fecthes Images for Category
List<CategoryModel> getCategories()
{
  List<CategoryModel> category = [];
   CategoryModel categorymodel=new CategoryModel();

   //This function is basically for  getting those images from network and fetching the data and storing it


//General
  categorymodel.imageUrl="https://images.unsplash.com/photo-1585829365295-ab7cd400c167?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80";
  categorymodel.catName="General";
  category.add(categorymodel);
  categorymodel=new CategoryModel();

  //Business
  categorymodel.imageUrl='https://images.unsplash.com/photo-1444653614773-995cb1ef9efa?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1055&q=80';
  categorymodel.catName="Business";
  category.add(categorymodel);
  categorymodel=new CategoryModel();

  //Technology
categorymodel.imageUrl="https://images.unsplash.com/photo-1518770660439-4636190af475?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80";
categorymodel.catName="Technology";
category.add(categorymodel);
categorymodel=new CategoryModel();

//Sports
categorymodel.imageUrl="https://images.unsplash.com/photo-1471295253337-3ceaaedca402?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1048&q=80";
categorymodel.catName="Sports";
category.add(categorymodel);
categorymodel=new CategoryModel();

//Entertainment
categorymodel.imageUrl="https://images.unsplash.com/photo-1616469829526-7057a1427626?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80";
categorymodel.catName="Entertainment";
category.add(categorymodel);
categorymodel=new CategoryModel();



return category;
}

