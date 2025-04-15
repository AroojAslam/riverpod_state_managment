import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final count= StateProvider<int>((ref){
  return 0;
});
final switchButton = StateProvider<bool>((ref){
  return false;
});


class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(switchButton.notifier).state = true;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:const Text('Counter App'),
      ),
      body: Column(
        children: [
          Consumer(builder: (context, ref, child) {
            final counter= ref.watch(count);
            print('build3');
            return  Center(child: Text(counter.toString(),style: TextStyle(color: Colors.black,fontSize: 50),));
          },
          ), Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              ElevatedButton(onPressed: (){
                ref.read(count.notifier).state++;
              }, child: Text('+',style: TextStyle(fontSize: 30),)),
              ElevatedButton(onPressed: (){
                ref.read(count.notifier).state--;
              }, child: Text('-', style: TextStyle(fontSize: 30))),
            ],
          ),
          Consumer(builder: (context, ref, child) {
            final counter= ref.watch(switchButton);
            print('build2');
            return  Center(child: 
            Switch(value:counter , onChanged: (value){
            ref.read(switchButton.notifier).state=value;
            })
            );
          },
          )
        ],
      ),
    );
  }
}
// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context,WidgetRef ref) {
// print('build');
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title:const Text('Counter App'),
//       ),
//       body: Column(
//         children: [
//           Consumer(builder: (context, ref, child) {
//             final counter= ref.watch(count);
//             print('build2');
//             return  Center(child: Text(counter.toString(),style: TextStyle(color: Colors.black,fontSize: 50),));
//           },
//           ), Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//
//               ElevatedButton(onPressed: (){
//                 ref.read(count.notifier).state++;
//               }, child: Text('+',style: TextStyle(fontSize: 30),)),
//               ElevatedButton(onPressed: (){
//                 ref.read(count.notifier).state--;
//               }, child: Text('-', style: TextStyle(fontSize: 30))),
//             ],
//           ),
//
//         ],
//       ),
//     );
//   }
// }
