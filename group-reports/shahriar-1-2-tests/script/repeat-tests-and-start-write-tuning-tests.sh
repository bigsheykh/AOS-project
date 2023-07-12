echo none | sudo tee /sys/block/vdb/queue/scheduler
ssh centos@192.168.1.2 'echo none | sudo tee /sys/block/vdb/queue/scheduler'

bash script/running-fio.sh write-tuning-protocol-A-sndbuf-2M
bash script/running-fio.sh protocol-A
bash script/running-fio.sh write-tuning-protocol-A
bash script/running-fio.sh disk-throughput-tuning-protocol-B-sndbuf-2k
bash script/running-fio.sh protocol-B-sndbuf-2k
bash script/running-fio.sh protocol-A-sndbuf-2k
bash script/running-fio.sh disk-throughput-tuning-protocol-A-sndbuf-2M
bash script/running-fio.sh protocol-C
bash script/running-fio.sh disk-throughput-tuning-protocol-C
bash script/running-fio.sh write-tuning-protocol-C
bash script/running-fio.sh disk-throughput-tuning-protocol-A-sndbuf-2k
bash script/running-fio.sh write-tuning-protocol-B
bash script/running-fio.sh disk-throughput-tuning-protocol-B
bash script/running-fio.sh write-tuning-protocol-B-sndbuf-2k
bash script/running-fio.sh protocol-A-sndbuf-2M
bash script/running-fio.sh disk-throughput-tuning-protocol-A
bash script/running-fio.sh protocol-B
bash script/running-fio.sh write-tuning-protocol-B-sndbuf-2m
bash script/running-fio.sh write-tuning-protocol-A-sndbuf-2k
bash script/running-fio.sh disk-throughput-tuning-protocol-B-sndbuf-2m
bash script/running-fio.sh protocol-B-sndbuf-2m
