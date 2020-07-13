package com.xiao.controller;

import com.xiao.commom.Result;
import com.xiao.commom.StatusCode;
import com.xiao.pojo.Department;
import com.xiao.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @Classname: DepartmentController
 * @Description:
 * @Date: 2020/6/19 23:54
 * @Created by kongx
 */
@Controller
public class DepartmentController {
    @Autowired
    private DepartmentService departmentService;

    //返回所有部门信息
    @ResponseBody
    @RequestMapping("/depts")
    public Result<List> getAllDepts() {
        List<Department> departments = departmentService.selectAllDept();
        return new Result<List>(true, StatusCode.OK,"查询成功！",departments);
    }
}
