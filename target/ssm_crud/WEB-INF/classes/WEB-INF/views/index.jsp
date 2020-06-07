<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/7
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD//XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<%
    pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <link rel="stylesheet" href="${APP_PATH}/static/css/bootstrap.min.css"/>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="${APP_PATH}/static/js/bootstrap.min.js"></script>
</head>


<body>
    <div class="container">
        <!--标题-->
        <div class="row">
            <div class="col-md-12">
                <h2>SSM-CRUD</h2>
            </div>
        </div>
        <!--按钮 -->
        <div class="row">
            <div class="col-md-offset-10 col-md-2">
                <button type="button" class="btn btn-primary btn-lg">新增</button>
                <button type="button" class="btn btn-danger btn-lg">删除</button>
            </div>
        </div>

        <div class="row">

                <table class="table table-hover">
                    <tr>
                            <th>#</th>
                            <th>empName</th>
                            <th>gender</th>
                            <th>email</th>
                            <th>deptName</th>
                            <th>操作</th>
                    </tr>
                    <tr>
                        <th>1</th>
                        <th>q</th>
                        <th>男</th>
                        <th>aa@qq.com</th>
                        <th>deptName</th>
                        <th>
                            <button type="button" class="btn btn-primary btn-sm">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>编辑
                            </button>
                            <button type="button" class="btn btn-danger btn-sm">
                                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
                            </button>
                        </th>
                    </tr>
                    <tr>
                        <th>1</th>
                        <th>q</th>
                        <th>男</th>
                        <th>aa@qq.com</th>
                        <th>deptName</th>
                        <th>
                            <button type="button" class="btn btn-primary btn-sm">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>编辑
                            </button>
                            <button type="button" class="btn btn-danger btn-sm">
                                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
                            </button>
                        </th>
                    </tr>
                    <tr>
                        <th>1</th>
                        <th>q</th>
                        <th>男</th>
                        <th>aa@qq.com</th>
                        <th>deptName</th>
                        <th>
                            <button type="button" class="btn btn-primary btn-sm">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>编辑
                            </button>
                            <button type="button" class="btn btn-danger btn-sm">
                                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
                            </button>
                        </th>
                    </tr>

                </table>
        </div>

        <!--底部分页 -->
        <div class="row">
            <div class="col-md-6">
                当前记录数：XXXX
            </div>
            <div class="col-md-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination pagination-sm">
                        <li>
                            <a href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li>
                            <a href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</body>


</html>