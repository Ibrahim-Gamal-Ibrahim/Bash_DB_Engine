#! /bin/bash
#create an array to carry the select options
options=( "Create_Database" "List_the_Databases" "Connect_to_a_Database" "Remove_a_Database" "Exit")
#create an array to carry the connect options
connect_optoions=("Create_table" "List_tables" "Drop_table" "Insert_data_to_a_table" "Select_from_table" "Update_table" "Delete_table")
# adusting the PS3
PS3="DB.Engine-> "

count=0
select opt in ${options[@]}
do
    case $opt in 
    "Create_Database" )

	    read -p "Please enter the database name: " db_name
	        if  [[ $db_name =~ ^[a-zA-Z_][a-zA-Z0-9_]*$ ]] 
    			then
	    			if [ -e ~/inventory/$db_name ] 
	    				then
						echo "already exist"
	    			else
					echo "Waiting until created"
					sleep 1
	    				mkdir -p ~/inventory/$db_name
					echo "Done"
	
		    		fi
				
			else
				echo "not valid enter again"
		
			fi
			;;
    "List_the_Databases" )
            echo "These are all the dbs exist"
            #write the code of listing
	    	find ~/inventory  -maxdepth 1 -type d ! -name '.*' ! -name '~'  ! -name 'inventory' -exec basename {} \;
            ;;
	"Connect_to_a_Database" )
            
		read -p "Please enter the database name: " db_name
	if [ -e ~/inventory/$db_name ] 
	then
		cd ~/inventory/$db_name
		select connect_opt in ${connect_optoions[@]}
	    do
		   	case $connect_opt in
			    "Create_table" )
				#must check on the table if its metadata(id) already exist or not if it exist before refuse the creation if not create it
					read -p "Please enter the name of the table " table_name
					if  [[ $table_name =~ ^[a-zA-Z_][a-zA-Z0-9_]*$ ]]
					then
						echo "please enter the metadata"
						sleep 1
						read -p "please enter the table id (primary key) >>  " x
						#read -p "please enter the table name >> " y
						#read -p "please enter student age >> " z
						echo "$x \n $table_name \n " >> $table_name
					sleep 1
					echo "please enter the data you want"
					#here we need to open the terminal for the user to write the data he want and save it in the same file	 
					else
						"invalid name .... please try again"
					fi
				    ;;

                "List_tables" )
					ls 
					;;
			   	"Drop_table" )
					read -p "please enter the name iof the table " table_name
					if [ -e ./$table_name ] 
					then
						echo "removing it ..."
                		sleep 1
						rm -f $table_name
					else
						echo "the table is not exist"
					fi
                    ;;
				"Insert_data_to_a_table" )

                    ;;
				"Select_from_table" )

                    ;;
				"Update_table" )

                ;;
				"Delete_table" )

                    ;;
			   	*)

				    ;;
		    esac
	    done 
	else
			echo "this database is not exist......please try again"
	fi
            
	;;
    "Remove_a_Database" )

		read -p "Please enter the database name: " db_name
			if [[ $db_name =~ ^[a-zA-Z_][a-zA-Z0-9_]*$ ]];then
            	if [[ -e ~/inventory/$db_name ]]
                then
					echo "removing it ..."
                	sleep 1
					rm -r ~/inventory/$db_name
					echo "Done"
            	else
                echo "Not found"
            	fi
			else 
			echo "please enter a vaild name to check"
			fi
            ;;
    "Exit" )
            echo "Bye Bye"
            break
            ;;
        * )

			((count++)) 
			if [[ $count -eq 3 ]]
			then
				echo " you have entered invalid option many times!!"
        			exit 1
			else
			echo " $REPLY is invalid option!! \n please enter the a valid option"
			fi
		    	
	    ;;
              
    esac
done
