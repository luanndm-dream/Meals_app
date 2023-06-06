    import 'package:flutter/material.dart';
    import 'package:meals/models/category.dart';
    import 'package:meals/data/dummy_data.dart';
    import 'package:meals/models/meal.dart';
    import 'package:meals/screens/meals.dart';
    import 'package:meals/widgets/category_grid_item.dart'; 

    class CategoriesScreen extends StatelessWidget {
      //Stateless vì k có bất cứ thứ gì thay đổi trên màn hình này

      const CategoriesScreen({super.key, required this.onToggleFavorite, required this.avaiableMeals});


        final void Function(Meal meal) onToggleFavorite;
        final List<Meal> avaiableMeals;

      void _selectedCategory(BuildContext context, Category category) {
        final filteredMeals =  avaiableMeals.where((meal) => meal.categories.contains(category.id)).toList();

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => MealsScreen(
              title: category.title,
              meals: filteredMeals,          
              onToggleFavorite: onToggleFavorite,
            ),
          ),
        );
      }

      @override
      Widget build(BuildContext context) {
        return GridView(
            padding: EdgeInsets.all(24),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // số lượng là 2 cột ngang
              childAspectRatio: 3 / 2, // tỉ lệ chiều rộng và cao giữ các con
              crossAxisSpacing: 20, // khoảng cách...
              mainAxisSpacing: 20, // khoảng cách giữa 2 row
            ),
            children: [
              //AvaiableCategories.map((category) =>CategoryGridItem(category: category)).toList(),
              for (final category in availableCategories)
                CategoryGridItem(category: category, onSelectCategory: (){
                  _selectedCategory(context, category);
                },)
            ],
        );
      }
    }
