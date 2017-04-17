<?php
# the host used to access DB
define('DB_HOST', 'localhost');
# the username used to access DB
define('DB_USER', 'root');
# the password for the username
define('DB_PASS', '');
# the name of your databse 
define('DB_NAME', 'nerve'); 

#connects the database and handling the result
class __database {
 	protected $connection = null;
 	protected $error = null;
	#make a connection
	public function __construct($hostname,$username,$password,$database)
	{
	  	$this -> connection = new mysqli($hostname,$username,$password,$database);
	  	if (mysqli_connect_errno()) 
	  	{
	   		printf("Connect failed: %s\n", mysqli_connect_error());
	   		exit();
		}
	}
	#performs a query on the database
	public function query($query)
	{
	  	$result = $this -> connection -> query($query); 
	  	if($result) 
	  	{
	   		return $result;
	  	} 
	  	else
	  	{
	   		$this -> error = $this -> connection -> error;
	   		return false;
		}
	}
	#display error
	public function get_error() 
	{
		return $this -> error;
	}
	#closes the database connection when object is destroyed.
    public function __destruct()
    {
        $this -> connection -> close();
    }
}

$connection = new __database(DB_HOST,DB_USER,DB_PASS,DB_NAME);