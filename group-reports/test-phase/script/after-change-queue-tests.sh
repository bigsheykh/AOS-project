echo deadline | sudo tee /sys/block/vdb/queue/scheduler
echo 0 | sudo tee /sys/block/vdb/queue/iosched/front_merges
echo 120 | sudo tee /sys/block/vdb/queue/iosched/read_expire
echo 1200 | sudo tee /sys/block/vdb/queue/iosched/write_expire
ssh centos@192.168.1.2 'echo deadline | sudo tee /sys/block/vdb/queue/scheduler'
ssh centos@192.168.1.2 'echo 0 | sudo tee /sys/block/vdb/queue/iosched/front_merges'
ssh centos@192.168.1.2 'echo 120 | sudo tee /sys/block/vdb/queue/iosched/read_expire'
ssh centos@192.168.1.2 'echo 1200 | sudo tee /sys/block/vdb/queue/iosched/write_expire'

bash script/running-fio-after-change-queue.sh write-tuning-protocol-A-sndbuf-2M
bash script/running-fio-after-change-queue.sh protocol-A
bash script/running-fio-after-change-queue.sh write-tuning-protocol-A
bash script/running-fio-after-change-queue.sh disk-throughput-tuning-protocol-B-sndbuf-2k
bash script/running-fio-after-change-queue.sh protocol-B-sndbuf-2k
bash script/running-fio-after-change-queue.sh protocol-A-sndbuf-2k
bash script/running-fio-after-change-queue.sh disk-throughput-tuning-protocol-A-sndbuf-2M
bash script/running-fio-after-change-queue.sh protocol-C
bash script/running-fio-after-change-queue.sh disk-throughput-tuning-protocol-C
bash script/running-fio-after-change-queue.sh write-tuning-protocol-C
bash script/running-fio-after-change-queue.sh disk-throughput-tuning-protocol-A-sndbuf-2k
bash script/running-fio-after-change-queue.sh write-tuning-protocol-B
bash script/running-fio-after-change-queue.sh disk-throughput-tuning-protocol-B
bash script/running-fio-after-change-queue.sh write-tuning-protocol-B-sndbuf-2k
bash script/running-fio-after-change-queue.sh protocol-A-sndbuf-2M
bash script/running-fio-after-change-queue.sh disk-throughput-tuning-protocol-A
bash script/running-fio-after-change-queue.sh protocol-B
bash script/running-fio-after-change-queue.sh write-tuning-protocol-B-sndbuf-2m
bash script/running-fio-after-change-queue.sh write-tuning-protocol-A-sndbuf-2k
bash script/running-fio-after-change-queue.sh disk-throughput-tuning-protocol-B-sndbuf-2m
bash script/running-fio-after-change-queue.sh protocol-B-sndbuf-2m
