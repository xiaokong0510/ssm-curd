package com.xiao.service;

import com.github.pagehelper.PageInfo;
import com.xiao.dao.EmployeeMapper;
import com.xiao.pojo.Employee;
import com.xiao.pojo.EmployeeExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Classname: EmployeeServiceImpl
 * @Description:
 * @Date: 2020/6/17 23:51
 * @Created by kongx
 */
@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    private EmployeeMapper employeeMapper;

    //查询所有员工
    @Override
    public List<Employee> selectAllEmp() {
        return employeeMapper.selectByExampleWithDept(null);
    }

    //根据员工Id查询员工
    @Override
    public Employee selectEmpById(Integer id) {
        return employeeMapper.selectByPrimaryKeyWithDept(id);
    }

    //添加员工
    @Override
    public void addEmp(Employee employee) {
        employeeMapper.insertSelective(employee);
    }

    //根据email查询员工，校验email是否存在,true代表当前Email可用
    @Override
    public boolean checkEmail(String email) {
        //构建查询条件
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmailEqualTo(email);
        long count = employeeMapper.countByExample(example);
        return count==0;
    }

    //修改员工信息
    @Override
    public void updateEmp(Employee employee) {
        employeeMapper.updateByPrimaryKeySelective(employee);
    }

    //根据id删除员工信息
    @Override
    public void deleteEmp(Integer id) {
        employeeMapper.deleteByPrimaryKey(id);
    }

    //批量删除
    @Override
    public void deleteEmpByIds(List<Integer> ids) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpIdIn(ids);
        employeeMapper.deleteByExample(example);

    }
}
