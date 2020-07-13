package com.xiao.dao;

import com.xiao.pojo.Employee;
import com.xiao.pojo.EmployeeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EmployeeMapper {
    //按条件计数
    long countByExample(EmployeeExample example);
    //按条件删除
    int deleteByExample(EmployeeExample example);
    //按主键删除
    int deleteByPrimaryKey(Integer empId);
    //插入数据（返回值为ID），所有的字段都会添加一遍即使没有值
    int insert(Employee record);
    //插入数据，只给有值的字段赋值（会对传进来的值做非空判断）
    int insertSelective(Employee record);
    //按条件查询
    List<Employee> selectByExample(EmployeeExample example);
    //按Id查询
    Employee selectByPrimaryKey(Integer empId);

    //按条件查询,并且携带部门信息
    List<Employee> selectByExampleWithDept(EmployeeExample example);
    //按Id查询，,并且携带部门信息
    Employee selectByPrimaryKeyWithDept(Integer empId);

    //按条件更新值不为null的字段
    int updateByExampleSelective(@Param("record") Employee record, @Param("example") EmployeeExample example);
    //按条件更新
    int updateByExample(@Param("record") Employee record, @Param("example") EmployeeExample example);
    //按主键更新值不为null的字段
    int updateByPrimaryKeySelective(Employee record);
    //按主键更新
    int updateByPrimaryKey(Employee record);


}