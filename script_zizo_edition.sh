#! /bin/bash
#create an aaray to carry the select options
options=( "Create_Database" "List_the_Databases" "Connect_to_a_Database" "Remove_a_Database" "Exit")
# adusting the PS3
PS3="DB.Engin-> "

count=0
select opt in ${options[@]}
do
    	case $opt in 
	#special characters 
        "Create_Database" )
		#echo "please create a db"
                #write the code of the creation
	        read -p "Please enter the database name: " db_name
	        if [[ $db_name =~ ^[a-zA-Z_][a-zA-Z0-9_]*$ ]]
    			then
	    			if [ -e ./$db_name ] 
		   
	    				then
						echo "already exist"
	    			else
					echo "Waiting until created"
					sleep 1
	    				mkdir ./$db_name
					echo "Done"
	
		    		fi
		else
			echo "not valid enter again"
		
		fi
	;;
        "List_the_Databases" )
            echo "These are all the dbs exist"
            #write the code of listing
	    ls ./
            ;;
        "Connect_to_a_Database" )
            echo "connect to a db"
            #write the code of the connection
            select connect_opt in ${connect_optoions[@]}
	    do
		    case $connect_opt in
			    "create_table" )
				read -p "please enter the student id >> primary key" x
				read -p "please enter student full name" y
				read -p "please enter student age" z
				echo "${X}:${y}:${z}" >> student.metadata
				    ;;
                            "select_table" )

                                    ;;
			   "drop_table" )

                                    ;;
			   *)
				    ;;
		    esac
	    done 
	    ;;
        "Remove_a_Database" )
            echo "remove this db"
            #write the code of to delete
	    read -p "Please enter the database name: " db_name
            #if [[ `find ./$db_name` == "./$db_name" ]] error because if not found find return nothing
            if [[ -e ./$db_name ]]
                then
			echo "removing it ..."
                	sleep 1
			rm -r ./$db_name
			echo "Done"
            else
                echo "Not found"
            fi

            ;;
        "Exit" )
            echo "bye bye"
            break
            ;;
        * )
            # this a task for you abdelaziz here we need to write a code to do the following
            #if the user entered an invalid optin for three times the script exist
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
