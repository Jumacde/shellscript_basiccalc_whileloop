#!/bin/bash
source "$(dirname "$0")/term_controller.sh"
source "$(dirname "$0")/digit_controller.sh"
source "$(dirname "$0")/log_manager.sh"

add(){
	case "$numOfTerm" in 
		1) result=${digit[0]} + ${digit[1]};;
		2) result=${digit[0]} + ${digit[1]} + ${digit[2]};;
		3) result=${digit[0]} + ${digit[1]} + ${digit[2]} + ${digit[3]};; 
	esac
	echo "result: $result" | tee -a "$log_dir"	
}
sub(){        
	case "$numOfTerm" in
		1) result=${digit[0]} - ${digit[1]};;   
		2) result=${digit[0]} - ${digit[1]} - ${digit[2]};;
		3) result=${digit[0]} - ${digit[1]} - ${digit[2]} - ${digit[3]};;
        esac
	echo "result: $result" | tee -a "$log_dir"
}

mul(){
        case "$numOfTerm" in
		1) result=${digit[0]} * ${digit[1]};;
		2) result=${digit[0]} * ${digit[1]} * ${digit[2]};;
		3) result=${digit[0]} * ${digit[1]} * ${digit[2]} * ${digit[3]};;
        esac
	echo "result: $result" | tee -a "$log_dir"
}

div(){
	# 0 checker
	if [ "$input_all_digit" -eq 0 ]; then
        	case "$numOfTerm" in
			1) result=${digit[0]} / ${digit[1]};;
			2) result=${digit[0]} / ${digit[1]} / ${digit[2]};;
                	3) result=${digit[0]} / ${digit[1]} / ${digit[2]} / ${digit[3]};;
        	esac
	fi
	echo "result: $result" | tee -a "$log_dir"
}

choose_arith(){
	# 1. choose a arithmetic operarion.
	local choice=""
	while [ "$choice" != "0" ] 
		&& [ "$choice" != "1" ] 
		&& [ "$choice" != "2" ]
		&& [ "$choice" != "3" ]
		&& [ "$choice" != "4" ]; 
	do
		echo "choose a arithmetic operation/n1:add, 2:sub, 3:mul, 4:div, 0:exit"
		read choice
		echo "you selected $choice" | tee -a "$log_dir"

		if [ "$choice" = "0" ]; then
			echo "end this script. bye."
			exit 0
		fi
	done
	# 2. calulate by the choosen arithmetic operation.
	input_all_digits
	case "$choice" in
		1) add ;;
		2) sub ;;
		3) mull;;
		4) div;;
	esac
}
