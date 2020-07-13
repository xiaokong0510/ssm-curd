package com.xiao.service;

import com.xiao.dao.DepartmentMapper;
import com.xiao.pojo.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Classname: DepartmentServiceImpl
 * @Description:
 * @Date: 2020/6/19 23:56
 * @Created by kongx
 */
@Service
public class DepartmentServiceImpl implements DepartmentService {

    @Autowired
    private DepartmentMapper departmentMapper;

    //查询所有部门信息
    @Override
    public List<Department> selectAllDept() {
        return departmentMapper.selectByExample(null);
    }
}
