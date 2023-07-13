resource r0 {
	net{
		protocol B;
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

