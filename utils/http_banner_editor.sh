#!/bin/bash

BANNER_FILE="/etc/issue.net"
HEADER_FILE="/etc/ssh/sshd_config"

echo "=============================="
echo " HTTP Banner & SSH Header Editor"
echo "=============================="
echo ""

PS3="Select an option: "
options=("Edit SSH Banner" "Edit SSH Header" "Exit")
select opt in "${options[@]}"
do
    case $opt in
        "Edit SSH Banner")
            echo "Opening banner file: $BANNER_FILE"
            nano "$BANNER_FILE"
            echo "Banner updated. Restarting SSH service..."
            systemctl restart ssh
            ;;
        "Edit SSH Header")
            echo "Opening SSH config file: $HEADER_FILE"
            nano "$HEADER_FILE"
            echo "Restarting SSH service..."
            systemctl restart ssh
            ;;
        "Exit")
            break
            ;;
        *)
            echo "Invalid option"
            ;;
    esac
done