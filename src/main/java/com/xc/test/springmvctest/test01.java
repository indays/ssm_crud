package com.xc.test.springmvctest;

import com.github.pagehelper.PageInfo;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

/**
 * springmvc测试类
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations ={ "classpath:applicationContext.xml","classpath:spring-mvc.xml"})
public class test01 {
    @Autowired
    WebApplicationContext context;
    MockMvc mockMvc;
    @Before
    public void initMokcMvc()
    {
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }
    @Test
    public void test() throws Exception {
        MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders.get("/getResourceWith").param("pn", "1")).andReturn();
        MockHttpServletRequest request = mvcResult.getRequest();
        PageInfo pageInfo=(PageInfo) request.getAttribute("pageinfo");
        System.out.println(pageInfo);

    }



}
