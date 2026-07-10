<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Đăng nhập | TaskFlow</title>

            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

            <style>
                * {
                    margin: 0;
                    padding: 0;
                    box-sizing: border-box;
                    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                }

                body {
                    height: 100vh;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    background: linear-gradient(135deg, #4f46e5, #06b6d4);
                }

                .login-container {
                    width: 100%;
                    max-width: 420px;
                    padding: 20px;
                }

                .login-card {
                    background: #fff;
                    border-radius: 18px;
                    padding: 40px 35px;
                    box-shadow: 0 15px 40px rgba(0, 0, 0, .2);
                    animation: fadeIn .4s ease;
                }

                @keyframes fadeIn {
                    from {
                        opacity: 0;
                        transform: translateY(20px);
                    }

                    to {
                        opacity: 1;
                        transform: translateY(0);
                    }
                }

                .logo {
                    width: 70px;
                    height: 70px;
                    margin: auto;
                    border-radius: 50%;
                    background: #4f46e5;
                    color: white;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    font-size: 30px;
                    margin-bottom: 20px;
                }

                h1 {
                    text-align: center;
                    color: #333;
                    margin-bottom: 8px;
                }

                .subtitle {
                    text-align: center;
                    color: #666;
                    margin-bottom: 30px;
                    font-size: 14px;
                }

                .form-group {
                    margin-bottom: 20px;
                }

                label {
                    display: block;
                    margin-bottom: 8px;
                    font-weight: 600;
                    color: #444;
                }

                .form-control {
                    width: 100%;
                    padding: 13px 15px;
                    border: 1px solid #ccc;
                    border-radius: 10px;
                    font-size: 15px;
                    transition: .3s;
                }

                .form-control:focus {
                    border-color: #4f46e5;
                    outline: none;
                    box-shadow: 0 0 8px rgba(79, 70, 229, .25);
                }

                .btn-login {
                    width: 100%;
                    padding: 14px;
                    border: none;
                    border-radius: 10px;
                    background: #4f46e5;
                    color: #fff;
                    font-size: 16px;
                    cursor: pointer;
                    transition: .3s;
                    font-weight: bold;
                }

                .btn-login:hover {
                    background: #4338ca;
                    transform: translateY(-2px);
                }

                .alert {
                    padding: 12px;
                    border-radius: 8px;
                    margin-bottom: 18px;
                    text-align: center;
                    font-size: 14px;
                }

                .alert-danger {
                    background: #fde8e8;
                    color: #b91c1c;
                }

                .alert-success {
                    background: #dcfce7;
                    color: #166534;
                }

                .footer {
                    text-align: center;
                    margin-top: 25px;
                    color: #666;
                }

                .footer a {
                    color: #4f46e5;
                    text-decoration: none;
                    font-weight: bold;
                }

                .footer a:hover {
                    text-decoration: underline;
                }
            </style>
        </head>

        <body>

            <div class="login-container">

                <div class="login-card">



                    <h1>Manage Task Web</h1>

                    <p class="subtitle">
                        Đăng nhập để quản lý công việc của bạn
                    </p>

                    <c:if test="${not empty error}">
                        <div class="alert alert-danger">
                            <c:out value="${error}" />
                        </div>
                    </c:if>

                    <c:if test="${not empty success}">
                        <div class="alert alert-success">
                            <c:out value="${success}" />
                        </div>
                    </c:if>

                    <form action="${pageContext.request.contextPath}/login" method="post">

                        <div class="form-group">
                            <label for="username">
                                Tên đăng nhập
                            </label>

                            <input type="text" id="username" name="username" class="form-control"
                                value="<c:out value='${username}'/>" autocomplete="off" required>
                        </div>

                        <div class="form-group">
                            <label for="password">
                                Mật khẩu
                            </label>

                            <input type="password" id="password" name="password" class="form-control" required>
                        </div>

                        <button type="submit" class="btn-login">
                            Đăng nhập
                        </button>

                    </form>

                    <div class="footer">
                        Chưa có tài khoản?
                        <a href="${pageContext.request.contextPath}/register.jsp">
                            Đăng ký ngay
                        </a>
                    </div>

                </div>

            </div>

        </body>

        </html>