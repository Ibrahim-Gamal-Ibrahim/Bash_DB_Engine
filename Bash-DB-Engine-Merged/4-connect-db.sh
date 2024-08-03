#! /bin/bash
export LC_COLLATE=C             # Terminal Case Sensitive
shopt -s extglob                #import Advanced Regex

echo "********************************"
echo "..Here You Can Connect to Databases.."
echo "********************************"
echo "These are databases: "
ls ./databases/

 flag=0
export db_name
  read -p "please enter the database name or type 'q' to return back: " db_name
  while [ $flag -eq 0 ]
  do
  if [[ $db_name == 'q' ]]
  then
    ./main-menu-db.sh

  elif [[ -z $db_name ]]
  then
  echo "you must enter the database name to connect"
  read -p "please enter the database name or type 'q' to return back: " db_name

  elif [[ -d ./databases/$db_name ]]
  then
  flag=1
  . ./TablesMainMenu.sh
  cd ./databases/$dbname
  else

    echo "this database name not exists"
    read -p "please enter the database name or type 'q' to return back: " db_name
fi
done
cd ./Bash-DB-Engine-Merged
./Bash-DB-Engine-Merged/main-menu-db.sh


