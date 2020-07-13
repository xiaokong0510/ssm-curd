package com.xiao;

import com.xiao.dao.DepartmentMapper;
import com.xiao.dao.EmployeeMapper;
import com.xiao.pojo.Department;
import com.xiao.pojo.Employee;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;
import java.util.UUID;

/**
 * @Classname: MapperTest
 * @Description: 测试dao层功能，使用Spring的单元测试
 * @Date: 2020/6/17 22:45
 * @Created by kongx
 */

@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class MapperTest {

    @Autowired
    private DepartmentMapper departmentMapper;
    @Autowired
    private EmployeeMapper employeeMapper;
    @Autowired
    private SqlSession sqlSession;

    //部门信息插入测试
    @Test
    public void testInsert() {
        departmentMapper.insert(new Department(null,"软件开发部"));
        departmentMapper.insert(new Department(null,"软件测试部"));
        departmentMapper.insert(new Department(null,"产品部"));
    }
    //批量插入员工信息测试
    @Test
    public void testInsert2() {
        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        for (int i = 0; i <100 ; i++) {
            String s = UUID.randomUUID().toString().substring(0, 5)+i;
            mapper.insertSelective(new Employee(null,s,"M",s+"@163.com",1));
        }
        for (int i = 0; i <100 ; i++) {
            String s = UUID.randomUUID().toString().substring(0, 5)+i;
            mapper.insertSelective(new Employee(null,s,"M",s+"@163.com",2));
        }
        for (int i = 0; i <100 ; i++) {
            String s = UUID.randomUUID().toString().substring(0, 5)+i;
            mapper.insertSelective(new Employee(null,s,"F",s+"@163.com",3));
        }
        System.out.println("批量插入成功！");
    }
    //查询测试
    @Test
    public void testSelect(){
        List<Employee> list = employeeMapper.selectByExampleWithDept(null);
        for (Employee employee : list) {
            System.out.println(employee);
        }
    }
}
