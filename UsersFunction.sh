clear
function one_user () {
 echo   "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
 printf "2.1.1.- Create an user with a password included with personal information\n"
 printf "2.1.2- Create an user with nothing\n                                   "
 echo   "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
}

function multi_user () {
 echo  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
 printf "þ 2.2.1.- Create the users with a password included with information personal þ\n"
 printf "þ 2.2.2.- Create the users with nothing                                       þ\n"
 echo  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
}

function Control_accounts() {
 echo ··································
 printf "9.1.- Unlock User account \n"
 printf "9.2.- Lock User account   \n"
 echo ..................................
}

if [[ $EUID -ne 0 ]]; then
  echo "You must be root to run this script."
  exit
fi

echo    "========================================="
printf "| 1.- Download a software                |\n"
printf "| 2.- Create a new user or multi users   |\n"
printf "| 3.- Change the user's password         |\n"
printf "| 4.- Change the owner of the file       |\n"
printf "| 5.- Change user default shell          |\n"
printf "| 6.- Change user primary group          |\n"
printf "| 7.- Change a User Name                 |\n"
printf "| 8.- Add an user to a secondary group   |\n"
printf "| 9.- Locking and Unlocking user account |\n"
printf "| 10.- Exit the script                   |\n"
printf "| 11.- Shutdown the system               |\n"
echo    "========================================="
read menu

if [[ $menu -eq "1" ]]; then
 echo Which app you want to download
 read APP
 sudo apt install $APP
 echo the app has been downloaded successfuly

elif [[ $menu -eq "2" ]]; then
 printf "2.1- Do you want to create an user\n"
 printf "2.2- Do you wannt to create multi user\n"
 echo
 read Menu

 if [[ $Menu == "2.1" ]]; then
  clear
  one_user
  echo
  read -p "Select between those 2 options : " MEnu
  echo

  if [[ $MEnu == "2.1.1" ]]; then
   clear
   echo ..........................................
   read -p "Give a name 4 the new user : " USER
   echo .........................................
   sudo adduser $USER --force-badname
   echo The user has been created
   echo .............................

  elif [[ $MEnu == "2.1.2" ]]; then
   read "Give a name 4 the new user : " User
   read "Thw password of the new user : " pass
   sudo useradd $User --force-badname
   sudo passwd $User
   echo The user has been created
  fi

 elif [[ $Menu == "2.2" ]]; then
  clear
  multi_user
  echo
  read -p "Select between those 2 options : " MENU
 fi

  if [[ $MENU == "2.2.1" ]]; then
   clear
   echo ½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½
   read -p "Give the names 4 the new Users: " Users
   echo ½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½½
   read -p "How many users Do you wanna create : " Number
   echo it will start right now

   I=0
   while [ $I -le $Number ]
    do
     sudo adduser $User$Number
   ((I++))
    done

  elif [[ $MENU == "2.2.2" ]]; then
   echo :::::::::::::::::::::::::::::::::::
   read -p "Give a name 4 the new users : " USers
   echo :::::::::::::::::::::::::::::::::::
   read -p "How many users Do you wanna create : " NUmber

   X=0
   while [ $X -le $NUmbers ]
    do
     sudo useradd $USers$NUmbers
    ((X++))
   done
  else
   echo Write the correct answer
  fi

elif [[ $menu -eq "3" ]]; then
 clear
 read -p "Write the name of the user : " USER
 sudo passwd $USER

elif [[ $menu -eq "4" ]]; then
 clear
  read -p "Write the name of the user : " User
  read -p "The name of the folder : " Folder
  sudo chown $User $Folder

elif [[ $menu -eq "5" ]]; then
  clear
 read -p "Write the name of the user : " USER
 cat /etc/shells | read -p "Which one of those shells, write all the route for it : " Shell
 sudo usermod -s $Shell $USER

elif [[ $menu -eq "6" ]]; then
 clear
 read -p "The name of the user : " User
 read -p "To which group you want to move it : " Group
 sudo usermod -g $Group $User

elif [[ $menu -eq "7" ]]; then
 clear
 read -p "Write the name of the user : " USER
 read -p "The new username : " New_Name
 sudo usermod -l $New_NAME $USER

elif [[ $menu -eq "8" ]]; then
 clear
 read -p "Write the name of the user : " User
 read -p "To which group you want to move it : " Group
 sudo usermod -a -G $Group $User


elif [[ $menu -eq "9" ]]; then
 Control_accounts
 read -p "Select which one (9.#) : " CN

 if [[ $CN -eq "9.1" ]]; then
 read -p "Write the name of the user " USER
 sudo usermod -U $USER

 elif [[ $CN -eq "9.2" ]]; then
 read -p "Write the name of the user : " User
 sudo usermod -L $User

 else
 echo You have introduced invalid option
 fi

elif [[ $menu -eq "10" ]]; then
 clear
 figlet -f slant Thank you 4 using our script && sleep 3 && clear

elif [[ $menu -eq "11" ]]; then
 clear
 echo Good night
 shutdown now

else
 echo You have introduced invalid valor && sleep 3 && sudo bash UsersFunction.sh
fi
