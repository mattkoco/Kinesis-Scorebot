#!/bin/bash
# Please give around ~5 minutes for the raw to update
# Scorebot for 2024 Diag
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
echo "Kocorowski Diagnostic Image"
echo " "

# Usage:
check_text_exists "/home/koco/Desktop/Forensics1.txt" "diag{ThisIsTheAnswerToForensicsQuestion1}" "Forensics 1 Correct"
check_text_exists "/home/koco/Desktop/Forensics2.txt" "deftones" "Forensics 2 correct"
check_text_exists "/home/koco/Desktop/Forensics3.txt" "5.34.0-3ubuntu1.3" "Forensics 3 correct"
check_text_exists "/home/koco/Desktop/Forensics4.txt" "lebua" "Forensics 4 correct"
check_text_exists "/home/koco/Desktop/Forensics5.txt" "/etc/sysctl.d/.backdoor.sh" "Forensics 5 correct"

check_text_not_exists "/etc/ftpusers" "kai" "Removed user 'kai' from FTP users file"

check_text_exists "/etc/ssh/sshd_config" "LoginGraceTime" "SSH login grace time set"
check_text_exists "/etc/ssh/sshd_config" "LogLevel INFO" "SSH LogLevel set to Info"
check_text_exists "/etc/ssh/sshd_config" "PermitRootLogin no" "SSH root login disabled"

check_text_exists "/etc/sysctl.conf" "net.ipv4.conf.all.log_martians = 1" "Enabled logging of Martian packets"

check_text_not_exists "/etc/group" "Cole" "Removed unauthorized user Cole"
check_text_not_exists "/etc/shadow" "Connor" "Removed unauthorized user Connor"
check_text_exists "/etc/group" "field_ops:x:1016:Coyne,Ryan" "Added user Ryan to group Field Ops"
check_text_not_exists "/etc/shadow" "zD0aFIhmQmEq4C43WxG8B1" "Changed insecure password on user Dimitri"

check_file_deleted "/etc/MyAwesomeMusic/coolsong.mp3" "Deleted unwanted .mp3 media file"
check_file_deleted "/media/funnymonkey/awesomemusic.APE" "Deleted unwanted .APE media file"

check_file_permissions "/etc/shadow" "600" "Shadow file permissions fixed"
check_file_permissions "/etc/passwd" "644" "Passwd file permissions fixed"

check_file_deleted "/bin/nmap" "Removed unauthorized software 'nmap'"
check_file_deleted "/bin/fcrackzip" "Removed unauthorized software 'fcrackzip'"
check_file_deleted "/bin/qbittorrent" "Removed torrenting software"
check_file_deleted "/bin/smbclient" "Removed unwanted software 'Samba'"
check_file_deleted "/bin/chromium-browser" "Removed unwanted browser 'Chromium'"

check_text_not_exists "/etc/bash.bashrc" "command apt" "Removed malicious alias 'apt update'"

check_text_exists "/etc/ufw/ufw.conf" "ENABLED=yes" "Enabled Firewall"

check_text_exists "/etc/security/pwquality.conf" "minlen = 8" "Password minimum length has been set"
check_text_exists "/etc/security/pwquality.conf" "difok = 3" "Number of characters in password that must not be present in the old password set"
check_text_exists "/etc/security/pwquality.conf" "maxrepeat = 3" "Maximum consecutive repeating characters set"
//check_text_exists "/etc/security/pwquality.conf" "repeatoldpasswords = no" "Disables repeating the use of previously used passwords"
//check_text_exists "/etc/security/pwquality.conf" "rootbypass = no" "disables root from bypassing passwords on users"

check_file_deleted "/etc/sysctl.d/.backdoor.sh" "Backdoor has been deleted"
check_text_not_exists "/etc/crontab" "hidden_backdoor" "Removed malicious cronjob"

check_text_exists "/etc/grub.d/40_custom" "set check_signatures=enforce" "Set GRUB signature checks to 'enforce'"
check_text_exists "/etc/grub.d/40_custom" "export check_signatures" "Set GRUB signature checks to be exported"
