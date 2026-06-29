#!/bin/bash
source "$(dirname "$0")/term_controller.sh"
source "$(dirname "$0")/log_manager.sh"

digit=""
input_digit() {
	while [[ ! "$digit" =~ ^[0-9]+$ ]];
	do 
		read -p "input digit $numOfTerm times" digit
		echo "inputted $digit" | tee -a "log_dir"
	done
}
