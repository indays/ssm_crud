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
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <link rel="stylesheet" href="${APP_PATH}/static/css/bootstrap.min.css"/>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="${APP_PATH}/static/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(function () {

            page_to(1);

        });
        function page_to(n) {
            $.ajax({
                url: "${APP_PATH}/getResourceWithJson",
                data: {"pn": n},
                type: "get",
                success: function (result) {
                    load_tabel(result);
                    load_page_info(result);
                    load_page_nav(result);


                }
            });

        }

        function load_tabel(result) {
            $(".table tbody").empty();
            var emp = result.extend.PageInfo.list;
            $.each(emp,function (index,item) {

                var empId = $("<td></td>").append(item.empId);
                var empName = $("<td></td>").append(item.empName);
                var gender = $("<td></td>").append(item.gender);
                var email = $("<td></td>").append(item.email);
                var deptName = $("<td></td>").append(item.department.deptName);
                var btn1=$("<botton></botton>").addClass("btn btn-primary btn-md").text("编辑");
                var btn2=$("<botton></botton>").addClass("btn btn-danger btn-md").text("更新");
                var operation = $("<td></td>").append(btn1).append(" ").append(btn2);

                $("<tr></tr>").append(empId).append(empName).append(gender).append(email).append(deptName).append(operation).appendTo($(".table tbody"));
            })
        }
        function load_page_info(result) {
            $("#pageinfo").empty();
            var pageinfo="<h4>总数据:"+result.extend.PageInfo.total+"  总页数："+result.extend.PageInfo.pages +"  单页数据量："+result.extend.PageInfo.size+"</h4>";
            $("#pageinfo").append(pageinfo);

        }

        function load_page_nav(result) {
            $("#page_nav").empty();
            var page_ul = $("<ul></ul>").addClass("pagination");

            var page_li_start=$("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
            page_li_start.click(function () {
                page_to(1);

            });
            var page_li_pre="";
            var page_li_next = "";

            if(result.extend.PageInfo.hasPreviousPage==true)
            {
                page_li_pre=$("<li></li>").append($("<a></a>").append("&laquo;").attr("href","#"));;
                page_li_pre.click(function () {
                    page_to(result.extend.PageInfo.pageNum-1);
                });
            }
            if(result.extend.PageInfo.hasNextPage==true)
            {
                page_li_next=$("<li></li>").append($("<a></a>").append("&raquo;").attr("href","#"));
                page_li_next.click(function () {
                    page_to(result.extend.PageInfo.pageNum+1);
                });
            }

            var page_li_end=$("<li></li>").append($("<a></a>").append("尾页").attr("href","#"));
            page_li_end.click(function () {
                page_to(result.extend.PageInfo.pages);

            });
            page_ul.append(page_li_start);
            page_ul.append(page_li_pre);
            $.each(result.extend.PageInfo.navigatepageNums, function (index, item) {
                var page_li_num=$("<li></li>").append($("<a></a>").append(item).attr("href","#"));
                if(item==result.extend.PageInfo.pageNum)
                {
                    page_li_num.addClass("active");
                }
                page_li_num.click(function () {
                    page_to(item);
                });
                page_ul.append(page_li_num);
            });
            page_ul.append(page_li_next);
            page_ul.append(page_li_end);

            $("#page_nav").append(page_ul);



        }


    </script>
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
            <thead>
                <tr>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>

            </tbody>

        </table>
    </div>

    <!--底部分页 -->
    <div class="row">
        <div class="col-md-6" id="pageinfo">

        </div>
        <div class="col-md-6">
            <nav aria-label="Page navigation" id="page_nav">

            </nav>
        </div>
    </div>
</div>
</body>


</html>