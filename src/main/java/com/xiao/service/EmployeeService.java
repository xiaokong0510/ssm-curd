package com.xiao.service;


import com.github.pagehelper.PageInfo;
import com.xiao.pojo.Employee;

import java.util.List;

/**
 * @Classname: EmployeeService
 * @Description:
 * @Date: 2020/6/17 23:27
 * @Created by kongx
 */
public interface EmployeeService {

    //查询所有员工
    List<Employee> selectAllEmp();

    //根据员工Id查询员工
    Employee selectEmpById(Integer id);

    //添加员工
    void addEmp(Employee employee);

    //根据email查询员工，校验email是否存在
    boolean checkEmail(String email);

    //修改员工信息
    void updateEmp(Employee employee);

    //根据id删除员工信息
    void deleteEmp(Integer id);

    //批量删除
    void deleteEmpByIds(List<Integer> ids);
}
