<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>고객 관리 시스템</title>
    <script src="${ pageContext.request.contextPath }/resources/js/jquery-3.4.1.min.js" charset="utf-8"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/bootstrap.js" charset="utf-8"></script>
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/mycss.css">
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/bootstrap.css">
  </head>
  <style>
    :root {
      --input-padding-x: 1.5rem;
      --input-padding-y: .75rem;
    }

    body {
      background: #007bff;
      background: linear-gradient(to right, #009591, #33AEFF);
    }

    .card-signin {
      border: 0;
      border-radius: 1rem;
      box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.1);
    }

    .card-signin .card-title {
      margin-bottom: 2rem;
      font-weight: 300;
      font-size: 1.5rem;
    }

    .card-signin .card-body {
      padding: 2rem;
    }

    .form-signin {
      width: 100%;
    }

    .form-signin .btn {
      font-size: 80%;
      border-radius: 5rem;
      letter-spacing: .1rem;
      font-weight: bold;
      padding: 1rem;
      transition: all 0.2s;
    }

    .form-label-group {
      position: relative;
      margin-bottom: 1rem;
    }

    .form-label-group input {
      height: auto;
      border-radius: 2rem;
    }

    .form-label-group>input,
    .form-label-group>label {
      padding: var(--input-padding-y) var(--input-padding-x);
    }

    .form-label-group>label {
      position: absolute;
      top: 0;
      left: 0;
      display: block;
      width: 100%;
      margin-bottom: 0;
      /* Override default `<label>` margin */
      line-height: 1.5;
      color: #495057;
      border: 1px solid transparent;
      border-radius: .25rem;
      transition: all .1s ease-in-out;
    }
  </style>
  </style>
  <body>
    <div class="container">
       <div class="row">
         <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
           <div class="card card-signin my-5">
             <div class="card-body">
               <div align=center><img src="${ pageContext.request.contextPath }/resources/images/login_logo.png" style="width: 40%; heigh:40%;" alt=""></div><br/>
               <h5 class="card-title text-center" style="font-family: hanaCM">하나은행 기업고객 관리 시스템</h5>
               <form class="form-signin" method="post">
                 <div class="form-label-group">
                   <input type="text" id="id" name="id" class="form-control" placeholder="사번" required autofocus>
                   <!-- <label for="inputEmail">Email address</label> -->
                 </div>

                 <div class="form-label-group">
                   <input type="password" id="password" name="password" class="form-control" placeholder="비밀번호" required>
                   <!-- <label for="inputPassword">Password</label> -->
                 </div>

                 <div class="custom-control custom-checkbox mb-3" style="padding-left: 10px;">
                   <a href="/join" style="font-family: hanaL">회원가입</a>
<!--                    <a href="/findInfo">아이디/비밀번호 찾기</a> -->
                 </div>
                 <button class="btn btn-lg btn-primary btn-block text-uppercase" 
                 type="submit" style="background:#28b2a5;border-color: transparent;font-family: hanaCM; font-size: 20px">Log in</button>

               </form>
             </div>
           </div>
         </div>
       </div>
     </div>
  </body>
</html>
