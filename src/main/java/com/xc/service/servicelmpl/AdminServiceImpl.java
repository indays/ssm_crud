package com.xc.service.servicelmpl;

import com.xc.dao.EmployeeMapper;
import com.xc.entity.Employee;
import com.xc.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    public EmployeeMapper employeeMapper;
    @Override
    public List<Employee> getEmpAll() {
        List<Employee> list = employeeMapper.selectByExampleWithDept(null);
        return list;
    }
}
