#!/bin/bash
source "$(dirname "$0")/log_manager.sh"
source "$(dirname "$0")/arith.sh"
main() {
	get_logdir
	choose_arith
}
main
