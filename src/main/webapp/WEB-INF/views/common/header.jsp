<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
<title>Text Game</title>
	<style>
	   .navbar-collapse {
		    display: flex!important;
		    flex-basis: auto;
		    justify-content: center;
		}
		.position-absolute a{
			color: white;
		}
		*{
			font-weight:bold;
			text-shadow: -1px 0px black, 0px 1px black, 1px 0px black, 0px -1px black;
		}
	</style>
<head>
<header>

        <div class="position-absolute top-0 end-0" style="padding-top: 10px;">
            <a href="#">로그인</a>
            <a href="#" style="margin: 20px;">가입하기</a>
        </div>

        <!-- header -->
        <div class="header">

            <!-- logo image -->
         <div class="position-relative" style="text-align: center;
             padding-top: 3%;"><a href="#"><img
                     src="resources/headerIMG/poe_logo6.png" id="logo_image"></a></div>


    <!-- 네비게이션 바 -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <div class="container">
      
        <!-- 로고/브랜드 -->
        <!-- <a class="navbar-brand" href="#">로고</a> -->
        
        <!-- 토글 버튼 -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <!-- 네비게이션 메뉴 -->
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link" href="#">메뉴1</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">메뉴2</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">메뉴3</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                드롭다운 메뉴
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="#">드롭다운 메뉴1</a></li>
                <li><a class="dropdown-item" href="#">드롭다운 메뉴2</a></li>
                <li><a class="dropdown-item" href="#">드롭다운 메뉴3</a></li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </nav>
</header>