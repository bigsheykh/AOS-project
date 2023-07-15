echo none | sudo tee /sys/block/sde/queue/scheduler
ssh root@213.233.184.100 'echo none | tee /sys/block/sde/queue/scheduler'
mkdir results

bash script/running-fio.sh write-tuning-protocol-A-sndbuf-2M results 10G
bash script/running-fio.sh protocol-A results 10G
bash script/running-fio.sh write-tuning-protocol-A results 10G
bash script/running-fio.sh disk-throughput-tuning-protocol-B-sndbuf-2k results 10G
bash script/running-fio.sh protocol-B-sndbuf-2k results 10G
bash script/running-fio.sh protocol-A-sndbuf-2k results 10G
bash script/running-fio.sh disk-throughput-tuning-protocol-A-sndbuf-2M results 10G
bash script/running-fio.sh protocol-C results 10G
bash script/running-fio.sh disk-throughput-tuning-protocol-C results 10G
bash script/running-fio.sh write-tuning-protocol-C results 10G
bash script/running-fio.sh disk-throughput-tuning-protocol-A-sndbuf-2k results 10G
bash script/running-fio.sh write-tuning-protocol-B results 10G
bash script/running-fio.sh disk-throughput-tuning-protocol-B results 10G
bash script/running-fio.sh write-tuning-protocol-B-sndbuf-2k results 10G
bash script/running-fio.sh protocol-A-sndbuf-2M results 10G
bash script/running-fio.sh disk-throughput-tuning-protocol-A results 10G
bash script/running-fio.sh protocol-B results 10G
bash script/running-fio.sh write-tuning-protocol-B-sndbuf-2m results 10G
bash script/running-fio.sh write-tuning-protocol-A-sndbuf-2k results 10G
bash script/running-fio.sh disk-throughput-tuning-protocol-B-sndbuf-2m results 10G
bash script/running-fio.sh protocol-B-sndbuf-2m results 10G

bash script/running-fio.sh write-tuning-protocol-A-sndbuf-2M results 100G
bash script/running-fio.sh protocol-A results 100G
bash script/running-fio.sh write-tuning-protocol-A results 100G
bash script/running-fio.sh disk-throughput-tuning-protocol-B-sndbuf-2k results 100G
bash script/running-fio.sh protocol-B-sndbuf-2k results 100G
bash script/running-fio.sh protocol-A-sndbuf-2k results 100G
bash script/running-fio.sh disk-throughput-tuning-protocol-A-sndbuf-2M results 100G
bash script/running-fio.sh protocol-C results 100G
bash script/running-fio.sh disk-throughput-tuning-protocol-C results 100G
bash script/running-fio.sh write-tuning-protocol-C results 100G
bash script/running-fio.sh disk-throughput-tuning-protocol-A-sndbuf-2k results 100G
bash script/running-fio.sh write-tuning-protocol-B results 100G
bash script/running-fio.sh disk-throughput-tuning-protocol-B results 100G
bash script/running-fio.sh write-tuning-protocol-B-sndbuf-2k results 100G
bash script/running-fio.sh protocol-A-sndbuf-2M results 100G
bash script/running-fio.sh disk-throughput-tuning-protocol-A results 100G
bash script/running-fio.sh protocol-B results 100G
bash script/running-fio.sh write-tuning-protocol-B-sndbuf-2m results 100G
bash script/running-fio.sh write-tuning-protocol-A-sndbuf-2k results 100G
bash script/running-fio.sh disk-throughput-tuning-protocol-B-sndbuf-2m results 100G
bash script/running-fio.sh protocol-B-sndbuf-2m results 100G

