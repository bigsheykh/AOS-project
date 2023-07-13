echo deadline | sudo tee /sys/block/vdb/queue/scheduler
echo 0 | sudo tee /sys/block/vdb/queue/iosched/front_merges
echo 120 | sudo tee /sys/block/vdb/queue/iosched/read_expire
echo 1200 | sudo tee /sys/block/vdb/queue/iosched/write_expire
ssh user1@213.233.184.100 'echo deadline | sudo tee /sys/block/vdb/queue/scheduler'
ssh user1@213.233.184.100 'echo 0 | sudo tee /sys/block/vdb/queue/iosched/front_merges'
ssh user1@213.233.184.100 'echo 120 | sudo tee /sys/block/vdb/queue/iosched/read_expire'
ssh user1@213.233.184.100 'echo 1200 | sudo tee /sys/block/vdb/queue/iosched/write_expire'

mkdir results-after-queue

bash script/running-fio.sh write-tuning-protocol-A-sndbuf-2M results-after-queue 10G
bash script/running-fio.sh protocol-A results-after-queue 10G
bash script/running-fio.sh write-tuning-protocol-A results-after-queue 10G
bash script/running-fio.sh disk-throughput-tuning-protocol-B-sndbuf-2k results-after-queue 10G
bash script/running-fio.sh protocol-B-sndbuf-2k results-after-queue 10G
bash script/running-fio.sh protocol-A-sndbuf-2k results-after-queue 10G
bash script/running-fio.sh disk-throughput-tuning-protocol-A-sndbuf-2M results-after-queue 10G
bash script/running-fio.sh protocol-C results-after-queue 10G
bash script/running-fio.sh disk-throughput-tuning-protocol-C results-after-queue 10G
bash script/running-fio.sh write-tuning-protocol-C results-after-queue 10G
bash script/running-fio.sh disk-throughput-tuning-protocol-A-sndbuf-2k results-after-queue 10G
bash script/running-fio.sh write-tuning-protocol-B results-after-queue 10G
bash script/running-fio.sh disk-throughput-tuning-protocol-B results-after-queue 10G
bash script/running-fio.sh write-tuning-protocol-B-sndbuf-2k results-after-queue 10G
bash script/running-fio.sh protocol-A-sndbuf-2M results-after-queue 10G
bash script/running-fio.sh disk-throughput-tuning-protocol-A results-after-queue 10G
bash script/running-fio.sh protocol-B results-after-queue 10G
bash script/running-fio.sh write-tuning-protocol-B-sndbuf-2m results-after-queue 10G
bash script/running-fio.sh write-tuning-protocol-A-sndbuf-2k results-after-queue 10G
bash script/running-fio.sh disk-throughput-tuning-protocol-B-sndbuf-2m results-after-queue 10G
bash script/running-fio.sh protocol-B-sndbuf-2m results-after-queue 10G

bash script/running-fio.sh write-tuning-protocol-A-sndbuf-2M results-after-queue 100G
bash script/running-fio.sh protocol-A results-after-queue 100G
bash script/running-fio.sh write-tuning-protocol-A results-after-queue 100G
bash script/running-fio.sh disk-throughput-tuning-protocol-B-sndbuf-2k results-after-queue 100G
bash script/running-fio.sh protocol-B-sndbuf-2k results-after-queue 100G
bash script/running-fio.sh protocol-A-sndbuf-2k results-after-queue 100G
bash script/running-fio.sh disk-throughput-tuning-protocol-A-sndbuf-2M results-after-queue 100G
bash script/running-fio.sh protocol-C results-after-queue 100G
bash script/running-fio.sh disk-throughput-tuning-protocol-C results-after-queue 100G
bash script/running-fio.sh write-tuning-protocol-C results-after-queue 100G
bash script/running-fio.sh disk-throughput-tuning-protocol-A-sndbuf-2k results-after-queue 100G
bash script/running-fio.sh write-tuning-protocol-B results-after-queue 100G
bash script/running-fio.sh disk-throughput-tuning-protocol-B results-after-queue 100G
bash script/running-fio.sh write-tuning-protocol-B-sndbuf-2k results-after-queue 100G
bash script/running-fio.sh protocol-A-sndbuf-2M results-after-queue 100G
bash script/running-fio.sh disk-throughput-tuning-protocol-A results-after-queue 100G
bash script/running-fio.sh protocol-B results-after-queue 100G
bash script/running-fio.sh write-tuning-protocol-B-sndbuf-2m results-after-queue 100G
bash script/running-fio.sh write-tuning-protocol-A-sndbuf-2k results-after-queue 100G
bash script/running-fio.sh disk-throughput-tuning-protocol-B-sndbuf-2m results-after-queue 100G
bash script/running-fio.sh protocol-B-sndbuf-2m results-after-queue 100G