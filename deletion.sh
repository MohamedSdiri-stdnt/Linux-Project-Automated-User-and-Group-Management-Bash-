#!/bin/bash

validate_name() {
    if [[ "$1" =~ ^[A-Za-z0-9_-]+$ ]]; then
        return 0
    else
        return 1
    fi
}

while true; do
    echo "──────────────────────────────"
    read -p "What do you want to delete? (u=user, g=group, f=finish) : " choice

    case "$choice" in
        u|U)
            read -p "Username to delete (or 'fin' to return to menu): " user
            if [ "$user" = "fin" ]; then
                echo "Returning to main menu."
                continue
            fi
            if ! validate_name "$user"; then
                echo "Error: invalid username '$user'."
                echo "Use only letters, numbers, hyphens (-) or underscores (_)."
                continue
            fi
            if id "$user" >/dev/null 2>&1; then
                sudo userdel -r "$user"
                if [ $? -eq 0 ]; then
                    echo "User '$user' deleted with home directory."
                else
                    echo "Error: could not delete user '$user'."
                fi
            else
                echo "User '$user' does not exist."
            fi
            ;;
        g|G)
            read -p "Group name to delete (or 'fin' to return to menu): " group
            if [ "$group" = "fin" ]; then
                echo "Returning to main menu."
                continue
            fi
            if ! validate_name "$group"; then
                echo "Error: invalid group name '$group'."
                echo "Use only letters, numbers, hyphens (-) or underscores (_)."
                continue
            fi
            if getent group "$group" >/dev/null 2>&1; then
                sudo groupdel "$group"
                if [ $? -eq 0 ]; then
                    echo "Group '$group' deleted."
                else
                    echo "Error: could not delete group '$group'."
                fi
            else
                echo "Group '$group' does not exist."
            fi
            ;;
        f|F)
            echo "Deletion process finished."
            break
            ;;
        *)
            echo "Invalid choice. Enter 'u' for user, 'g' for group, or 'f' to finish."
            ;;
    esac
done
