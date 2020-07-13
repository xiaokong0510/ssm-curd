package com.xiao.dao;

import com.xiao.pojo.Department;
import com.xiao.pojo.DepartmentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DepartmentMapper {
    //按条件计数
    long countByExample(DepartmentExample example);

    //按条件删除
    int deleteByExample(DepartmentExample example);

    //按主键删除
    int deleteByPrimaryKey(Integer deptId);

    //插入数据（返回值为ID），所有的字段都会添加一遍即使没有值
    int insert(Department record);

    //插入数据，只给有值的字段赋值（会对传进来的值做非空判断）
    int insertSelective(Department record);

    //按条件查询
    List<Department> selectByExample(DepartmentExample example);

    //按Id查询
    Department selectByPrimaryKey(Integer deptId);

    //按条件更新值不为null的字段
    int updateByExampleSelective(@Param("record") Department record, @Param("example") DepartmentExample example);
    //按条件更新
    int updateByExample(@Param("record") Department record, @Param("example") DepartmentExample example);

    //按主键更新值不为null的字段
    int updateByPrimaryKeySelective(Department record);
    //按主键更新
    int updateByPrimaryKey(Department record);
}