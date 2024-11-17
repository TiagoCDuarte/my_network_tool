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
ping_option2_change_attempts=1

#Function ping_target variables
ping_answer_attempts=0
ping_change_ip_attempts=0
ping_temp_ip=" "
ping_count=0
ping_verbose_attempts=0


# Checking arguments
for arg in "$@"; do
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
    while [[ "$ping_answer" != "y" && "$ping_answer" != "n" ]]; do
        read -p "Do you want to ping $target_ip until the program is interrupted? (y/n) " ping_answer
        
        if [ "$ping_answer" = "y" ]; then
            echo "Use \"ctrl+c\" to interrupt the ping."
            ping $target_ip 
        elif [ "$ping_answer" = "n" ]; then
            while [ "$ping_menu" != "exit" ]; do
                echo "Please choose 1 option:"
                sleep 0.5
                echo "0- Exit"
                echo "1- Set the ping command in manual mode"
                echo "2- Get help setting all the options"
                echo "3- Do you want to see all the options?"
                read -p "Enter your choice: " ping_menu
    
                    case $ping_menu in
                        0)
                            echo "Exiting...."
                            ping_menu="exit"
                            exit
                            ;;
                        1)
                            echo "Setting ping command in manual mode. Don't forget to add the target ip."
                            sleep 1
                            read -p "Please complete with your input: ping " ping_man_input
                            ping $ping_man_input
                            
                            ;;
                        2)
                            echo "Getting help for setting all the options."                            
                            while [[ $ping_change_ip != "y" || $ping_change_ip != "n" ]]; do
                                read -p "Do you want to change the target IP? (y/n) " ping_change_ip
                                    if [ "$ping_change_ip" == "y" ]; then
                                        read -p "Which IP do you want to ping? " new_ip
                                        ping_temp_ip=$new_ip
                                        break
                                    elif [ "$ping_change_ip" == "n" ]; then
                                        echo "Ok, we will continue to the target $target_ip."
                                        break
                                    else
                                        if [ $ping_change_ip_attempts -lt "3" ]; then
                                        echo "Please answer only with \"y\" or \"n\"."
                                        ((ping_change_ip_attempts++))
                                        fi
                                    fi
                                if [ $ping_change_ip_attempts == "3" ]; then
                                    echo "You have failed too many attempets. This script will close now."
                                    sleep 1
                                    break
                                fi
                            done
                                read -p "How many times do you want to send ping requests?" ping_count
                                number_of_pings="-c $ping_count "
                                
                                while [[ $ping_verbose != "y" || $ping_verbose != "n" ]]; do
                                    read -p "Do you want to use the verbose mode? (y/n) " ping_verbose_question
                                        if [ "$ping_verbose_question" == "y" ]; then
                                            ping $target_ip $number_of_pings -vvv
                                            break
                                        elif [ "$ping_verbose_question" == "n" ]; then
                                            ping $target_ip $number_of_pings
                                            break
                                        else
                                            if [ $ping_verbose_attempts -lt "3" ]; then
                                                echo "Please answer only with \"y\" or \"n\"."
                                                ((ping_verbose_attempts++))
                                            fi
                                        fi      
                                    if [ $ping_verbose_attempts == "3" ]; then
                                    echo "You have failed too many attempets."
                                    sleep 1
                                    break
                                    fi
                                done                      
                            ;;
                        *)
                            echo "Invalid option. Please try again."
                            ((invalid_ping_option++))
                            ;;
                    esac
                done
        else 
            if [ $ping_answer_attempts -lt 2 ]; then
                echo "Please answer only with \"y\" or \"n\"."
            fi
            ((ping_answer_attempts++))

        fi
        if [ $ping_answer_attempts == 3 ]; then
        echo "You have failed too many attempets. This script will close now."
        sleep 1
        break
        fi
    done
}

#Menu

while [ "$option" != "exit" ]; do
    echo "=========================="
    echo "Target IP= $target_ip"
    echo "=========================="
    echo "0)Exit"
    echo "1)Check Network Interface Information"
    echo "2)Ping a Host"
    echo "3)Port Scan with Nmap"
    echo "4)Display Routing Table"
    echo "5)Traceroute to Host"
    echo "6)Check subdomains"
    echo "7)Check directories"
    echo "8)"
    echo "9)"
    echo "10)Change target IP"

    read -p "Choose an option " option 
	    
    case $option in
        0)
            echo "Exiting...."
            exit
            ;;
	    1) 
            ifconfig 
            ;;
	    2) 
            ping_target 
            ;;
	    3) 
            nmap 
            ;;
        4) 
            arp -a
	        ;;
        5)
            traceroute $target_ip
	        ;;
        6)

	        ;;
	    7)

	        ;;
	    8)

	        ;;
	    9)

	        ;;
	    10)
            read -p "What should be new target ip?" new_target_ip
            target_ip=$new_target_ip
	        ;;
	    *) 
            echo "Invalid option. Please try again" 
	        ;;
	    esac
done
