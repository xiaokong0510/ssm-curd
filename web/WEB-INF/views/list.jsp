<%--
  Created by IntelliJ IDEA.
  User: kongx
  Date: 2020/6/18
  Time: 0:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>员工列表</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <%--不以/开始的相对路径，找资源，以当前资源的路径为基准--%>
    <%--以/开始的相对路径，找资源，以服务器的路径为标准(http://localhost:3306),需要加上项目名--%>
    <%--jQuery--%>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.2.1.min.js"></script>
    <!-- 引入Bootstrap样式 -->
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
    <!-- 加载 Bootstrap 的所有 JavaScript 插件 -->
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
</head>
<body>

<!-- 员工添加界面模态框 -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">员工添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="empAddFrom">
                    <div class="form-group">
                        <label for="empName_input" class="col-sm-2 control-label">员工姓名</label>
                        <div class="col-sm-8">
                            <input type="text" name="empName" class="form-control" id="empName_input"
                                   placeholder="请输入员工姓名">
                            <span id="empName_input-msg" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_input" class="col-sm-2 control-label">电子邮件</label>
                        <div class="col-sm-10">
                            <input type="email" name="email" class="form-control" id="email_input"
                                   placeholder="请输入email">
                            <span id="email_input-msg" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="deptName_select" class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="deptName_select">
                            </select>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>


<!-- 员工修改界面模态框 -->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">员工修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="empUpdateFrom">
                    <div class="form-group">
                        <label for="empName_input" class="col-sm-2 control-label">员工姓名</label>
                        <div class="col-sm-8">
                            <p class="form-control-static" id="emp_update_name"></p>
                            <span id="empName_update-msg" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update" value="M"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_update" class="col-sm-2 control-label">电子邮件</label>
                        <div class="col-sm-10">
                            <input type="email" name="email" class="form-control" id="email_update"
                                   placeholder="请输入email">
                            <span id="email_update-msg" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="deptName_select_update" class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="deptName_select_update">
                            </select>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>


<div class="=container">
    <br>
    <!--标题-->
    <div class="row">
        <div class="col-md-10 col-md-offset-2">
            <h1>员工信息管理系统 &nbsp&nbsp<small>SSM整合入门案例</small></h1>
        </div>
    </div>
    <!--按钮-->
    <div class="row">
        <div class="col-md-2 col-md-offset-8">
            <button href="#" class="btn btn-primary" id="emp_add_modal_btn">新增</button>
            <button href="#" class="btn btn-danger" id="emp_delete_batch">删除</button>
        </div>
    </div>

    <!--表格-->
    <div class="row">
        <div class="col-md-7 col-lg-offset-2">
            <table class="table table-hover">

                <tr>
                    <th><input type="checkbox" id="check_all"></th>
                    <th>#</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>邮箱</th>
                    <th>部门</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pageInfo.list}" var="emp">
                    <tr>
                        <td><input type="checkbox" class="check_item"></td>
                        <td>${emp.empId}</td>
                        <td>${emp.empName}</td>
                        <td>${emp.gender == "M"? "男":"女"}</td>
                        <td>${emp.email}</td>
                        <td>${emp.department.deptName}</td>
                        <td>
                            <button href="#" class="btn btn-primary" id="emp_update_modal_btn" name="empId"
                                    value="${emp.empId}">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>编辑
                            </button>
                            <button href="#" class="btn btn-danger" id="emp_delete_modal_btn" name="empId"
                                    value="${emp.empId}">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除
                            </button>
                        </td>
                    </tr>
                </c:forEach>

            </table>
        </div>
    </div>

    <!--分页信息-->
    <div class="row">
        <div class="col-md-2 col-md-offset-2">
            <h4>当前第<span style="background: yellow">${pageInfo.pageNum}</span>页，共<span
                    style="background: yellow">${pageInfo.pages}</span>页,总共<span
                    style="background: yellow">${pageInfo.total}</span>条记录 </h4>
        </div>

        <!--分页条-->
        <div class="col-md-5">
            <nav aria-label="Page navigation">
                <ul class="pagination">

                    <c:if test="${pageInfo.hasPreviousPage}">
                        <li>
                            <a href="${APP_PATH}/emps?page=1">首页</a>
                        </li>
                        <li>
                            <a href="${APP_PATH}/emps?page=${pageInfo.pageNum-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
                        <c:if test="${page_Num == pageInfo.pageNum}">
                            <li class="active"><a href="#">${page_Num}</a></li>
                        </c:if>
                        <c:if test="${page_Num != pageInfo.pageNum}">
                            <li><a href="${APP_PATH}/emps?page=${page_Num}">${page_Num}</a></li>
                        </c:if>
                    </c:forEach>

                    <c:if test="${pageInfo.hasNextPage}">
                        <li>
                            <a href="${APP_PATH}/emps?page=${pageInfo.pageNum+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                        <li>
                            <a href="${APP_PATH}/emps?page=${pageInfo.pages}">末页</a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </div>
</div>
<script type="text/javascript">

    // 绑定模态框弹出事件,点击新增按钮，弹出模态框进行填写
    $("#emp_add_modal_btn").click(function () {

        //首先进行表单重置(表单数据及表单的样式)
        //$("#empAddForm")是jQuery对象，后面可以点出调用jQuery函数
        //$("#empAddForm")[0]是原生js 对象 ，后面可以点出调用原生js 函数
        var empAddForm = $("#empAddFrom");
        //清空表单内容
        empAddForm[0].reset();
        //清空表单样式
        empAddForm.find("*").removeClass("has-error has-success");
        //清空提示信息内容
        empAddForm.find(".help-block").text("");

        //发送Ajax请求，查询出部门信息，在下拉列表框中显示
        getDepts($("#deptName_select"));
        $("#empAddModal").modal({
            backdrop: "static"
        })
    });

    //查询部门信息，并在下拉列表框中显示的方法
    function getDepts(ele) {
        //清空之前下拉列表的值
        ele.empty();
        $.ajax({
            url: "${APP_PATH}/depts",
            type: "GET",
            success: function (result) {
                //部门信息显示在下拉列表中
                $.each(result.data, function () {
                    var optionEle = $("<option></option>").append(this.deptName).attr("value", this.deptId);
                    optionEle.appendTo(ele);
                })
            }
        })
    }

    //校验用户名离焦事件
    $("#empName_input").blur(function () {
        //首先清除校验状态和提示信息
        $(this).parent().removeClass("has-error has-success");
        $(this).next("span").text("");

        //获取到填写的值， 编写校验规则进行校验
        var empName = $(this).val();
        var regName = /(^[a-zA-Z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        if (!regName.test(empName)) {
            //校验之后，保存按钮的标志class
            $("#emp_save_btn").attr("ajax-empName", "error");
            $(this).parent().addClass("has-error");
            $(this).next("span").text("请输入3-16位英文或2-5位汉字");
            return false;
        } else {
            $("#emp_save_btn").attr("ajax-empName", "success");
            $(this).parent().addClass("has-success");
            $(this).next("span").text("");
        }
    });

    //校验邮箱格式离焦事件,先检查格式，格式符合要求再检查是否存在
    $("#email_input").blur(function () {
        //首先清除校验状态
        $(this).parent().removeClass("has-error has-success");
        $(this).next("span").text("");

        //编写校验规则
        var email = $(this).val();
        var regEmail = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
        if (!regEmail.test(email)) {
            $(this).parent().addClass("has-error");
            $(this).next("span").text("请输入正确格式的邮箱");
        } else {
            //如果格式正确，检查邮箱是否存在
            checkEmail($("#email_input"), $("#emp_save_btn"));
        }
    });

    //校验邮箱是否存在
    function checkEmail(ele, ele2) {
        //发送ajax请求进行邮箱是否存在校验
        $.ajax({
            url: "${APP_PATH}/checkEmail",
            data: "email=" + ele.val(),
            type: "GET",
            success: function (result) {
                if (result.flag) {
                    //校验之后，保存按钮的标志class
                    ele2.attr("ajax-email", "success");
                    ele.parent().addClass("has-success");
                    ele.next("span").text(result.message);
                } else {
                    ele2.attr("ajax-email", "error");
                    ele.parent().addClass("has-error");
                    ele.next("span").text(result.message);
                }
            }
        })
    }

    //点击保存按钮，保存员工信息
    $("#emp_save_btn").click(function () {
        //判断前端校验是否成功
        if ($(this).attr("ajax-empName") === "success" && $(this).attr("ajax-email") === "success") {
            //发送Ajax请求保存数据，POST请求方式表示新增
            $.ajax({
                url: "${APP_PATH}/emp",
                type: "POST",
                data: $("#empAddFrom").serialize(), //将表单中的数据序列化
                success: function (result) {
                    //后台校验逻辑
                    if (!result.flag) {
                        //有哪个字段的错误信息就显示哪个字段的
                        if (undefined !== result.data.email) {
                            // 显示邮箱的错误信息
                            $("#email_input").parent().addClass("has-error");
                            $("#email_input").next("span").text(result.data.email);
                        }
                        if (undefined !== result.data.empName) {
                            //显示姓名的错误信息
                            $("#empName_input").parent().addClass("has-error");
                            $("#empName_input").next("span").text(result.data.empName);
                        }
                    } else {
                        // 后台校验成功，关闭模态框
                        $("#empAddModal").modal("hide");
                        alert(result.message);
                        //
                        window.location.href = "${APP_PATH}/emps?page=10000"
                    }
                }
            })
        }
    });


    //注意：使用$().click()在按钮创建之间就绑定了click，所以绑定不上
    //修改员工信息
    $(document).on("click", "#emp_update_modal_btn", function () {

        //调用查询部门信息方法
        getDepts($("#deptName_select_update"));

        //回显数据
        //发送Ajax请求，根据id查询出员工的信息
        var empId = $(this).attr("value");
        $.ajax({
            url: "${APP_PATH}/emp/" + empId,
            type: "GET",
            success: function (result) {
                var emp = result.data;
                $("#emp_update_name").text(emp.empName);
                $("#email_update").val(emp.email);
                $("#empUpdateModal input[name=gender]").val([emp.gender]);
                $("#empUpdateModal select").val([emp.dId]);
                //将empId存入更新按钮中
                $("#emp_update_btn").val(emp.empId);
            }
        });
        //弹出模态框
        $("#empUpdateModal").modal({
            backdrop: "static"
        })
    });

    //点击更新按钮，保存更新的员工数据
    $("#emp_update_btn").click(function () {
        var empId = $(this).attr("value");
        //如果校验成功
        if ($(this).attr("ajax-email") === "success") {
            //发送Ajax请求保存数据，PUT请求方式表示修改
            $.ajax({
                url: "${APP_PATH}/emp/" + empId,
                type: "PUT",
                data: $("#empUpdateFrom").serialize(), //将表单中的数据序列化
                success: function (result) {
                    // 后台校验成功，关闭模态框
                    $("#empUpdateModal").modal("hide");
                    alert(result.message);
                    //刷新页面
                    window.location.reload()
                }
            })
        }
    });

    //校验邮箱格式离焦事件,先检查格式，格式符合要求再检查是否存在
    $("#email_update").blur(function () {
        //首先清除校验状态
        $(this).parent().removeClass("has-error has-success");
        $(this).next("span").text("");

        //编写校验规则
        var email = $(this).val();
        var regEmail = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
        if (!regEmail.test(email)) {
            $(this).parent().addClass("has-error");
            $(this).next("span").text("请输入正确格式的邮箱");
        } else {
            //如果格式正确，检查邮箱是否存在
            checkEmail($("#email_update"), $("#emp_update_btn"));
        }
    });

    //点击删除按钮，单个删除员工数据
    $(document).on("click", "#emp_delete_modal_btn", function () {
        //弹出是否删除对话框
        var empName = $(this).parents("tr").find("td:eq(2)").text();
        var empId = $(this).attr("value");
        if (confirm("确认要删除员工：" + empName + "吗？")) {
            $.ajax({
                url: "${APP_PATH}/emp/" + empId,
                type: "DELETE",
                success: function (result) {
                    alert(result.message);
                    window.location.reload();
                }
            })
        }
    });

    //全选/全不选
    $("#check_all").click(function () {
        $(".check_item").prop("checked", $(this).prop("checked"));
    });

    //选择所有的选项后，全选按钮自动选上
    $(document).on("click", ".check_item", function () {
        //判断当前选中的元素是否为元素个数
        var flag = $(".check_item:checked").length === $(".check_item").length;
        $("#check_all").prop("checked", flag)
    });

    //批量删除单击事件
    $("#emp_delete_batch").click(function () {
        //拿到要删除员工的姓名和id
        var empNames = "";
        var empIds = "";
        $.each($(".check_item:checked"), function () {
            empNames += $(this).parents("tr").find("td:eq(2)").text() + ",";
            empIds += $(this).parents("tr").find("td:eq(1)").text() + ",";
        });
        //去除多余的逗号
        empNames = empNames.substring(0, empNames.length - 1);
        empIds = empIds.substring(0, empIds.length - 1);

        //弹出是否删除对话框
        if (confirm("确认要删除员工：" + empNames + "吗？")) {
            $.ajax({
                url: "${APP_PATH}/emp/" + empIds,
                type: "DELETE",
                success: function (result) {
                    alert(result.message);
                    window.location.reload();
                }
            })
        }
    })
</script>
</body>
</html>
