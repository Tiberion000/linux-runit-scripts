#!/bin/bash


delete_service() {
	sudo rm -f /service/"$sv"
}

link_to_service() {
	sudo ln -s /sv/"$sv" /service/
}

menu() {
	diff -q /sv/ /service/
	read -n 1 -p "Type (d) to remove a service, (l) to link a service" input

	if [ "$input" = "d" ]; then
		clear
		ls -w 1 /service/
		read -p "Type service to remove: " sv
		delete_service
	elif [ "$input" = "l" ]; then
		clear
		diff -q /sv/ /service/
		read -p "Type service to link: " sv
		link_to_service
	elif [ -z "$input" ]; then
		clear
		echo "No arguments passed."
	else
		clear
		echo "Invalid argument."
	fi
}

menu
