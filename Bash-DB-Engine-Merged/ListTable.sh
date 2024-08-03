#!/bin/bash
export LC_COLLATE=C             #Terminal Case Sensitive
shopt -s extglob                #import Advanced Regex

echo "********************************"
echo "..Here You Can List Tables.."
echo "********************************"

ListTablesFun() {
read -p "Enter table name to list: " tbl_name
if [[ -f ./databases/$db_name/$tbl_name ]]; then
  echo "Contents of ${db_name}:$tbl_name: "
  echo "================================"
  cat ./databases/$db_name/$tbl_name
  echo -e "\n"
else
  echo "Sorry, Table '$tbl_name' does not found in database '$db_name'" 
fi 
#fi
#done
}

echo "========= TABLE MENU =========="
options=("List table" "Go back to tables menu")
select opt in "${options[@]}"
do
case $opt in
    "List table" ) 
      ListTablesFun
      break
      ;;
    "Go back to tables menu" ) 
      echo "Exiting..."
      . ./TablesMainMenu.sh
      ;;
    *)
      echo "Invalid option" 
      ;;
  esac
done

. ./TablesMainMenu.sh
