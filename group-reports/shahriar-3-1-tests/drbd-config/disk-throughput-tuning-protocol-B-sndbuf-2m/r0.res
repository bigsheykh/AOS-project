resource r0 {
	net{
		protocol B;
		sndbuf-size 2M;
	}
        disk{
                disk-barrier no;
                disk-flushes no;
                al-extents 6007;
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

