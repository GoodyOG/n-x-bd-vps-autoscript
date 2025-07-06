#!/bin/bash

# Get the directory where the script is located
REPO_ROOT=$(cd "$(dirname "$0")" && pwd)

# Function to display the main menu
show_menu() {
    clear
    cat "$REPO_ROOT/ascii/banner.txt"
    echo ""
    echo "=========================================="
    echo "         N-X-BD VPS Management Menu"
    echo "=========================================="
    echo "  1. Edit SSH Banner (HTTP Response)"
    echo "  2. Create Manual Backup"
    echo "  3. Restore from Backup"
    echo "  4. Check Monitoring Logs (Coming Soon)"
    echo "  5. Exit"
    echo "------------------------------------------"
}

# Main loop to display the menu and handle user input
while true; do
    show_menu
    read -p "Enter your choice [1-5]: " choice
    case $choice in
        1)
            echo "Launching Banner Editor..."
            bash "$REPO_ROOT/utils/http_banner_editor.sh"
            read -n 1 -s -r -p "Press any key to return to the menu..."
            ;;
        2)
            echo "Running manual backup..."
            bash "$REPO_ROOT/utils/backup.sh"
            read -n 1 -s -r -p "Press any key to return to the menu..."
            ;;
        3)
            echo "Launching restore utility..."
            bash "$REPO_ROOT/utils/restore.sh"
            read -n 1 -s -r -p "Press any key to return to the menu..."
            ;;
        4)
            echo "This feature is not yet implemented."
            sleep 2
            ;;
        5)
            echo "Exiting."
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            sleep 1
            ;;
    esac
done
