import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nectar_mac/App/Utils/Assets/app_images.dart';
import 'package:nectar_mac/Modules/Department/domain/Entities/department.dart';
import 'package:nectar_mac/Routes/index.dart';
import 'package:nectar_mac/views/Utils/constant.dart';
import 'package:nectar_mac/views/Utils/loading_widget.dart';
import 'package:nectar_mac/Modules/Product/presentation/Pages/Components/slider_product_item.dart';

import '../../../../../../views/widgets/Utils/error_widget.dart';
import '../../../../../../views/widgets/caursel_slider.dart';
import '../../../Product/presentation/Pages/groceries.dart';
import '../Bloc/department_bloc.dart';
import 'Components/search_card.dart';

class ShopTab extends StatelessWidget {
  const ShopTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSearchBar(context),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 0),
        child: ListView(
          children: const <Widget>[
            CaurselSlider(
              height: 115,
              fromAssets: false,
              images: [
                AppImages.carouselImage1,
                AppImages.carouselImage2,
                AppImages.carouselImage3,
              ],
            ),
            DepartmentsList(),
            //
            UtilsWidget.sizedBox15,
            DepartmentTitle(
              title: "Groceries",
            ),
            Groceries(),
          ],
        ),
      ),
    );
  }

  buildSearchBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height / 5.5,
      ),
      child: SearchCard(),
    );
  }
}

class DepartmentsList extends StatelessWidget {
  const DepartmentsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DepartmentBloc, DepartmentState>(
      // buildWhen: (previous, current) =>
      //     previous.DepartmentState != current.DepartmentState,
      builder: (context, state) {
        if (state is LoadingDepartmentsState) {
          return const LoadingWidget();
        } else if (state is LoadedDepartmentsState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...state.departments.map(
                (Department department) => DepartmentContainer(
                  department: department,
                ),
              ),
            ],
          );
        } else if (state is ErrorDepartmentsState) {
          return ErrorConnection(message: state.message);
        }
        return const LoadingWidget();
      },
    );
  }
}

class DepartmentContainer extends StatelessWidget {
  const DepartmentContainer({
    super.key,
    required this.department,
  });
  final Department department;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: DepartmentTitle(title: department.name),
        ),
        //
        // Loop For Department Products
        SizedBox(
          height: 250,
          width: double.infinity,
          child: ListView.builder(
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: department.products.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: SliderProductItem(
                  product: department.products[index]!,
                  heroTag: department.name,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class DepartmentTitle extends StatelessWidget {
  const DepartmentTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontSize: 26.0,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
            color: Theme.of(context).primaryColorDark,
          ),
        ),
        TextButton(
          child: InkWell(
            onTap: () => Navigator.pushNamed(
              context,
              RoutePages.categories,
            ),
            child: Text(
              "See all",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 16,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (BuildContext context) {
            //       return const TrendSection();
            //     },
            //   ),
            // );
          },
        ),
      ],
    );
  }
}
