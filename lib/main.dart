import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

 void main(){
   runApp(MyApp());
 }

 class MyApp extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       title:"NOT DEFTERİ",
       debugShowCheckedModeBanner: false,
       theme:ThemeData(primarySwatch: Colors.deepPurple),
       home:NoteList() ,
      
     );
   }
 }

 class NoteList extends StatefulWidget{
   


   @override
   State<StatefulWidget> createState(){
     return  NoteListState();
   }
 }

 class NoteListState extends State<NoteList> {
int count=0;

   @override
   Widget build(BuildContext context) {
     return Scaffold(appBar:AppBar(title:Text("Notes"),),
     body:getNoteListView(),
     floatingActionButton: FloatingActionButton(onPressed:(){
       debugPrint('FAB Clicked');
     },
     tooltip: 'Not Ekle',
     child:Icon(Icons.add),
     )

     );
   }
   ListView getNoteListView() {
     TextStyle titleStyle=Theme.of(context).textTheme.subtitle;
     return ListView.builder(
       itemCount:count,
       itemBuilder:(BuildContext context,int position) {
         return Card( 
           color:Colors.white,
           elevation:2.0,
           child:ListTile(
             leading:CircleAvatar(
               backgroundColor: Colors.red,
               child:Icon(Icons.keyboard_arrow_right),
             ),
             title:Text('Dummy Title', style:titleStyle,),
             subtitle: Text("Dummy Date"),
             trailing:Icon(Icons.delete,color:Colors.grey,),
             onTap: () {
               debugPrint("ListTile Tapped");
             },

           ),

         );

       }
     ,);
   }
 }
 
 class NoteDetail extends StatefulWidget{
   @override 
   State<StatefulWidget> createState() {
     return NoteDetailState();
   }
 }


 class NoteDetailState extends State<NoteDetail> {
   static var _priorities=['Yukarı','Aşağı'];
   TextEditingController titleController=TextEditingController();
   TextEditingController descriptionController=TextEditingController();





   @override 
   Widget build(BuildContext context) {
     
     TextStyle textStyle=Theme.of(context).textTheme.title;



     return Scaffold(
       appBar:AppBar(
         title:Text('Not Düzenle'),

       ),
       body:Padding(
         padding:EdgeInsets.only(top:15.0,left:10.0,right:10.0),
         child:ListView(
           children:<Widget>[
             ListTile(
               title:DropdownButton(
                 items:_priorities.map((String dropDownStringItem) {
                   return DropdownMenuItem<String>(
                     value:dropDownStringItem,
                     child:Text(dropDownStringItem),

                   );
                 }).toList(),
                 style:textStyle,

                 value:'Low' ,
                 onChanged:(value) {
                   setState((){
                     debugPrint('User selected $value');
                   });

                 }
               ),
             ),
             //second element

             Padding(padding: EdgeInsets.only(top:15.0,bottom:15.0),
             child:TextField(
               controller:titleController,
               style:textStyle,
               onChanged:(value) {
                 debugPrint('Metin alanında değişiklikler yapıldı.');

               },
               decoration:InputDecoration(
                 labelText:'Konu',
                 labelStyle:textStyle,
                 border:OutlineInputBorder(
                   borderRadius: BorderRadius.circular(5.0)
                 ),

               ),
             ),

             ),
             //third element
           

              Padding(
                padding: EdgeInsets.only(top:15.0,bottom:15.0),
                child:TextField(
                  controller:descriptionController,
                  style:textStyle,
                  onChanged:(value) {
                    debugPrint('Metin alanında değişiklikler yapıldı.');

               },
                  decoration:InputDecoration(
                      labelText:'Metin',
                      labelStyle:textStyle,
                      border:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)
                 )

               ),
             ),

             ),

             // Fourth Element
				    Padding(
					    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
					    child: Row(
						    children: <Widget>[
						    	Expanded(
								    child: RaisedButton(
									    color: Theme.of(context).primaryColorDark,
									    textColor: Theme.of(context).primaryColorLight,
									    child: Text(
										    'Save',
										    textScaleFactor: 1.5,
									    ),
									    onPressed: () {
									    	setState(() {
									    	  debugPrint("Save button clicked");
									    	});
									    },
								    ),
							    ),

							    Container(width: 5.0,),

							    Expanded(
								    child: RaisedButton(
									    color: Theme.of(context).primaryColorDark,
									    textColor: Theme.of(context).primaryColorLight,
									    child: Text(
										    'Delete',
										    textScaleFactor: 1.5,
									    ),
									    onPressed: () {
										    setState(() {
											    debugPrint("Delete button clicked");
										    });
									    },
								    ),
							    ),

						    ],
					    ),
				    ),

			    ],
		    ),
	    ),

    );
  }
}
