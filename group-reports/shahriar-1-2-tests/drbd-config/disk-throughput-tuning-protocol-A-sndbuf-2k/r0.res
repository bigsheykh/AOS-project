resource r0 {
	net{
		protocol A;
		sndbuf-size 2K;
	}
        disk{
                disk-barrier no;
                disk-flushes no;
                al-extents 6007;
        }
on shahriar-2 {
                device /dev/drbd1;
                disk /dev/mapper/drbdpool-drbdata;
                address 192.168.1.2:7788;
                meta-disk internal;
                }
on shahriar-1 {
                device /dev/drbd1;
                disk /dev/mapper/drbdpool-drbdata;
                address 192.168.1.11:7788;
                meta-disk internal;
                }
} 

