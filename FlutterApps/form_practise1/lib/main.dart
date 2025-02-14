import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget
{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build( BuildContext context ){
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Check'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _controller,
            keyboardType: TextInputType.numberWithOptions(decimal: true ,signed: false),
            decoration: InputDecoration(
              label: Text('UserName'),
              hintText: 'Enter you username',
              border: OutlineInputBorder()
            ),
            onSubmitted: (value){print('Submitted $value');},
          ),
          ElevatedButton(onPressed: (){print('${_controller.text}');
    }, child: Text('Submit')),
    SizedBox(height: 10,),
    ElevatedButton(onPressed: () => Navigator.push(context,
    MaterialPageRoute(builder:(context) => ListPage())), child: const Text('Next ')),
    ElevatedButton(onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => DatePage())), child: const Text('Date Page')),
    ElevatedButton(onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => dismissible())) , child: const Text('Dismissible'))
        ],
      ),
    );
  }
}

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

 List<String> Selected = [];
 final TextEditingController _controller = TextEditingController();

final List<String> movies = [
  'Inception',
  'Titanic',
  'Gladiator',
  'Avatar',
  'Jaws',
  'Frozen',
  'Dune',
  'Crash',
  'Memento',
  'Gravity',
  'Interstellar',
  'Predator',
  'Aladdin',
  'Twister',
  'Scarface',
  'Skyfall',
  'Godzilla',
  'Birdman',
  'Whiplash'
];

@override
  void initState() {
    // TODO: implement initState
    Selected = List.from(movies);
    super.initState();
  }

void _list(String text){
  setState(() {
    
  if( text.isEmpty){
    Selected = movies;
  }
  else{
    Selected = movies.where((e) => e.toLowerCase().contains(text.toLowerCase())).toList();
  }
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' List Filter '),
      ),

    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            onChanged: (text) => _list(_controller.text),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: Selected.length,
              itemBuilder: (context,index){
              return Card(
                child: ListTile(
                  title: Text(Selected[index],textAlign: TextAlign.center,),
                ),
              );
            }),
          ),
        ],
      ),
    ),
      
    );
  }
}

class DatePage extends StatefulWidget {
  const DatePage({super.key});

  @override
  State<DatePage> createState() => _DatePageState();
}

class _DatePageState extends State<DatePage> {
  DateTime? SelectedDate;
  TimeOfDay? SelectedTime;
  double _value = 10;

  @override
  Widget build(BuildContext context) {
    var date = SelectedDate;
    var time = SelectedTime;
    return Scaffold(
      appBar: AppBar(
        title: Text('Date'),
        backgroundColor: Colors.blue[800],
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectableText(date == null ? 'You have not selected date yet' : '${DateFormat.yMMMMd('en-us').format(date)}',
            style:TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
            ElevatedButton.icon(onPressed: ()async{
              var pickDate = await showDatePicker(
                context: context,
                initialEntryMode: DatePickerEntryMode.calendarOnly,
                firstDate: DateTime(2000),
                lastDate:DateTime(2030),
                initialDate: DateTime.now());
              setState(() {
                SelectedDate = pickDate;
              });
            }, label: const Text('Pick a date'),
            icon: Icon(Icons.calendar_today),),

            SizedBox(height: 40,),

            Text( time == null ? ' No time added yet ' : '${time.format(context)}',
            style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

            ElevatedButton.icon(onPressed: ()async{
              var pickedTime = await showTimePicker(
              context: context,
              initialEntryMode: TimePickerEntryMode.dial,
              initialTime: TimeOfDay.now());

              setState(() {
                SelectedTime = pickedTime;
              });
            }, label: const Text('Time'),
            icon:Icon(Icons.tiktok),),

            SizedBox(height: 40,),

            Text('Enter your age range'),

            Slider(value: _value,
            label: _value.round().toString(),
            onChanged: (value) {
              setState(() {
              _value = value;
            });},
            max: 50,
            min: 5,
            divisions: 9,)
            ],
        ),
      ),
    );
  }
}

class dismissible extends StatefulWidget {
  const dismissible({super.key});

  @override
  State<dismissible> createState() => _dismissibleState();
}

class _dismissibleState extends State<dismissible> {
  List<int> _items = List<int>.generate(60,( int index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dismissible'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(itemCount: _items.length,
      itemBuilder: (context,index){
        return Dismissible(
          background: Container(color:Colors.red),
          key: ValueKey(_items[index]),
          onDismissed: (direction) {
            setState(() {
              _items.removeAt(index);
            });
          },
          child: Card(child: ListTile(title: Text('Item :  ${_items[index] + 1}'),)));
      }),
    );
  }
}