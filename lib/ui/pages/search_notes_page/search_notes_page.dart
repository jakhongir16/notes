import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_hive/domain/hive/hive_box.dart';
import 'package:notes_hive/domain/hive/hive_data.dart';
import 'package:notes_hive/ui/theme/app_colors.dart';
import 'package:notes_hive/ui/theme/app_style.dart';
import 'package:notes_hive/ui/widgets/card_widget.dart';

class SearchNotesPage extends StatefulWidget {
  const SearchNotesPage({super.key});

  @override
  State<SearchNotesPage> createState() => _SearchNotesPageState();
}

class _SearchNotesPageState extends State<SearchNotesPage> {
  final searchController = TextEditingController();
  final _notes = HiveBoxes.notes.values.toList();
  var filteredNotes = <NotesData>[];
  
  
  Future<void> deleteText() async{
    searchController.clear();
  }
  
  
  
  
  void _searchNotes(){
    final query = searchController.text;
    if(query.isNotEmpty){
      filteredNotes = _notes.where((NotesData notesList){
        return notesList.title.toLowerCase().contains(query.toLowerCase()) || notesList.text.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else{
      filteredNotes = _notes;
    }
    setState(() {});
  }
  
  
  @override
  void initState() {
    filteredNotes = _notes;
    searchController.addListener(_searchNotes);
    super.initState();
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: 
        const Icon(
          Icons.arrow_back, color: AppColors.blackColor,), 
          onPressed: (){
            Navigator.pop(context);
          },
          ),
          backgroundColor: AppColors.backgroundColor,
          title: TextField(
            controller: searchController,
            cursorColor: AppColors.blackColor,
            style: AppStyle.fontStyle,
            decoration: const InputDecoration(
              hintText: 'Поиск...',
              hintStyle: AppStyle.fontStyle,
              border: OutlineInputBorder(
                borderSide: BorderSide.none
              ),
            ),
          ),
          actions: [
            IconButton(onPressed: deleteText, icon: const Icon(Icons.close, color: AppColors.blackColor,),),
          ],
      ),
      body: ValueListenableBuilder(valueListenable: HiveBoxes.notes.listenable(),
      builder: (context, Box<NotesData> box, child){
        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index){
            final note = filteredNotes[index];
            return CardWidget(
              index: index, 
              title: note.title, 
              data: note.date, 
              text: note.text,
            
            );
          }, 
          separatorBuilder: (_, __)=>  const SizedBox(height: 16), 
          itemCount: filteredNotes.length);
      },
      ),
    );
  }
}