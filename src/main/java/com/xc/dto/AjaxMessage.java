package com.xc.dto;

import com.xc.entity.Employee;

import java.util.HashMap;

/**
 * ajax信息返回类
 */
public class AjaxMessage {

    public int code;

    private String message;
    private HashMap<String, Object> extend=new HashMap<String,Object>();

    public AjaxMessage() {
    }

    public AjaxMessage(int code, String message) {
        this.code = code;
        this.message = message;

    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public HashMap<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(HashMap<String, Object> extend) {
        this.extend = extend;
    }


    public AjaxMessage failture()
    {
        AjaxMessage ajaxMessage = new AjaxMessage(0,"失败");

        return ajaxMessage;
    }
    public AjaxMessage sucessful()
    {
        AjaxMessage ajaxMessage = new AjaxMessage(1, "成功");
        return ajaxMessage;
    }

    public AjaxMessage addData(String key,Object value)
    {
        this.getExtend().put(key, value);
        return this;



    }
}
