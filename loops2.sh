#!/binbash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[32m"
N="\e[0m"

LOG_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$( echo $0 | cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOG_FOLDER/$LOG_FILE-$TIMESTAMP.log"


validate() {
    if ( $1 -ne 0 ); then 
        echo -e "$2 $R FAILURE $N"
        exit 1 
    else 
        echo -e "$2  $G SUCCESS $N"
    fi        

}

echo "The script started running at: $TIMESTAMP" &>> $LOG_FILE_NAME


if ( $? -ne 0 ); then 

    echo "ERROR:: You need sudo access to execute the script"
    exit 1
fi   


for package in $@
do
    dnf list installed $package &>> $LOG_FILE_NAME

    if ( $? -ne 0 ); then 
        dnf install $package -y &>> $LOG_FILE_NAME
        validate $? "$package Installation..."
    else 
        echo -e "$package Already.... $Y INSTALLED $N"  
    fi  

done


# dnf list installed git &>> $LOF_FILE_NAME

# if ( $? -ne 0 ); then 
#     dnf install git -y &>> $LOF_FILE_NAME
#     if ( $? -ne 0 ); then
#         validate $? "Git Installation..."
#     else 
#         echo "Git Already.... $Y INSTALLED $N"  
# fi  



