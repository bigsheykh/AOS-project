echo none | sudo tee /sys/block/vdb/queue/scheduler
ssh centos@192.168.1.11 'echo none | sudo tee /sys/block/vdb/queue/scheduler'
mkdir resluts

bash script/running-fio.sh write-tuning-protocol-A-sndbuf-2M resluts
bash script/running-fio.sh protocol-A resluts
bash script/running-fio.sh write-tuning-protocol-A resluts
bash script/running-fio.sh disk-throughput-tuning-protocol-B-sndbuf-2k resluts
bash script/running-fio.sh protocol-B-sndbuf-2k resluts
bash script/running-fio.sh protocol-A-sndbuf-2k resluts
bash script/running-fio.sh disk-throughput-tuning-protocol-A-sndbuf-2M resluts
bash script/running-fio.sh protocol-C resluts
bash script/running-fio.sh disk-throughput-tuning-protocol-C resluts
bash script/running-fio.sh write-tuning-protocol-C resluts
bash script/running-fio.sh disk-throughput-tuning-protocol-A-sndbuf-2k resluts
bash script/running-fio.sh write-tuning-protocol-B resluts
bash script/running-fio.sh disk-throughput-tuning-protocol-B resluts
bash script/running-fio.sh write-tuning-protocol-B-sndbuf-2k resluts
bash script/running-fio.sh protocol-A-sndbuf-2M resluts
bash script/running-fio.sh disk-throughput-tuning-protocol-A resluts
bash script/running-fio.sh protocol-B resluts
bash script/running-fio.sh write-tuning-protocol-B-sndbuf-2m resluts
bash script/running-fio.sh write-tuning-protocol-A-sndbuf-2k resluts
bash script/running-fio.sh disk-throughput-tuning-protocol-B-sndbuf-2m resluts
bash script/running-fio.sh protocol-B-sndbuf-2m resluts
