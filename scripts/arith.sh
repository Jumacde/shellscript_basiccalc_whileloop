#!/bin/bash
source "$(dirname "$0")/term_controller.sh"
source "$(dirname "$0")/digit_controller.sh"
source "$(dirname "$0")/log_manager.sh"

# expr is step of calculatiton
add(){
	case "$numOfTerm" in 
		1) result=$((${digits[0]} + ${digits[1]}));
			expr="${digits[0]} + ${digits[1]}";;
		2) result=$((${digits[0]} + ${digits[1]} + ${digits[2]}));
			expr="${digits[0]} + ${digits[1]} + ${digits[2]}";;
		3) result=$((${digits[0]} + ${digits[1]} + ${digits[2]} + ${digits[3]}));
		       expr="${digits[0]} + ${digits[1]} + ${digits[2]} + ${digits[3]}";;
	esac
	echo "result: $expr = $result" | tee -a "$log_dir"	
}
sub(){        
	case "$numOfTerm" in
		1) result=$((${digits[0]} - ${digits[1]}));
			expr="${digits[0]} - ${digits[1]}";;	
		2) result=$((${digits[0]} - ${digits[1]} - ${digits[2]}));
			expr="${digits[0]} - ${digits[1]} - ${digits[2]}";;
		3) result=$((${digits[0]} - ${digits[1]} - ${digits[2]} - ${digits[3]}));
			expr="${digits[0]} - ${digits[1]} - ${digits[2]} - ${digits[3]}";;
        esac
	echo "result: $expr = $result" | tee -a "$log_dir"
}

mul(){
        case "$numOfTerm" in
		1) result=$((${digits[0]} * ${digits[1]}));
			expr="${digits[0]} * ${digits[1]}";;
		2) result=$((${digits[0]} * ${digits[1]} * ${digits[2]}));
			expr="${digits[0]} * ${digits[1]} * ${digits[2]}";;
		3) result=$((${digits[0]} * ${digits[1]} * ${digits[2]} * ${digits[3]}));
			expr="${digits[0]} * ${digits[1]} * ${digits[2]} * ${digits[3]}";;
        esac
	echo "result: $expr = $result" | tee -a "$log_dir"
}

div(){
	# 0 checker
	if [ "$input_all_digit" -eq 0 ]; then
        	case "$numOfTerm" in
			1) result=$((${digits[0]} / ${digits[1]}));
				expr="${digits[0]} / ${digits[1]}";;
			2) result=$((${digits[0]} / ${digits[1]} / ${digits[2]}));
				expr="${digits[0]} / ${digits[1]} / ${digits[2]}";;
			3) result=$((${digits[0]} / ${digits[1]} / ${digits[2]} / ${digits[3]}));
				expr="${digits[0]} / ${digits[1]} / ${digits[2]} / ${digits[3]}";;
        	esac
	fi
	echo "result: $expr = $result" | tee -a "$log_dir"
}

choose_arith(){
	# 1. choose a arithmetic operarion.
	local choice=""
	while [[ ! "$choice" =~ ^[0-4]$ ]]; do
		echo "choose a arithmetic operation/n1:add, 2:sub, 3:mul, 4:div, 0:exit"
		read choice
		echo "you selected $choice" | tee -a "$log_dir"

		if [ "$choice" = "0" ]; then
			echo "end this script. bye."
			exit 0
		fi
	done
	# 2. calulate by the choosen arithmetic operation.
	input_numOfTerm
	input_all_digits
	case "$choice" in
		1) add ;;
		2) sub ;;
		3) mul;;
		4) div;;
	esac
}
