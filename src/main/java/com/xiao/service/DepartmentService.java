package com.xiao.service;

import com.xiao.pojo.Department;

import java.util.List;

/**
 * @Classname: DepartmentService
 * @Description:
 * @Date: 2020/6/19 23:55
 * @Created by kongx
 */
public interface DepartmentService {

    //查询所有部门信息
    List<Department> selectAllDept();


}
