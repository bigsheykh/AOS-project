CONFIG_NAME=$1

echo "config $CONFIG_NAME is running."
sudo cp drbd-config/$CONFIG_NAME/r0.res /etc/drbd.d/
sudo drbdadm adjust r0

# use sshfs and ssh-copy-id before that
ssh centos@192.168.1.2 'sudo drbdadm adjust r0'
ssh centos@192.168.1.2 'sudo drbdadm status r0'

sudo fio --filename=/mnt/hdd/output_file --direct=1 --readwrite=read --bs=4M --ioengine=libaio --iodepth=16 --numjobs=1 --runtime=600 --time_based --group_reporting --name=read-sequentially-test-job --refill_buffers --norandommap --randrepeat=0 --size=10G > test-1.txt

sudo rm /mnt/hdd/output_file

sudo fio --filename=/mnt/hdd/output_file --direct=1 --readwrite=write --bs=4M --ioengine=libaio --iodepth=16 --numjobs=1 --runtime=600 --time_based --group_reporting --name=write-sequentially-test-job --refill_buffers --norandommap --randrepeat=0 --size=10G > test-2.txt

sudo rm /mnt/hdd/output_file

sudo fio --filename=/mnt/hdd/output_file --direct=1 --random_distribution=zipf:1.2 --readwrite=randread --bs=8k --ioengine=libaio --iodepth=16 --numjobs=16 --runtime=600 --time_based --group_reporting --name=read-randomly-test-job --refill_buffers --norandommap --randrepeat=0 --size=10G > test-3.txt

sudo rm /mnt/hdd/output_file

sudo fio --filename=/mnt/hdd/output_file --direct=1 --random_distribution=zipf:1.2 --readwrite=randwrite --bs=8k --ioengine=libaio --iodepth=16 --numjobs=16 --runtime=600 --time_based --group_reporting --name=write-randomly-test-job --refill_buffers --norandommap --randrepeat=0 --size=10G > test-4.txt

sudo rm /mnt/hdd/output_file

sudo fio --filename=/mnt/hdd/output_file --direct=1 --random_distribution=zipf:1.2 --readwrite=randrw --bs=8k --ioengine=libaio --rwmixread=70 --rwmixwrite=30 --iodepth=16 --numjobs=16 --runtime=600 --time_based --group_reporting --name=readwrite-randomly-test-job --refill_buffers --norandommap --randrepeat=0 --size=10G > test-5.txt

sudo rm /mnt/hdd/output_file

rmdir -rf results/$CONFIG_NAME
mkdir results/$CONFIG_NAME
cp test*.txt results/$CONFIG_NAME
