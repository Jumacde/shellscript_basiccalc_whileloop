#!/bin/bash
source "$(dirname "$0")/log_manager.sh"

numOfTerm=""

input_numOfTerm() {
	while [ "$numOfTerm" != "0" ] \ 
		&& [ "$numOfTerm" != "1" ] \
	       	&& [ "$numOfTerm" != "2" ] \
		&& [ "$numOfTerm" != "3" ]
	do
		echo "input number of term:"
		read numOfTerm
		echo "your inputted number of term is $numOfTerm" | tee -a "$log_dir"

		if [ "$numOfTerm" == "0" ]; then
			exit 0
		fi
	done
}
