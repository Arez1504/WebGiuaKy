<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ page import="model.User" %>

            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>TaskFlow Dashboard</title>

                <style>
                    * {
                        margin: 0;
                        padding: 0;
                        box-sizing: border-box;
                        font-family: Arial, Helvetica, sans-serif;
                    }

                    body {
                        background: #f5f7fb;
                        display: flex;
                        min-height: 100vh;
                    }

                    /* Sidebar */

                    .sidebar {
                        width: 240px;
                        background: #1f2937;
                        color: #fff;
                        display: flex;
                        flex-direction: column;
                    }

                    .logo {
                        text-align: center;
                        padding: 25px;
                        font-size: 28px;
                        font-weight: bold;
                        background: #111827;
                        text-decoration: none;
                        color: white;
                    }

                    .menu {
                        margin-top: 30px;
                    }

                    .menu a {
                        display: block;
                        padding: 16px 25px;
                        color: white;
                        text-decoration: none;
                        transition: .3s;
                    }

                    .menu a:hover {
                        background: #374151;
                    }

                    /* Main */

                    .main {
                        flex: 1;
                        display: flex;
                        flex-direction: column;
                    }

                    /* Topbar */

                    .topbar {
                        height: 75px;
                        background: white;
                        box-shadow: 0 2px 8px rgba(0, 0, 0, .08);
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        padding: 0 35px;
                    }

                    .welcome h2 {
                        color: #1f2937;
                    }

                    .welcome p {
                        color: #777;
                        margin-top: 4px;
                    }

                    .user {
                        display: flex;
                        align-items: center;
                        gap: 20px;
                    }

                    .logout {
                        background: #ef4444;
                        color: white;
                        padding: 10px 18px;
                        border-radius: 6px;
                        text-decoration: none;
                    }

                    .logout:hover {
                        background: #dc2626;
                    }

                    /* Content */

                    .content {
                        padding: 35px;
                    }

                    .title-bar {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        margin-bottom: 30px;
                    }

                    .title-bar h1 {
                        color: #1f2937;
                    }

                    .add-btn {
                        background: #2563eb;
                        color: white;
                        text-decoration: none;
                        padding: 12px 20px;
                        border-radius: 8px;
                        font-weight: bold;
                    }

                    .add-btn:hover {
                        background: #1d4ed8;
                    }

                    /* Cards */

                    .task-grid {
                        display: grid;
                        grid-template-columns: repeat(auto-fill, minmax(340px, 1fr));
                        gap: 25px;
                    }

                    .card {
                        background: white;
                        border-radius: 15px;
                        padding: 20px;
                        box-shadow: 0 5px 15px rgba(0, 0, 0, .08);
                        transition: .3s;
                    }

                    .card:hover {
                        transform: translateY(-5px);
                    }

                    .badge {
                        display: inline-block;
                        padding: 6px 12px;
                        border-radius: 20px;
                        font-size: 13px;
                        font-weight: bold;
                        margin-right: 8px;
                        color: white;
                    }

                    .status-todo {
                        background: #9ca3af;
                    }

                    .status-progress {
                        background: #f59e0b;
                    }

                    .status-done {
                        background: #22c55e;
                    }

                    .priority-low {
                        background: #10b981;
                    }

                    .priority-medium {
                        background: #3b82f6;
                    }

                    .priority-high {
                        background: #ef4444;
                    }

                    .task-title {
                        margin: 18px 0 12px;
                        color: #111827;
                    }

                    .task-desc {
                        color: #555;
                        line-height: 1.6;
                        min-height: 60px;
                    }

                    .deadline {
                        margin-top: 15px;
                        color: #666;
                        font-size: 14px;
                    }

                    .actions {
                        display: flex;
                        gap: 10px;
                        margin-top: 20px;
                    }

                    .edit {
                        background: #3b82f6;
                        color: white;
                        padding: 10px 18px;
                        border-radius: 6px;
                        text-decoration: none;
                    }

                    .delete {
                        background: #ef4444;
                        color: white;
                        border: none;
                        padding: 10px 18px;
                        border-radius: 6px;
                        cursor: pointer;
                    }

                    .edit:hover {
                        background: #2563eb;
                    }

                    .delete:hover {
                        background: #dc2626;
                    }

                    .empty {
                        background: white;
                        padding: 60px;
                        border-radius: 15px;
                        text-align: center;
                        box-shadow: 0 5px 15px rgba(0, 0, 0, .08);
                    }

                    .empty h2 {
                        margin-bottom: 15px;
                    }
                </style>

            </head>

            <body>

                <% User currentUser=(User)session.getAttribute("user"); if(currentUser==null){
                    response.sendRedirect(request.getContextPath()+"/login.jsp"); return; } %>

                    <div class="sidebar">

                        <a href="${pageContext.request.contextPath}/task?action=list" class="logo">
                            Quản lý công việc
                        </a>

                        <div class="menu">
                            <a href="${pageContext.request.contextPath}/task?action=list">🏠 Trang chủ</a>

                            <a href="${pageContext.request.contextPath}/task?action=new">➕ Thêm công việc</a>

                            <a href="${pageContext.request.contextPath}/logout">🚪 Đăng xuất</a>
                        </div>

                    </div>

                    <div class="main">

                        <div class="topbar">

                            <div class="welcome">
                                <h2>Xin chào,
                                    <c:out value="${sessionScope.user.fullname}" />
                                </h2>
                                <p>Quản lý công việc của bạn một cách dễ dàng.</p>
                            </div>

                            <div class="user">
                                <span>Người dùng</span>
                                <a class="logout" href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
                            </div>

                        </div>

                        <div class="content">

                            <div class="title-bar">
                                <div>
                                    <h1>Danh sách công việc</h1>
                                    <p>Theo dõi công việc, hạn hoàn thành và mức ưu tiên.</p>
                                </div>

                                <a class="add-btn" href="${pageContext.request.contextPath}/task?action=new">
                                    + Thêm công việc
                                </a>
                            </div>

                            <div class="task-grid">

                                <c:choose>

                                    <c:when test="${not empty taskList}">

                                        <c:forEach var="task" items="${taskList}">

                                            <c:set var="statusClass" value="status-todo" />
                                            <c:set var="statusText" value="Chưa làm" />

                                            <c:if test="${task.status=='Dang lam'}">
                                                <c:set var="statusClass" value="status-progress" />
                                                <c:set var="statusText" value="Đang làm" />
                                            </c:if>

                                            <c:if test="${task.status=='Hoan thanh'}">
                                                <c:set var="statusClass" value="status-done" />
                                                <c:set var="statusText" value="Hoàn thành" />
                                            </c:if>

                                            <c:set var="priorityClass" value="priority-medium" />
                                            <c:set var="priorityText" value="Trung bình" />

                                            <c:if test="${task.priority=='Thap'}">
                                                <c:set var="priorityClass" value="priority-low" />
                                                <c:set var="priorityText" value="Thấp" />
                                            </c:if>

                                            <c:if test="${task.priority=='Cao'}">
                                                <c:set var="priorityClass" value="priority-high" />
                                                <c:set var="priorityText" value="Cao" />
                                            </c:if>

                                            <div class="card">

                                                <div>
                                                    <span class="badge ${statusClass}">
                                                        <c:out value="${statusText}" />
                                                    </span>

                                                    <span class="badge ${priorityClass}">
                                                        <c:out value="${priorityText}" />
                                                    </span>
                                                </div>

                                                <h2 class="task-title">
                                                    <c:out value="${task.title}" />
                                                </h2>

                                                <p class="task-desc">

                                                    <c:choose>

                                                        <c:when test="${not empty task.description}">
                                                            <c:out value="${task.description}" />
                                                        </c:when>

                                                        <c:otherwise>
                                                            Chưa có mô tả cho công việc này.
                                                        </c:otherwise>

                                                    </c:choose>

                                                </p>

                                                <div class="deadline">
                                                    <strong>Hạn:</strong>
                                                    <c:out value="${task.deadline}" />
                                                </div>

                                                <div class="actions">

                                                    <a class="edit"
                                                        href="${pageContext.request.contextPath}/task?action=edit&id=${task.id}">
                                                        Sửa
                                                    </a>

                                                    <form action="${pageContext.request.contextPath}/task?action=delete"
                                                        method="post"
                                                        onsubmit="return confirm('Bạn có chắc muốn xóa công việc này?');">

                                                        <input type="hidden" name="id" value="${task.id}">

                                                        <button class="delete" type="submit">
                                                            Xóa
                                                        </button>

                                                    </form>

                                                </div>

                                            </div>

                                        </c:forEach>

                                    </c:when>

                                    <c:otherwise>

                                        <div class="empty">

                                            <h2>Chưa có công việc nào</h2>

                                            <p>Hãy tạo công việc đầu tiên để bắt đầu quản lý ngay hôm nay.</p>

                                            <br>

                                            <a class="add-btn"
                                                href="${pageContext.request.contextPath}/task?action=new">
                                                Thêm công việc
                                            </a>

                                        </div>

                                    </c:otherwise>

                                </c:choose>

                            </div>

                        </div>

                    </div>

            </body>

            </html>