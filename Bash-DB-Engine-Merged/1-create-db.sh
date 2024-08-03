#! /bin/bash
export LC_COLLATE=C             # Terminal Case Sensitive
shopt -s extglob                #import Advanced Regex

echo "********************************"
echo "..Here You Can Create Databases.."
echo "********************************"

export db_name

read -p "please enter a valid name, doesn't contain spaces or special chars or type 'q' to return back: " db_name
flag=0
#./checkname.sh $dbname
while [ $flag -eq 0 ];do
	if [[ $db_name == 'q' ]]
	then
	./main-menu-db.sh
	
	elif  [[ $db_name =~ ^[a-zA-Z_][a-zA-Z0-9_]*$ ]]
	then
	    if [[ -d ./databases/$db_name ]]
    		then
    		echo "this name already exists"
    		read -p "please enter a valid database name or type 'q' to return back: " db_name
    		
            #if [ -e ~/inventory/$db_name ]
            #then
            #echo "already exist"
            else
            	flag=1
            	echo "Waiting until created"
            	sleep 1
            	mkdir -p ./databases/$db_name
            	echo "This database has been created successfully.."

            fi

	else
		read -p "please enter a valid database name or type 'q' to return back: " db_name

       fi
done

. ./main-menu-db.sh
