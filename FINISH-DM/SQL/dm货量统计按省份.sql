select sum(weight) as 重量,省份 from (select sum(WEIGHT) as weight,
       case
         when (s.range_id = 60002) then
          '华北'
          when s.org_name = '福建分公司' then '浙江'
         else
          replace(s.org_name, '分公司', '')
       end 出发省份,
       case
         when (ss.range_id = 60002) then
          '华北'
          when ss.org_name = '福建分公司' then '浙江'
         else
          replace(ss.org_name, '分公司', '')
       end 目的省份       
  from usrvf_gg.gt_bill t, usrvf_gg.gt_site s,usrvf_gg.gt_site ss
 where t.SEND_DATE >=
       to_date('2013-11-18 12:00:00', 'yyyy-mm-dd  hh24:mi:ss')
   and t.SEND_DATE <=
       to_date('2013-11-19 11:59:59', 'yyyy-mm-dd  hh24:mi:ss')
   and t.disp_site_id = s.id
   and t.disp_site_id = ss.id
 group by trunc(t.send_date - 1 / 2), s.org_name)
 group by 省份
