#! /bin/bash
#create an array to carry the select options
#create an array to carry the connect options
#connect_optoions=("Create_table" "List_tables" "Drop_table" "Insert_data_to_a_table" "Select_from_table" "Update_table" "Delete_table")
# adusting the PS3
#PS3="DB.Engine-> "

export LC_COLLATE=C             # Terminal Case Sensitive
shopt -s extglob                #import Advanced Regex

dbflag=0
while [ $dbflag -eq 0 ]
do
    if [[ -d  ~/databases ]]
     then
     dbflag=1
    else
     mkdir ~/databases
    fi
done

echo "*************************************"
echo "Welcome to Our DataBase Main Menu :)"
echo "*************************************"
# adusting the PS3
PS3='Please enter your choice: '

#create an array to carry the select options
options=( "Create_Database" "List_the_Databases" "Connect_to_a_Database" "Remove_a_Database" "Exit")


count=0
select opt in ${options[@]}
do
	case $opt in 
    		"Create_Database")
			. ./1-create-db.sh
		;;
    		"List_the_Databases")
			. ./2-list-db.sh
	    	;;
		"Connect_to_a_Database")
            		. ./4-connect-db.sh
		;;
    		"Remove_a_Database")

    			. ./3-remove-db.sh	
    		;;
    		"Exit")
    			echo "Bye Bye"
    			exit 0
            	;;
        	*)

			((count++)) 
			if [[ $count -eq 3 ]]
			then
				echo " you have entered invalid option many times!!"
        			exit 1
			else
			echo -e " $REPLY is invalid option!! \n please enter the a valid option"
			fi
		    	
	   	;;
              
    esac
done
