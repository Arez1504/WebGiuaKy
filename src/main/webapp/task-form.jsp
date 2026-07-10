<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ page import="model.User" %>
            <%@ page import="model.Task" %>
                <!DOCTYPE html>
                <html lang="vi">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Công việc | TaskFlow</title>

                    <style>
                        * {
                            margin: 0;
                            padding: 0;
                            box-sizing: border-box;
                            font-family: Segoe UI, Arial, sans-serif;
                        }

                        body {
                            background: linear-gradient(135deg, #4facfe, #00f2fe);
                            min-height: 100vh;
                        }

                        .header {
                            height: 75px;
                            background: #fff;
                            display: flex;
                            justify-content: space-between;
                            align-items: center;
                            padding: 0 45px;
                            box-shadow: 0 3px 12px rgba(0, 0, 0, .15);
                        }

                        .logo {
                            font-size: 28px;
                            font-weight: bold;
                            text-decoration: none;
                            color: #2196F3;
                        }

                        .user-area {
                            display: flex;
                            align-items: center;
                            gap: 20px;
                        }

                        .user-text {
                            text-align: right;
                        }

                        .user-name {
                            font-weight: bold;
                            color: #333;
                        }

                        .user-role {
                            font-size: 13px;
                            color: #777;
                        }

                        .main {
                            display: flex;
                            justify-content: center;
                            align-items: center;
                            padding: 40px;
                        }

                        .panel {
                            width: 100%;
                            max-width: 760px;
                            background: white;
                            border-radius: 15px;
                            padding: 35px;
                            box-shadow: 0 12px 35px rgba(0, 0, 0, .2);
                        }

                        h1 {
                            text-align: center;
                            color: #2196F3;
                            margin-bottom: 30px;
                        }

                        .form-group {
                            margin-bottom: 20px;
                        }

                        .form-row {
                            display: flex;
                            gap: 20px;
                        }

                        .form-row .form-group {
                            flex: 1;
                        }

                        .form-label {
                            display: block;
                            margin-bottom: 8px;
                            font-weight: bold;
                            color: #444;
                        }

                        .form-control {
                            width: 100%;
                            padding: 12px 15px;
                            border: 1px solid #ccc;
                            border-radius: 8px;
                            font-size: 15px;
                            transition: .3s;
                        }

                        .form-control:focus {
                            border-color: #2196F3;
                            outline: none;
                            box-shadow: 0 0 8px rgba(33, 150, 243, .3);
                        }

                        .form-textarea {
                            min-height: 130px;
                            resize: vertical;
                        }

                        .form-actions {
                            margin-top: 30px;
                            display: flex;
                            justify-content: center;
                            gap: 15px;
                        }

                        .btn {
                            padding: 12px 28px;
                            border: none;
                            border-radius: 8px;
                            text-decoration: none;
                            font-size: 15px;
                            cursor: pointer;
                            transition: .3s;
                            font-weight: bold;
                        }

                        .btn-primary {
                            background: #2196F3;
                            color: white;
                        }

                        .btn-primary:hover {
                            background: #1976D2;
                            transform: translateY(-2px);
                        }

                        .btn-secondary {
                            background: #9E9E9E;
                            color: white;
                        }

                        .btn-secondary:hover {
                            background: #757575;
                            transform: translateY(-2px);
                        }

                        .btn-sm {
                            padding: 10px 18px;
                        }

                        .alert {
                            padding: 12px;
                            margin-bottom: 20px;
                            border-radius: 8px;
                        }

                        .alert-danger {
                            background: #ffebee;
                            color: #c62828;
                            border: 1px solid #ef9a9a;
                        }

                        @media(max-width:700px) {

                            .header {
                                flex-direction: column;
                                height: auto;
                                padding: 20px;
                                gap: 15px;
                            }

                            .form-row {
                                flex-direction: column;
                            }

                            .panel {
                                padding: 25px;
                            }

                            .main {
                                padding: 20px;
                            }

                        }
                    </style>

                </head>x

                <body>
                    <% User currentUser=(User) session.getAttribute("user"); if (currentUser==null) {
                        response.sendRedirect(request.getContextPath() + "/login.jsp" ); return; } Task task=(Task)
                        request.getAttribute("task"); boolean edit=task !=null && task.getId()> 0;
                        String formAction = edit ? "update" : "insert";
                        String pageTitle = edit ? "Cập nhật công việc" : "Thêm công việc mới";
                        String statusValue = task != null && task.getStatus() != null && !task.getStatus().isEmpty()
                        ? task.getStatus() : "Chua lam";
                        String priorityValue = task != null && task.getPriority() != null &&
                        !task.getPriority().isEmpty()
                        ? task.getPriority() : "Trung binh";

                        request.setAttribute("statusValue", statusValue);
                        request.setAttribute("priorityValue", priorityValue);
                        request.setAttribute("edit", edit);
                        request.setAttribute("formAction", formAction);
                        request.setAttribute("pageTitle", pageTitle);
                        %>

                        <header class="header">
                            <a class="logo" href="${pageContext.request.contextPath}/task?action=list">Quản lý công
                                việc</a>
                            <div class="user-area">
                                <div class="user-text">
                                    <div class="user-name">
                                        <c:out value="${sessionScope.user.fullname}" />
                                    </div>
                                    <div class="user-role">Người dùng</div>
                                </div>
                                <a class="btn btn-secondary btn-sm"
                                    href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
                            </div>
                        </header>

                        <main class="main">
                            <div class="form-panel panel">
                                <h1>
                                    <c:out value="${pageTitle}" />
                                </h1>

                                <c:if test="${not empty error}">
                                    <div class="alert alert-danger">
                                        <c:out value="${error}" />
                                    </div>
                                </c:if>

                                <form action="${pageContext.request.contextPath}/task?action=${formAction}"
                                    method="post">
                                    <c:if test="${edit}">
                                        <input type="hidden" name="id" value="${task.id}">
                                    </c:if>

                                    <div class="form-group">
                                        <label class="form-label" for="title">Tên công việc</label>
                                        <input class="form-control" type="text" id="title" name="title"
                                            value="<c:out value='${task.title}'/>" required>
                                    </div>

                                    <div class="form-group">
                                        <label class="form-label" for="deadline">Hạn hoàn thành</label>
                                        <input class="form-control" type="date" id="deadline" name="deadline"
                                            value="<c:out value='${task.deadline}'/>" required>
                                    </div>

                                    <div class="form-row">
                                        <div class="form-group">
                                            <label class="form-label" for="status">Trạng thái</label>
                                            <select class="form-control" id="status" name="status" required>
                                                <option value="Chua lam" ${statusValue=='Chua lam' ? 'selected' : '' }>
                                                    Chưa làm</option>
                                                <option value="Dang lam" ${statusValue=='Dang lam' ? 'selected' : '' }>
                                                    Đang làm</option>
                                                <option value="Hoan thanh" ${statusValue=='Hoan thanh' ? 'selected' : ''
                                                    }>Hoàn thành</option>
                                            </select>
                                        </div>

                                        <div class="form-group">
                                            <label class="form-label" for="priority">Mức ưu tiên</label>
                                            <select class="form-control" id="priority" name="priority" required>
                                                <option value="Thap" ${priorityValue=='Thap' ? 'selected' : '' }>Thấp
                                                </option>
                                                <option value="Trung binh" ${priorityValue=='Trung binh' ? 'selected'
                                                    : '' }>Trung bình</option>
                                                <option value="Cao" ${priorityValue=='Cao' ? 'selected' : '' }>Cao
                                                </option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="form-label" for="description">Mô tả</label>
                                        <textarea class="form-control form-textarea" id="description"
                                            name="description"><c:out value="${task.description}"/></textarea>
                                    </div>

                                    <div class="form-actions">
                                        <button class="btn btn-primary" type="submit">Lưu công việc</button>
                                        <a class="btn btn-secondary"
                                            href="${pageContext.request.contextPath}/task?action=list">Hủy</a>
                                    </div>
                                </form>
                            </div>
                        </main>
                </body>

                </html>