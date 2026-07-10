<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Đăng ký | TaskFlow</title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        </head>

        <body>
            <div class="auth-wrapper">
                <div class="auth-card panel">
                    <div class="auth-header">
                        <span class="brand-pill">Quản lý công việc</span>
                        <h1>Đăng ký</h1>
                        <p>Tạo tài khoản mới để bắt đầu quản lý công việc.</p>
                    </div>

                    <c:if test="${not empty error}">
                        <div class="alert alert-danger">
                            <c:out value="${error}" />
                        </div>
                    </c:if>

                    <form action="${pageContext.request.contextPath}/register" method="post">
                        <div class="form-group">
                            <label class="form-label" for="fullname">Họ và tên</label>
                            <input class="form-control" type="text" id="fullname" name="fullname"
                                value="<c:out value='${fullname}'/>" required autocomplete="off">
                        </div>

                        <div class="form-group">
                            <label class="form-label" for="username">Tên đăng nhập</label>
                            <input class="form-control" type="text" id="username" name="username"
                                value="<c:out value='${username}'/>" required autocomplete="off">
                        </div>

                        <div class="form-group">
                            <label class="form-label" for="password">Mật khẩu</label>
                            <input class="form-control" type="password" id="password" name="password" required>
                        </div>

                        <div class="form-group">
                            <label class="form-label" for="confirmPassword">Xác nhận mật khẩu</label>
                            <input class="form-control" type="password" id="confirmPassword" name="confirmPassword"
                                required>
                        </div>

                        <button class="btn btn-primary" type="submit">Đăng ký</button>
                    </form>

                    <div class="auth-footer">
                        Đã có tài khoản?
                        <a href="${pageContext.request.contextPath}/login.jsp">Đăng nhập</a>
                    </div>
                </div>
            </div>
        </body>

        </html>