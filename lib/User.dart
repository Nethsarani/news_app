class	User	{
  final	int?	id;
  final	String	name;
  final	String	username;
  final String password;

  User(	{
    this.id,
    required	this.name,
    required this.username,
    required this.password
  });

  User.fromMap(Map<String,	dynamic>	res)	:
        id	=	res["id"],
        name	=	res["name"],
        username	=	res["username"],
        password=res["password"];

  Map<String,	Object?>	toMap()	{
    return	{
      'id':	id,
      'name':	name,
      'username':	username,
      'password': password
    };
  }
}