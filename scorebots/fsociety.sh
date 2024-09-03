echo " "
echo " "
echo "NOTE: Please allow up to 5 minutes for scorebot updates & injects."
echo "Scorebot version: v1"
echo "Injects: NO"

# Function to check if text exists in a file
check_text_exists() {
    local file="$1"
    local text="$2"
    local vuln_name="$3"
    
    if grep -q "$text" "$file"; then
        echo "Vulnerability fixed: '$vuln_name'"
    else
        echo "Unsolved Vuln"
    fi
}

# Function to check if text does not exist in a file
check_text_not_exists() {
    local file="$1"
    local text="$2"
    local vuln_name="$3"
    
    if ! grep -q "$text" "$file"; then
        echo "Vulnerability fixed: '$vuln_name'"
    else
        echo "Unsolved Vuln"
    fi
}

# Function to check if a file exists
check_file_exists() {
    local file="$1"
    local vuln_name="$2"
    
    if [ -e "$file" ]; then
        echo "Vulnerability fixed: '$vuln_name'"
    else
        echo "Unsolved Vuln"
    fi
}

# Function to check if a file has been deleted
check_file_deleted() {
    local file="$1"
    local vuln_name="$2"
    
    if [ ! -e "$file" ]; then
        echo "Vulnerability fixed: '$vuln_name'"
    else
        echo "Unsolved Vuln"
    fi
}

check_file_permissions() {
    local file="$1"
    local expected_permissions="$2"
    local vuln_name="$3"
    
    # Get the actual permissions of the file in numeric form (e.g., 644)
    actual_permissions=$(stat -c "%a" "$file")
    
    if [ "$actual_permissions" == "$expected_permissions" ]; then
        echo "Vulnerability fixed: '$vuln_name'"
    else
        echo "Unsolved Vuln"
    fi
}

echo " "
echo "fsociety"
echo " "

check_text_exists "/home/elliot_a/Desktop/Forensics_1.txt" "hidden_module.ko" "Forensics 1 - Part 1"
check_text_exists "/home/elliot_a/Desktop/Forensics_1.txt" ".fsociety" "Forensics 1 - Part 2"
check_text_exists "/home/elliot_a/Desktop/Forensics_2.txt" "/var/spool/cron/crontabs/" "Forensics 2 - Part 1"
check_text_exists "/home/elliot_a/Desktop/Forensics_2.txt" "tyr3ll" "Forensics 2 - Part 2"
check_text_exists "/home/elliot_a/Desktop/Forensics_3.txt" "Glenn C. Dalton" "Forensics 3"

#user vulns
check_text_not_exists "/etc/passwd" "r00t" "Removed Unauthorized admin"
check_text_not_exists "/etc/passwd" "whiterose" "Removed Unauthorized user"
check_text_not_exists "/etc/passwd" "darkarmy" "Removed Unauthorized user"
check_text_not_exists "/etc/passwd" "tyr3ll" "Removed Unauthorized user"

#other
check_file_deleted "/home/elliot_a/Documents/creds.csv" "Deleted plaintext credentials file"
