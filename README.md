1. install VirtualBox - debianISO
2. start new VM
3. configuration (name, iso) without unattended installation
4. lunch installation without ui
5. choose the installation process language
5.1 skip the network configuration for later
6. select location for timezone & miror
7. configure locales language & time 
8. configure keyboard
9. configure the network (hostname, domaine name)
10. set root password
11. set (user fullname, usename, password)
12. start manual partitioning
13. initialize new empty partition table 
14. create new phisical volume for LVM
15. configure logical volumes on top of phisical volUmes (/, /var, /home, swap)
16. set mount point for every logical volume
17. write partition to the disc
18. install grub boot loader
19. installation completed
20.configure network
	20.1 set static ip in /etc/network/interfaces 
		auto enp0s3
		iface enp0s3 inet static
			address 10.0.2.15
			netmask 255.255.255.0
			gateway 10.0.2.2
	20.2. ip addr add 10.0.2.15/24 dev enp0s3
	20.3. ip route add default via 10.0.2.2
	20.4 configure dns
		set "nameserver 10.0.2.3" in /etc/resolv.conf

21.create script.sh (with shebang and infinite loop that log "hello")
	#!/bin/bash
	while(true); do 
		echo "hello"
		sleep 2
	done
22.create myservice.service in /etc/systemd/system/ with content:
	[Service]
	ExecStart=/path/script.sh
	Restart=always

23. systemctl daemon-reload
24. systemctl start myservice 
25. journalctl -u myservice
26. systemctl status myservice		
27. how to extend the lvm
	27.1 check free space in the VG
vgs
lvextend -L +2G /dev/vg/var
resize2fs /dev/vg/var