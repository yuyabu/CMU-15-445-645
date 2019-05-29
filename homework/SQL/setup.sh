if test -f bike_sharing.tar.gz
then
	echo "file is already exists"
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

