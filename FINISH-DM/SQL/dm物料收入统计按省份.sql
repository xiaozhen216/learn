 select sum(����) as ����,ʡ�� from (select sum(money) as ����,  case
         when (s.org_name = '�����ֹ�˾' or s.org_name = '���ֹ�˾' or
              s.org_name = '�ӱ��ֹ�˾') then
          '����'
          when s.org_name = '�����ֹ�˾' then '�㽭'
         else
          replace(s.org_name, '�ֹ�˾', '')
       end ʡ��   ,trunc(register_date) as ����
  from GT_STOCK_APPLY t,usrvf_gg.gt_site s
 where t.register_date >=
       to_date('2013-10-1 00:00:00', 'yyyy-mm-dd  hh24:mi:ss')
   and t.register_date <=
       to_date('2013-11-19 23:59:59', 'yyyy-mm-dd  hh24:mi:ss')
   and s.id=t.apply_site_id
 group by trunc(register_date),s.org_name)
 group by ʡ��
 
