package com.xc.test.mybatistest;


import com.xc.dao.DepartmentMapper;
import com.xc.dao.EmployeeMapper;
import com.xc.entity.Department;
import com.xc.entity.Employee;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Random;
import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class test01 {

    @Autowired
    private EmployeeMapper employeeMapper;
    @Autowired
    private DepartmentMapper departmentMapper;

    @Autowired
    private SqlSession sqlSession;

    @Test
    public void test1()
    {

//        Department department = new Department();
//        department.setDeptName("人力资源部");
//        int k = departmentMapper.insert(department);
//        System.out.println(k);
       /* Employee employee=new Employee();
        employee.setEmpName("小城");
        employee.setGender("M");
        employee.setEmail("1750716355@qq.com");
        employee.setdId(1);
        int i = employeeMapper.insert(employee);
        System.out.println(i);*/


        EmployeeMapper employee = sqlSession.getMapper(EmployeeMapper.class);
        for(int i=0;i<100;i++)
        {
            String uuid=UUID.randomUUID().toString().substring(0, 5);
            employee.insert(new Employee(null, uuid, "W", uuid + "@qq.com", 3));


        }
        System.out.println("插入完成");

    }
}
