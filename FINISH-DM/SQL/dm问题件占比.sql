select sum(mainp) / count(mainp) as �ٷֱ�, day as ����
  from (select case
                 when (t.problem_type_name = '����' or t.problem_type_name = '�ټ�') then
                  1
                 else
                  0
               end mainp,
               trunc(created_time - 1 / 2) as day
          from usrvf_gg.gt_problem t 
         where t.created_time < ?
               
           and t.created_time -1 >= ?
              )
 group by day          
        
