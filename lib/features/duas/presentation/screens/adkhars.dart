import 'package:dua_zekr/core/widgets/app_bar.dart';
import 'package:dua_zekr/core/widgets/loading.dart';
import 'package:dua_zekr/features/duas/presentation/logic/all_duas_cate_cubit.dart';
import 'package:dua_zekr/features/duas/presentation/screens/widgets/adhkar_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/adhkar_model.dart';

class AdhkarListScreen extends StatelessWidget {

  const AdhkarListScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "الأذكار"),
      body: BlocBuilder<AllDuasCateCubit, AllDuasCateState>(
        builder: (context, state) {
          if(state.isLoading){
            return SharedLoading();
          }
          if(state.error!=null){
            return Center(child: Text(state.error!));
          }
          List<Adhkar> adhkar = state.data;
          return ListView.separated(
            itemCount: adhkar.length,
            padding: const EdgeInsets.symmetric(vertical: 12),
            separatorBuilder: (_, __) => const SizedBox(height: 4),
            itemBuilder: (context, index) {
              return ModernAdhkarCard(adhkar: adhkar[index],index:index);
            },
          );
        },
      ),
    );
  }
}
