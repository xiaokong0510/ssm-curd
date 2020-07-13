package com.xiao;

import com.github.pagehelper.PageInfo;
import com.xiao.pojo.Employee;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

/**
 * @Classname: MvcTest
 * @Description:
 * @Date: 2020/6/17 23:35
 * @Created by kongx
 */
@ContextConfiguration(locations = {"classpath:applicationContext.xml","classpath:springmvc-config.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
public class MvcTest {
    //传入SpringMVC的IOC
    @Autowired
    WebApplicationContext context;
    //虚拟mvc请求，获得处理结果
    MockMvc mockMvc;

    @Before
    public void initMockMvc() {
        //初始化mockMvc
        mockMvc= MockMvcBuilders.webAppContextSetup(context).build();
    }

    //模拟发送请求测试
    @Test
    public void testPage() throws Exception {
        //get("/emps")：指定请求路径
        //param("page", "1")):指定请求参数名和值
        //andReturn():返回结果
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("page", "1")).andReturn();
        //获取到request
        MockHttpServletRequest request = result.getRequest();
        //从请求域中拿到封装的pageInfo信息
        PageInfo info = (PageInfo) request.getAttribute("pageInfo");
        System.out.println("当前页码："+info.getPageNum());
        System.out.println("总页码:"+info.getPages());
        System.out.println("总记录数："+info.getTotal());
        int[] nums = info.getNavigatepageNums();
        System.out.println("在页面连续显示的页码：");
        for (int i : nums) {
            System.out.print(" "+i);
        }
        
        //获取员工信息
        List<Employee> list = info.getList();
        for (Employee emp : list) {
            System.out.println("员工id:"+emp.getEmpId()+"--员工姓名："+emp.getEmpName()+"--性别："+emp.getGender()
            +"--邮箱："+emp.getEmail());
        }

    }
}
