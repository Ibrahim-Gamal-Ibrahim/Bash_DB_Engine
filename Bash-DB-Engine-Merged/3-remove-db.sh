#! /bin/bash
export LC_COLLATE=C             # Terminal Case Sensitive
shopt -s extglob                #import Advanced Regex

# echo "********************************"
# echo "..Here You Can Delete Databases.."
# echo "********************************"
# echo "These are databases: "
# ls ~/databases/

# read -p "Please enter the database name: " db_name

# flag=0
# while [ $flag -eq 0 ];do
# 	if [[ -z $db_name || $db_name == *" "* ]]
#   	then
#   		echo "you must enter the database name"
#   		read -p "please enter the database name or type 'q' to return back: " db_name

# 	#elif [[ $db_name =~ ^[a-zA-Z_][a-zA-Z0-9_]*$ ]];then
# 	elif [[ -e ~/databases/$db_name ]]
#         then
#         	echo "removing it ..."
#        		sleep 1
#        		rm -r ~/databases/$db_name
#        		echo "This database has benn deleted successfully"
      
# 	flag=1
# 	elif [[ $db_name == 'q' ]]
#   	then
#     		./main-menu-db.sh
# 	else
#               	echo "Not found"
#                 read -p "please enter the database name or type 'q' to return back: " db_name
#         fi
# done
# . ./main-menu-db.sh
# ----------------------------------------
echo "********************************"
echo "..Here You Can Delete Databases.."
echo "********************************"
echo "These are databases: "
ls ~/databases/

DeleteAllDBFun() {
	while true;do
	read -p "Warning!!.. are you sure that you want to delete all databases exist on your server!! (y/n)" confirm
	if [[ $confirm == 'y' || $confirm == 'Y' ]]
	then
		rm -rf ~/databases/*
		echo "you deleted all the databases exist on your server"
		sleep 1
		break
	elif [[ $confirm == 'n' || $confirm == 'N' ]];then
		echo "nothing is deleted"
		sleep 1
		break
	else 
		echo "please enter a valid input !!"
	fi
	done

}
DeleteSpecificDBFun() {
while true; do
        read -p "Please enter the name of the database you want to delete or type 'q' to return back: " user_input

        if [[ -z $user_input || $user_input == *" "* ]]; then
            echo "database name can not be empty or contain spaces."
            #read -p "Please enter the name of the database you want to display or type 'q' to return back: " user_input
        elif [[ $user_input == "q" ]]; then
            echo "Exiting..."
			sleep 1
			break
            #./main-menu-db.sh

        elif [[ -d ~/databases/$user_input ]]; then
            rm -rf ~/databases/$user_input
			echo "the '$user_input' is deleted successfully"
			sleep 1
            break
        else
            echo "Sorry, the database '$user_input' was not found."
        fi
    done
}

options=("Delete all databases" "Delete specefic database" "Return to the main menu")
    select opt in "${options[@]}"
    do
    case $opt in
        "Delete all databases" )
            DeleteAllDBFun
            . ./main-menu-db.sh
            ;;
        "Delete specefic database")
            DeleteSpecificDBFun
            . ./main-menu-db.sh
            ;;
		"Return to the main menu")
			. ./main-menu-db.sh
			;;
        *) echo "invalid option $REPLY, please try again" 
           echo "1) Delete all databases"
           echo "2) Delete specefic database" 
		   echo "3) Return to the main menu"
		   ;;
    esac
    done
