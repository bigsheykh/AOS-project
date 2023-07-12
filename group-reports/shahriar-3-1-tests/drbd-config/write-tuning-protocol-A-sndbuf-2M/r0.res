resource r0 {
	net{
        max-epoch-size 10000;
        max-buffers 10000;
		protocol A;
		sndbuf-size 2M;
	}
on shahriar-3 {
                device /dev/drbd1;
                disk /dev/mapper/drbdpool-drbdata;
                address 192.168.1.3:7788;
                meta-disk internal;
                }
on shahriar-1 {
                device /dev/drbd1;
                disk /dev/mapper/drbdpool-drbdata;
                address 192.168.1.11:7788;
                meta-disk internal;
                }
} 

