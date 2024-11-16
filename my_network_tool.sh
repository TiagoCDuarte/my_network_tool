#!/bin/bash

#1)Check Network Interface Information
#2)Ping a Host
#3)Port Scan with Nmap
#4)Display Routing Table
#5)Traceroute to Host
#6)Exit

#workflow
# special variable checking if the ip was already chosen before
# check if the user wants all the info saved in a doc or not. choose the name of the doc and start appending everythong to it
# add for loop to brute force dir's and option do add domain to /etc/hosts
# flag to record everything after the Ip when lauching the script 
# add arp


#Variables
count=2
target_ip=" "
output_path=" "
ennumeration="false"
ping_command="ping"
invalid_ping_option=1

# Checking arguments
for arg in "$@"; 
do
	if [[ $arg == "-h" || $arg == "--help" ]]; then
	echo "Usages:"
	echo "	-my_network_tool.sh [option] [value]"
	echo "	-my_network_tool.sh [option] [path_to_the_file/file_name]"
	echo " "
	echo "This tool allows you to perform network tasks faster and in an easier way"
	echo " "
	echo "-i  --set-ip         sets the target ip"
	echo "-so --save-output    saves the output in the path mentioned after"
	echo "-e  --ennumerate     pings host, runs nmap, traceroute, check subdomains and directories"
	echo "-n  --network        checks network interface information and the routing table"
		
	exit
	
	elif [[ $arg == "-i" || $arg == "--set-ip" ]]; then
	target_ip=${!count}
	elif [[ $arg == "-so" || $arg == "--save-output" ]]; then
	output_path=${!count}
	elif [[ $arg == "-e" || $arg == "--ennumerate" ]]; then
	ennumeration="true"
	
	fi
	((count++))
done

#Functions
ping_target() {
if [ $# == 1 ]; then
	read "Do you want to ping $target_ip until the program is interrupted? (y/n)" ping_answer
	if [ $ping_answer = "y" ]; then
		ping $target_ip
	elif [ $ping_answer = "n" ]; then
	#!/bin/bash

while true; do
    echo "Please choose 1 option:"
    sleep 1
    echo "1- Set the ping command in manual mode"
    echo "2- Get help setting all the options"
    echo "3- Do you want to see the options?"
    read -p "Enter your choice: " ping_options_answer
    
    case $ping_options_answer in
        1)
            # Your code for option 1
            echo "Setting ping command in manual mode."
            sleep 1
            read "Please complete with your input: ping " ping_man_input
            break
            ;;
        2)
            # Your code for option 2
            echo "Getting help for setting all the options."
            read "Do you want to change the target ip?(y/n)" ping_change_ip
            	if [ ping_change_ip == "y" ]; then
            	read "Which ip do you want to ping?" new_ip
            	elif [ ping_change_ip == "n" ]; then
            	echo  
            	fi
            break
            ;;
        3)
            # Your code for option 3
            echo "Displaying the options."
            break
            ;;
        *)
            echo "Invalid option. Please try again."
            ((invalid_ping_option++))
            ;;
    esac
done

	
	
	# provide options -h help, -y to jump the previous question, -c to select how many packet we want to send, -v for verbose, -i to change ip target, -m to write the command mannually after the ping command
	fi
elif [ ]
	
fi 
}

#Menu

while [ "$option" != "exit" ];
do
echo "=========================="
echo "Target IP= $target_ip"
echo "=========================="
echo "0)Exit"
echo "1)Check Network Interface Information"
echo "2)Ping a Host"
echo "3)Port Scan with Nmap"
echo "4)Display Routing Table"
echo "5)Traceroute to Host"
echo "6)Change the target IP"
echo "7)Check subdomains"
echo "8)Check directories"
echo "9)Run all"
echo "10)Change target IP"


read -p "Choose an option " option 
	case $option in
	1) ifconfig
	;;
	2) ping $target_ip
	;;
	3) nmap 
	;;
	4) arp -a
	;;
	5)
	;;
	6)
	;;
	7)
	;;
	8)
	;;
	9)
	;;
	10)exit
	;;
	*) echo "Invalid option. Please try again" 
	;;
	esac
done
