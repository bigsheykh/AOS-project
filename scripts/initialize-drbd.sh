mounting hdd:
	lsblk
	sudo mkfs -t ext4 /dev/vdb
	sudo mkdir /mnt/hdd
	sudo mount /dev/vdb /mnt/hdd

installing tools for working with vms:
	# add arvan mirror or an iranian mirror
	sudo rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
	sudo rpm -Uvh https://www.elrepo.org/elrepo-release-7.0-3.el7.elrepo.noarch.rpm
	sudo yum install -y epel-release
	sudo yum install -y wget curl vim tmux kBuild dnf bash-completion htop vim-X11 libcanberra-gtk3 libcanberra-gtk2
	sudo yum makecache
	sudo yum groupinstall "X Window System" -y


download ubuntu kernel:
	# wget https://linux.cc.iitk.ac.in/mirror/centos/elrepo/kernel/el7/x86_64/RPMS/kernel-lt-5.4.200-1.el7.elrepo.x86_64.rpm
	# sudo yum install ./kernel-lt-5.4.200-1.el7.elrepo.x86_64.rpm
	# yum --enablerepo=elrepo-kernel install kernel-lt-5.4.200-1.el7.elrepo


	sudo yum groupinstall "Development Tools"
	sudo yum install -y ncurses-devel elfutils-libelf-devel openssl-devel


	wget https://mirrors.edge.kernel.org/pub/linux/kernel/v5.x/linux-5.4.200.tar.gz --no-check-certificate -c
	tar xvfz linux-5.4.200.tar.gz
	cd linux-5-4-200
	make menuconfig
	make
	sudo make modules_install
	sudo make install # ignore exception
	sudo vim /etc/default/grub # (set GRUB_CMDLINE_LINUX="crashkernel=auto rhgb quiet", GRUB_DEFAULT=0) remove unneccary
	sudo grub2-mkconfig -o /boot/grub2/grub.cfg
	sudo grubby --set-default /boot/vmlinuz-5.4.200
	sudo reboot

# download ubuntu kernel tools:
# 	wget https://linux.cc.iitk.ac.in/mirror/centos/elrepo/kernel/el7/x86_64/RPMS/kernel-lt-devel-5.4.200-1.el7.elrepo.x86_64.rpm
# 	wget https://linux.cc.iitk.ac.in/mirror/centos/elrepo/kernel/el7/x86_64/RPMS/kernel-lt-headers-5.4.200-1.el7.elrepo.x86_64.rpm
# 	wget https://linux.cc.iitk.ac.in/mirror/centos/elrepo/kernel/el7/x86_64/RPMS/kernel-lt-tools-5.4.200-1.el7.elrepo.x86_64.rpm
# 	wget https://linux.cc.iitk.ac.in/mirror/centos/elrepo/kernel/el7/x86_64/RPMS/kernel-lt-tools-libs-5.4.200-1.el7.elrepo.x86_64.rpm
# 	wget https://linux.cc.iitk.ac.in/mirror/centos/elrepo/kernel/el7/x86_64/RPMS/kernel-lt-tools-libs-devel-5.4.200-1.el7.elrepo.x86_64.rpm
# 	wget https://linux.cc.iitk.ac.in/mirror/centos/elrepo/kernel/el7/x86_64/RPMS/perf-5.4.200-1.el7.elrepo.x86_64.rpm
# 	wget https://linux.cc.iitk.ac.in/mirror/centos/elrepo/kernel/el7/x86_64/RPMS/python-perf-5.4.200-1.el7.elrepo.x86_64.rpm
# 	sudo yum remove kernel-tools-libs-3.10.0-1160.90.1.el7.x86_64 kernel-headers-3.10.0-1160.90.1.el7.x86_64 kernel-tools-3.10.0-1160.90.1.el7.x86_64
# 	sudo yum install ./*.rpm


install coccinelle:
	git clone https://github.com/coccinelle/coccinelle.git
	cd coccinelle
	sudo yum install -y ocaml-findlib
	./autogen
	./configure
	make
	sudo make install


install drdb:
	# wget https://github.com/LINBIT/drbd/archive/refs/tags/drbd-9.1.7.zip --no-check-certificate -c && unzip drbd-9.1.7.zip

	git clone https://github.com/LINBIT/drbd.git
	cd drdb
	git checkout bfd2450739e3e27cfd0a2eece2cde3d94ad993ae
	git submodule update --init --recursive
	make
	sudo make install

install drbd-utils:

	sudo yum -y install libxslt docbook-xsl asciidoc asciidoctor po4a
	
	git clone https://github.com/LINBIT/drbd-utils.git
	cd drbd-utils
	git submodule update --init --recursive
	./autogen.sh
	./configure --prefix=/usr --localstatedir=/var --sysconfdir=/etc
	make
	sudo make install
	sudo modprobe drbd
	
	
	
use drbd:
	sudo yum install policycoreutils-python lvm2

	sudo parted -s -a optimal -- /dev/vdb mklabel gpt
	sudo parted -s -a optimal -- /dev/vdb mkpart primary 0% 100%
	sudo parted -s -- /dev/vdb align-check optimal 1


	sudo pvcreate /dev/vdb1
	sudo vgcreate drbdpool /dev/vdb1
	sudo lvcreate -n drbdata -l100%FREE drbdpool
	sudo pvs && sudo vgs # checking lvm settings
	
	sudo drbdadm create-md r0
	sudo drbdadm up r0

config node primary:
	sudo drbdadm primary --force r0
	sudo mkfs.xfs /dev/drbd1
	sudo mkdir /mnt/hdd
	sudo mount /dev/drbd1 /mnt/hdd/
	
