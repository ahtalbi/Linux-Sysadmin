# Linux-Sysadmin
## in this project we are gonna learn how to set up an server with partitions mbr + lvm everything manual

![photo](./assets/0_projectPreview.png)

specify the name of the vm
chose the iso image
skip the unattended installation for manual installation
chose the ram and proccesors we need in our vm
confirme our choices
look if you want to change some thing in the settings
run the machine
chose the language
chose the country for time zone and location mirror
chose the the display text
chose the keyboard language
set hostname for the vm
set domain for the vm
set password for theroot
set full name for the user
set username for the user
set password for the user
now the good part the partitioning
first make a pv for the whole disk and so the lvm can manage good
secend make a lvm group that would manage our partitions and we made it to make the size of the partiontions dynamic not static
now we crate our logical volumes /, /home, /var, swap.
now we link each logical volumes to a partition as mount points to the logical volumes realated
we finish our partitioning 
![photo](./assets/1_partitioning.png)

chose the mirror that is the closest to you
then chose the proxy if you have one
after this for this project we are gonna chose just standart system utilities
install the boot grub boot loader for better facilities when working on multiple oses on in the same time
chose the disk that you want to install it in
congratulations installtion completed but we still did not finish
![photo](./assets/2_installationCompleted.png)

now configuring the network in our machine to be static
switch to sudo by ```su -``` se we can switch all what we need in the conf of ip
now to know that we have configured the ip to be static 2 ways of verify the confige or with ip addr to see if the ip changes with the file it self before and after with the command and about the addresses default for debian you can find theme in https://docs.oracle.com/en/virtualization/virtualbox/7.2/user/networkingdetails.html
brief 
VM IP       = 10.0.2.*
Netmask     = 255.255.255.0
Gateway     = 10.0.2.2
DNS         = 10.0.2.3
```
cat /etc/network/interfaces
```
it needs to show the configuration
and you should change it to be like this so if you see it again it should be like this
```
source /etc/network/interfaces.d/*

auto lo
iface lo inet loopback

auto enp0s3
iface enp0s3 inet static
    address 10.0.2.8
    netmask 255.255.255.0
    gateway 10.0.2.2
```
and to apply changes directly you need to run
```
systemctl restart networking
```
or
```
ip link set enp0s3 down
ip link set enp0s3 up
```
now to verify you can run  ping -c 3 8.8.8.8 it should resive data and 0 packet loss


and to set the dns if its not working you need to
change in the file ```/etc/resolve.conf```
to be like this
```
nameserver 10.0.2.3
```

so you can test ping -c 3 google.com and it should not lost packet data

congratulations you have now static ip but we still didnt finish
![photo](./assets/3_ipConfigured.png)

