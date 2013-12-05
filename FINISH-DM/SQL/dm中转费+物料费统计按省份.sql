select zhongzhuan.��ת���� as incomeTrans,zhongzhuan.ʡ�� as province, wuliao.�������� as incomeStock
  from (select sum(money) as ��ת����, ʡ��, trunc(���� - 1 / 2) as ����
          from (select distinct b.code,
                                t.price_type ��������,
                                case
                                  when t.price_type = '�ɼ���' then
                                   -1 * to_number(t.money)
                                  else
                                   to_number(t.money)
                                end money,
                                case
                                  when (s.range_id = 60002) then
                                   '����'
                                  when s.org_name = '�����ֹ�˾' then
                                   '�㽭'
                                  else
                                   replace(s.org_name, '�ֹ�˾', '')
                                end ʡ��,
                                a.operate_site_name �Ʒ�����,
                                a.site_name ��һվ,
                                a.operate_site_name ����վ,
                                a.pay_company ���,
                                a.charge_company �տ,
                                t.created_time as ����
                
                  from usrvf_gg.gt_bill_detail t,
                       usrvf_gg.gt_charging    a,
                       usrvf_gg.gt_bill        b,
                       usrvf_gg.gt_site        s
                 where t.charging_id = a.id
                   and a.bill_id = b.id
                   and b.send_site_id = s.id
                   and t.created_time >=
                       to_date('2013-11-18 12:00:00',
                               'yyyy-mm-dd  hh24:mi:ss')
                   and t.created_time <=
                       to_date('2013-11-19 11:59:59',
                               'yyyy-mm-dd  hh24:mi:ss'))
         group by trunc(���� - 1 / 2), ʡ��) zhongzhuan,
       (select sum(����) as ��������, ʡ��
          from (select sum(money) as ����,
                       case
                         when (s.org_name = '�����ֹ�˾' or s.org_name = '���ֹ�˾' or
                              s.org_name = '�ӱ��ֹ�˾') then
                          '����'
                         when s.org_name = '�����ֹ�˾' then
                          '�㽭'
                         else
                          replace(s.org_name, '�ֹ�˾', '')
                       end ʡ��,
                       trunc(register_date) as ����
                  from GT_STOCK_APPLY t, usrvf_gg.gt_site s
                 where t.register_date >=
                       to_date('2013-11-18 00:00:00',
                               'yyyy-mm-dd  hh24:mi:ss')
                   and t.register_date <=
                       to_date('2013-11-19 23:59:59',
                               'yyyy-mm-dd  hh24:mi:ss')
                   and s.id = t.apply_site_id
                 group by trunc(register_date), s.org_name)
         group by ʡ��) wuliao
 where 
   zhongzhuan.ʡ�� = wuliao.ʡ��(+)
   order by province
/* group by to_char(shouru.����, 'yyyy-IW')*/

/*select distinct b.code,
               t.price_type ��������,
               case
                 when a.charge_company_id = 5555 then
                  t.money
                 else
                  '-' || t.money
               end ���,
               case
                 when a.charge_company_id = 5555 then
                  a.operate_site_name
                 else
                  a.site_name
               end �Ʒ�����,
               a.site_name ��һվ,
               a.operate_site_name ����վ,
               a.pay_company ���,
               a.charge_company �տ,
               trunc(t.created_time) as ����

 from usrvf_gg.gt_bill_detail t,
      usrvf_gg.gt_charging    a,
      usrvf_gg.gt_bill        b
where t.charging_id = a.id
  and a.bill_id = b.id*/
