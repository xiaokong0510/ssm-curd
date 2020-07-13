package com.xiao.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xiao.commom.Result;
import com.xiao.commom.StatusCode;
import com.xiao.pojo.Employee;
import com.xiao.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.*;

/**
 * @Classname: EmployeeController
 * @Description:
 * @Date: 2020/6/17 23:59
 * @Created by kongx
 */
@Controller
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;

    /**
     * 查询所有员工信息并分页显示
     *
     * @param page     当前页码
     * @param modelMap
     * @return list页面进行显示
     */
    @RequestMapping("/emps")
    public String getAllEmps(@RequestParam(value = "page", defaultValue = "1") Integer page, ModelMap modelMap) {
        //引入PageHelper分页插件，在查询之前传入页码,每页显示pageSize条
        PageHelper.startPage(page,10);
        List<Employee> list = employeeService.selectAllEmp();
        //使用PageInfo包装查询后的结果，navigatePages表示连续显示的页数
        PageInfo<Employee> pageInfo = new PageInfo<>(list, 5);
        //将 PageInfo交给前端页面获取
        modelMap.addAttribute("pageInfo", pageInfo);
        for (Employee employee : pageInfo.getList()) {
            System.out.println(employee);
        }
        return "list";
    }
    //根据id查询员工信息
    @ResponseBody
    @GetMapping("/emp/{empId}")
    public Result<Employee> getEmpById(@PathVariable("empId") Integer id){
        Employee employee = employeeService.selectEmpById(id);
        return new Result<Employee>(true, StatusCode.OK, "根据id查询员工操作成功！",employee);

    }

    //新增员工,这里还要进行后端校验
    @ResponseBody
    @PostMapping("/emp")
    public Result<Map<String, Object>> insertEmp(@Valid Employee employee, BindingResult result) {
        if (result.hasErrors()) {
            List<FieldError> fieldErrors = result.getFieldErrors();
            Map<String, Object> map = new HashMap<>();
            for (FieldError error : fieldErrors) {
                System.out.println("错误的字段名为：" + error.getField());
                System.out.println("错误信息为：" + error.getDefaultMessage());
                map.put(error.getField(), error.getDefaultMessage());
            }
            return new Result<>(false, StatusCode.ERROR, "新增员工操作失败！", map);
        } else {
            employeeService.addEmp(employee);
            return new Result<>(true, StatusCode.OK, "新增员工操作成功！");
        }
    }

    //后端校验email是否可用
    @ResponseBody
    @RequestMapping("/checkEmail")
    public Result checkEmail(@RequestParam("email") String email) {
        boolean b = employeeService.checkEmail(email);
        if (b) {
            return new Result(true, StatusCode.OK, "该Email地址可用");
        } else {
            return new Result(false, StatusCode.ERROR, "该Email地址已存在，请更换！");
        }
    }

    //修改员工信息
    @ResponseBody
    @PutMapping("/emp/{empId}")
    public Result updateEmp(Employee employee) {
        System.out.println(employee);
        employeeService.updateEmp(employee);
        return new Result(true, StatusCode.OK, "修改员工信息成功！");
    }

    //删除员工信息
    //单个+批量二合一
    @ResponseBody
    @DeleteMapping("/emp/{empIds}")
    public Result deleteEmp(@PathVariable("empIds") String empIds) {
        //请求参数中包含逗号，说明是批量删除
        if (empIds.contains(",")) {
            System.out.println(empIds);
            List<Integer> ids = new ArrayList<>();
            String[] split = empIds.split(",");
            for (String s : split) {
                ids.add(Integer.parseInt(s));
            }
            employeeService.deleteEmpByIds(ids);
            return new Result(true, StatusCode.OK, "删除员工信息成功！");
        } else {
            employeeService.deleteEmp(Integer.parseInt(empIds));
            return new Result(true, StatusCode.OK, "删除员工信息成功！");
        }
    }
}
