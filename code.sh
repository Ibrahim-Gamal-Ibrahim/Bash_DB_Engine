#! /bin/bash
#create an aaray to carry the select options
options=( "Create_Database" "List_the_Databases" "Connect_to_a_Database" "Remove_a_Database" "Exit")
# adusting the PS3
PS3="DB.Engin-> "
select opt in ${options[@]}
do
    case $opt in 
        "Create_Database" )
            echo "please create a db"
            #write the code of the creation
            ;;
        "List_the_Databases" )
            echo "please list the dbs"
            #write the code of listing
            ;;
        "Connect_to_a_Database" )
            echo "connect to a db"
            #write the code of the connection
            ;;
        "Remove_a_Database" )
            echo "remove this db"
            #write the code of to delete
            ;;
        "Exit" )
            echo "bye bye"
            break
            ;;
        * )
            # this a task for you abdelaziz here we need to write a code to do the following
            #if the user entered an invalid optin for three times the script exist 
            echo " $REPLY is invalid option!! \n please enter the a valid option"
            ;;
              
    esac
done