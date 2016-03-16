Configuration AddMyFile
{
	File HelloWorld
	{
		Ensure = "Present"
		DestinationPath = "C:\hello.txt"
		Contents = "World"
	}
}

AddMyFile

Start-DscConfiguration -Wait -Verbose -Path .\AddMyFile