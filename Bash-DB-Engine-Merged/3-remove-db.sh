#! /bin/bash
export LC_COLLATE=C             # Terminal Case Sensitive
shopt -s extglob                #import Advanced Regex

echo "********************************"
echo "..Here You Can Delete Databases.."
echo "********************************"
echo "These are databases: "
ls ./databases/

read -p "Please enter the database name: " db_name

flag=0
while [ $flag -eq 0 ];do
	if [[ -z $db_name || $db_name == *" "* ]]
  	then
  		echo "you must enter the database name"
  		read -p "please enter the database name or type 'q' to return back: " db_name

	#elif [[ $db_name =~ ^[a-zA-Z_][a-zA-Z0-9_]*$ ]];then
	elif [[ -e ./databases/$db_name ]]
        then
        	echo "removing it ..."
       		sleep 1
       		rm -r ./databases/$db_name
       		echo "This database has benn deleted successfully"
      
	flag=1
	elif [[ $db_name == 'q' ]]
  	then
    		./main-menu-db.sh
	else
              	echo "Not found"
                read -p "please enter the database name or type 'q' to return back: " db_name
        fi
done
. ./main-menu-db.sh

