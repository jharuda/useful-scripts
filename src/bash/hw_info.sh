#!/bin/bash


print_delimiter() {
    echo "----------------------------------------------------------"
}

hardware_info() {
    echo "RAM"
    free -h
    print_delimiter

    echo "Processor"
    lscpu | grep -E -e '^CPU\(s\)' -e '^Core' -e '^Thread' -e '^Socket'
    lscpu
    print_delimiter

    echo "systemd-detect-virt output"
    systemd-detect-virt
    print_delimiter

    echo "Discs"
    lsblk
    blkid
    print_delimiter

    echo "dmidecode"
    dmidecode
    print_delimiter

    echo "lshw"
    lshw
}

software_info() {
    rpm -q systemd
    rpm -q kernel
    rpm -q policycoreutils-python-utils
    stat /sys/fs/cgroup -fc %T
}


main() {
    hardware_info
    echo "=========================================================="
    software_info
}

main
