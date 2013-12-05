select leaveCenterTime as ���ִ�������,
       count(scan_site_name) as �ӵ���,
       scan_site_name as �ֲ�
  from (select scan_site_name, leaveCenterTime
          from (select count(day) as leaveCenterTime,
                       k.scan_site_name,
                       scan_code
                  from (select distinct scan_code,
                                        scan_site_name,
                                        scan_type_name,
                                        trunc(scan_date) as day
                          from usrvf_gg.gt_scan
                         where scan_type_name = '����'
                           and scan_date >=
                               to_date('2013-11-01 00:00:00',
                                       'yyyy-mm-dd  hh24:mi:ss')
                           and scan_date <
                               to_date('2013-11-30 23:59:59',
                                       'yyyy-mm-dd  hh24:mi:ss')) k
                 group by k.scan_site_name, scan_code)
         where leaveCenterTime = 1)
 group by leaveCenterTime, scan_site_name
