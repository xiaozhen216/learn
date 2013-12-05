select inCenter.����  as ����,
       inCenter.����  as ��������,
       outCenter.���� as ��������
  from (select round(sum(w)/1000) as ����, �ֲ�,����
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
                          replace(t.center_in_name, '�ֲ�', '')
                       end �ֲ�,
                       trunc(t.created_time - 1 / 2) as ����
                  from usrvf_gg.gt_bill t, usrvf_gg.gt_site s
                 where t.created_time >=
                       to_date('2013-10-1 08:00:00', 'yyyy-mm-dd  hh24:mi:ss') +
                       1 / 2
                   and t.created_time <=
                       to_date('2013-10-25 08:00:00',
                               'yyyy-mm-dd  hh24:mi:ss') + 3 / 2
                   and t.send_site_id = s.id
                 group by t.center_in_name, trunc(t.created_time - 1 / 2))
         group by ����,�ֲ�) inCenter,
       (select round(sum(w)/1000) as ����, �ֲ�,����
          from (select sum(weight) as w,
                       case
                         when t.center_out_name = '����' then
                          '����'
                         when t.center_out_name = '��ɽ' then
                          '����'
                         when t.center_out_name = '�ɾ�' then
                          '̨��'
                         when t.center_out_name = '˳��' then
                          '����'
                         when t.center_out_name = '����' then
                          '�Ͼ�'
                         when t.center_out_name = '�Ϻ�����һ��' then
                          '�Ϻ�'
                         when t.center_out_name = '��ɽ' then
                          '����'
                         when t.center_out_name = 'ݸ��' then
                          '����'
                         when t.center_out_name = '��' then
                          '̨��'
                         when t.center_out_name = '����һ��' then
                          '̨��'
                         when t.center_out_name = '��Դ' then
                          '����'
                         when t.center_out_name = '�ӱ��ȷ�' then
                          '����'
                         when t.center_out_name = '����' then
                          '����'
                         when t.center_out_name = '�ӱ��żҿ�' then
                          '����'
                         else
                          replace(t.center_out_name, '�ֲ�', '')
                       end �ֲ�,
                       trunc(t.created_time - 1 / 2) as ����
                  from usrvf_gg.gt_bill t, usrvf_gg.gt_site s
                 where t.created_time >=
                       to_date('2013-10-1 08:00:00', 'yyyy-mm-dd  hh24:mi:ss') +
                       1 / 2
                   and t.created_time <=
                       to_date('2013-10-25 08:00:00',
                               'yyyy-mm-dd  hh24:mi:ss') + 3 / 2
                   and t.send_site_id = s.id
                 group by t.center_out_name, trunc(t.created_time - 1 / 2))
         group by ����,�ֲ�) outCenter
 where inCenter.���� = outCenter.����
   and inCenter.�ֲ� = outCenter.�ֲ�
   and inCenter.�ֲ� = '����'
 order by ����
