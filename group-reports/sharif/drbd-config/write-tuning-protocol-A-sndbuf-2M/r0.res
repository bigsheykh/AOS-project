resource r0 {
	net{
        max-epoch-size 10000;
        max-buffers 10000;
		protocol A;
		sndbuf-size 2M;
	}
on sharif-1 {
                device /dev/drbd1;
                disk /dev/mapper/drbdpool-drbdata;
                address 213.233.184.102:7788;
                meta-disk internal;
                }
on sharif-2 {
                device /dev/drbd1;
                disk /dev/mapper/drbdpool-drbdata;
                address 213.233.184.100:7788;
                meta-disk internal;
                }
} 

