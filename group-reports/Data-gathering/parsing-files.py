from parse import parse, compile


def read_file(file_directory):
    file_info = {}
    texts = open(file_directory).read()
    texts = texts.splitlines()

    basic_info_parser = compile('{job_name}-test-job: (groupid=0, jobs={nomber_of_jobs}): err= 0: pid={}: {day_of_weak} {month} {day} {hour}:{min}:{sec} {year}')
    cpu_parser = compile('  cpu          : usr={user_percentage}%, sys={sys_percentage}%, ctx={ctx}, majf={majf}, minf={minf}')
    issued_read_write = compile('     issued rwts: total={read},{write},0,0 short=0,0,0,0 dropped=0,0,0,0')
    io_depth_parser = compile('  IO depths    : 1={I1}%, 2={I2}%, 4={I4}%, 8={I8}%, 16={I16}%, 32={I32}%, >=64={I64}%')
    read_basic_info_parser = compile('   read: IOPS={IOPS}, BW={} ({bandwidth})({io}/{runtime})') # should remain
    write_basic_info_parser = compile('  write: IOPS={IOPS}, BW={} ({bandwidth})({io}/{runtime})') # should remain
    submission_latency_parser = compile('    slat ({unit}): min={min}, max={max}, avg={avg}, stdev{stdev}')
    completion_latency_parser = compile('    clat ({unit}): min={min}, max={max}, avg={avg}, stdev{stdev}')
    rw_latency_parser = compile('     lat ({unit}): min={min}, max={max}, avg={avg}, stdev{stdev}')
    bandwidth_parser = compile('   bw (  KiB/s): min={min}, max={max}, per={per}, avg={avg}, stdev={stdev}, samples={samples}')
    iops_parser = compile('   iops        : min={min}, max={max}, avg={avg}, stdev={stdev}, samples={samples}')
    latency_parser = compile('  lat ({unit})   : {all_latencies}')
    small_latency_parser = compile('{value}={percentage}%')
    drbd_disk_stat_parser = compile('    drbd1: ios={}, merge={}, ticks={}, in_queue={in_queue}, util={utility}%, aggrios={}, aggrmerge={}, aggrticks={}, aggrin_queue={}, aggrutil={}%')
    dm_0_disk_stat_parser = compile('    dm-0: ios={}, merge={}, ticks={}, in_queue={in_queue}, util={utility}%, aggrios={}, aggrmerge={}, aggrticks={}, aggrin_queue={}, aggrutil={}%')
    original_disk_stat_parser = compile('{}: ios={}, merge={}, ticks={}, in_queue={in_queue}, util={utility}%')

    mode = ""
    latencies_stat = []
    for line in texts:
        drbd_disk_stat = drbd_disk_stat_parser.parse(line)
        if drbd_disk_stat is not None:
            file_info['drbd_disk_stat'] = drbd_disk_stat.named
        dm_0_disk_stat = dm_0_disk_stat_parser.parse(line)
        if dm_0_disk_stat is not None:
            file_info['dm_0_disk_stat'] = dm_0_disk_stat.named
        original_disk_stat = original_disk_stat_parser.parse(line)
        if original_disk_stat is not None:
            file_info['original_disk_stat'] = original_disk_stat.named


        latencies = latency_parser.parse(line)
        if latencies is not None:
            latency_unit = latencies.named['unit']
            all_latencies = latencies.named['all_latencies'].split(', ')
            for l in all_latencies:
                lat = small_latency_parser.parse(l)
                if lat is not None:
                    latencies_stat.append({'latency_unit':latency_unit, 'value':lat.named['value'],
                                           'percentage':lat.named['percentage']})

        rw_latency = rw_latency_parser.parse(line)
        if rw_latency is not None:
            file_info[mode + '_latency'] = rw_latency.named

        submission_latency = submission_latency_parser.parse(line)
        if submission_latency is not None:
            file_info[mode + '_submission_latency'] = submission_latency.named

        completion_latency = completion_latency_parser.parse(line)
        if completion_latency is not None:
            file_info[mode + '_completion_latency'] = completion_latency.named



        read_basic_info = read_basic_info_parser.parse(line)
        if read_basic_info is not None:
            file_info['read_basic_info'] = read_basic_info.named
            mode = "read"

        write_basic_info = write_basic_info_parser.parse(line)
        if write_basic_info is not None:
            file_info['write_basic_info'] = write_basic_info.named
            mode = "write"

        bandwidth = bandwidth_parser.parse(line)
        if bandwidth is not None:
            file_info[mode + '_bandwidth'] = bandwidth.named

        iops = iops_parser.parse(line)
        if iops is not None:
            file_info[mode + '_iops'] = iops.named


        basic_info = basic_info_parser.parse(line)
        if basic_info is not None:
            file_info['basic_info'] = basic_info.named

        cpu_parsed = cpu_parser.parse(line)
        if cpu_parsed is not None:
            file_info['cpu'] = cpu_parsed.named

        issue_rw = issued_read_write.parse(line)
        if issue_rw is not None:
            file_info['issued_read_write'] = issue_rw.named

        io_depth = io_depth_parser.parse(line)
        if io_depth is not None:
            file_info['io_depth'] = io_depth.named

    file_info['latencies_stat'] = latencies_stat
    return file_info


print(read_file("../shahriar-1-2-tests/results/protocol-A/test-5.txt"))
# print(read_file("sharif/test-5.txt"))
# print(read_file("sharif/test-1.txt"))

