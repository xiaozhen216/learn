select sum(weight) as ����,ʡ�� from (select sum(WEIGHT) as weight,
       case
         when (s.range_id = 60002) then
          '����'
          when s.org_name = '�����ֹ�˾' then '�㽭'
         else
          replace(s.org_name, '�ֹ�˾', '')
       end ����ʡ��,
       case
         when (ss.range_id = 60002) then
          '����'
          when ss.org_name = '�����ֹ�˾' then '�㽭'
         else
          replace(ss.org_name, '�ֹ�˾', '')
       end Ŀ��ʡ��       
  from usrvf_gg.gt_bill t, usrvf_gg.gt_site s,usrvf_gg.gt_site ss
 where t.SEND_DATE >=
       to_date('2013-11-18 12:00:00', 'yyyy-mm-dd  hh24:mi:ss')
   and t.SEND_DATE <=
       to_date('2013-11-19 11:59:59', 'yyyy-mm-dd  hh24:mi:ss')
   and t.disp_site_id = s.id
   and t.disp_site_id = ss.id
 group by trunc(t.send_date - 1 / 2), s.org_name)
 group by ʡ��
