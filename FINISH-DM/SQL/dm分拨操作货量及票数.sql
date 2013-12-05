select scan_site_name as �ֲ�,
       round(sum(weight) * 2/1000) as ����,
       count(scan_code)*2 as Ʊ��
  from (select distinct t.scan_code,
                        replace(t.scan_site_name,'�ֲ�','')  as   scan_site_name,                
                        b.weight
          from usrvf_gg.gt_scan t, usrvf_gg.gt_bill b
         where t.record_site_name like '%�ֲ�%'
           and t.scan_date >= ? + 1/2
           and t.scan_date <= ? + 3/2                   
           and (length(t.scan_code) = 11 or length(t.scan_code) = 12)
           and t.scan_code = b.code)
 group by scan_site_name 
