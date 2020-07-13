<%--
  Created by IntelliJ IDEA.
  User: kongx
  Date: 2020/6/17
  Time: 20:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:forward page="/emps"></jsp:forward>
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




</body>

</html>
