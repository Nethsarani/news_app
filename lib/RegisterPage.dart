late	DatabaseHandler	handler;

@override
void	initState()	{
  super.initState();
  handler	=	DatabaseHandler();
}

body:	Padding(
  padding:	const	EdgeInsets.only(left:	20.0,	right:	20.0),
  child:	Column(
    crossAxisAlignment:	CrossAxisAlignment.center,
    mainAxisAlignment:	MainAxisAlignment.center,
    children:	[
      TextFormField(
        controller:	nameTextController,
        decoration:	const	InputDecoration(
          labelText:	'name',
          focusedBorder:	OutlineInputBorder(
            borderSide:	BorderSide(color:	Colors.blue)
          ),
          enabledBorder:	OutlineInputBorder(
            borderSide:	BorderSide(color:	Colors.grey),
          ),
        ),
      ),
      const	SizedBox(
        height:	20.0,													),													TextFormField(															controller:	ageTextController,															decoration:	const	InputDecoration(																	labelText:	'age',																	focusedBorder:	OutlineInputBorder(																					borderSide:	BorderSide(color:	Colors.blue)),																	enabledBorder:	OutlineInputBorder(																			borderSide:	BorderSide(color:	Colors.grey),																	),															),													),													const	SizedBox(															height:	20.0,													),													TextFormField(															controller:	countryTextController,															decoration:	const	InputDecoration(																	labelText:	'country',																	focusedBorder:	OutlineInputBorder(																					borderSide:	BorderSide(color:	Colors.blue)),																	enabledBorder:	OutlineInputBorder(																			borderSide:	BorderSide(color:	Colors.grey),																	),															),													),													const	SizedBox(															height:	20.0,													),													SizedBox(															width:	100.0,															height:	60.0,															child:	ElevatedButton(																	onPressed:	()	{																			handler.initializeDB().whenComplete(()	async	{																					User	secondUser	=	User(																									name:	nameTextController.text,																									age:	int.parse(ageTextController.text),																									country:	countryTextController.text);	