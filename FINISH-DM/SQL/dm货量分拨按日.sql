select sum(w) as ����, �ֲ�
  from (select sum(weight) as w,
               case
                 when t.center_in_name = '����' then
                  '����'
                 when t.center_in_name = '��ɽ' then
                  '����'
                 when t.center_in_name = '�ɾ�' then
                  '̨��'
                 when t.center_in_name = '˳��' then
                  '����'
                 when t.center_in_name = '����' then
                  '�Ͼ�'
                 when t.center_in_name = '�Ϻ�����һ��' then
                  '�Ϻ�'
                 when t.center_in_name = '��ɽ' then
                  '����'
                 when t.center_in_name = 'ݸ��' then
                  '����'
                 when t.center_in_name = '��' then
                  '̨��'
                 when t.center_in_name = '����һ��' then
                  '̨��'
                 when t.center_in_name = '��Դ' then
                  '����'
                 when t.center_in_name = '�ӱ��ȷ�' then
                  '����'
                 when t.center_in_name = '����' then
                  '����'
                 when t.center_in_name = '�ӱ��żҿ�' then
                  '����'
                 else
                  replace(t.center_in_name,'�ֲ�','') 
               end �ֲ�
          from usrvf_gg.gt_bill t, usrvf_gg.gt_site s
         where t.created_time >=
               to_date('2013-10-27 08:00:00', 'yyyy-mm-dd  hh24:mi:ss')
           and t.created_time <=
               to_date('2013-10-28 07:59:59', 'yyyy-mm-dd  hh24:mi:ss')
           and t.send_site_id = s.id
         group by t.center_in_name)
 group by �ֲ�
 order by ���� desc
