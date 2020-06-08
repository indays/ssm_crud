package com.xc.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xc.dto.AjaxMessage;
import com.xc.entity.Employee;
import com.xc.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class AdminController {

    @Autowired
    public AdminService adminService;


    /**
     * ajax加载数据
     * @param pn
     * @return
     */
    @ResponseBody
    @RequestMapping("/getResourceWithJson")
    public AjaxMessage adminLogin(@RequestParam(value = "pn",defaultValue = "1") Integer pn)
    {

        PageHelper.startPage(pn, 5);
        List<Employee> list=adminService.getEmpAll();
        PageInfo page = new PageInfo(list,5);

        return new AjaxMessage().sucessful().addData("PageInfo",page);
    }


    /**
     * 普通方法加载数据
     * @param pn
     * @param model
     * @return
     */
    @RequestMapping("/getResource")
    public String adminLogin(@RequestParam(value = "pn",defaultValue = "1") Integer pn,Model model)
    {
        PageHelper.startPage(pn, 5);
        List<Employee> list=adminService.getEmpAll();
        PageInfo page = new PageInfo(list,5);
        model.addAttribute("PageInfo", page);
        return "index";
    }
}
