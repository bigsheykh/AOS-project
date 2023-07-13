echo deadline | sudo tee /sys/block/sde/queue/scheduler
echo 0 | sudo tee /sys/block/sde/queue/iosched/front_merges
echo 120 | sudo tee /sys/block/sde/queue/iosched/read_expire
echo 1200 | sudo tee /sys/block/sde/queue/iosched/write_expire
ssh root@213.233.184.100 'echo deadline | tee /sys/block/sde/queue/scheduler'
ssh root@213.233.184.100 'echo 0 | tee /sys/block/sde/queue/iosched/front_merges'
ssh root@213.233.184.100 'echo 120 | tee /sys/block/sde/queue/iosched/read_expire'
ssh root@213.233.184.100 'echo 1200 | tee /sys/block/sde/queue/iosched/write_expire'

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
