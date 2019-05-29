if test -f bike_sharing.tar.gz
then
	echo "file bike_sharing.tar.gz is already exists"
else
	wget https://15445.courses.cs.cmu.edu/fall2018/files/bike_sharing.tar.gz
fi

if test -f setup.sql
then
	echo "set up already finishied"
else
	tar -zxvf bike_sharing.tar.gz
	sqlite3 bike_sharing.db < setup.sql
fi

if test -f placeholder.zip
then
	echo "file placeholder.zip is already exists"
else

	wget https://15445.courses.cs.cmu.edu/fall2018/files/placeholder.zip
fi

if test -d placeholder
then
	echo "set up already finished"
else
		
	unzip placeholder.zip
fi
