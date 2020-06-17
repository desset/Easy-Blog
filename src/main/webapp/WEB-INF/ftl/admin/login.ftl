<!doctype html>
<html>
<head>
    <title>登录</title>
    <link rel="shortcut icon" type="image/x-icon" href="static/images/web-icon.png" media="screen" />
    <!-- 引入bootstrap时路径怎么写？ -->

    <link rel="stylesheet" href="static/css/bootstrap.min.css">


    <style>
        #myCarousel{
            margin-left: 5%;
            margin-top:5%;
            width: 800px;
            height: 80%;
            float: left;
            z-index: 999;
            display: inline;
        }
        #login{
            float: left;
            height: 250px;
            width: 330px;
            margin-left: 10%;
            margin-top: 10%;
            display: inline;
            z-index: 999;
        }
        body{
            padding:0;
            margin:0;
        }
    </style>

</head>
<body>

<h2 style="text-align: center;font-family: 'Adobe 楷体 Std R';color: black">博客管理系统</h2>

	
<div id="myCarousel" class="carousel slide">
  	    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol> 
    <div class="carousel-inner">
        <div class="item active">
            <img src="static/images/105905-106.jpg" alt="第一张">
        </div>
        <div class="item">
            <img src="static/images/82839-106.jpg" alt="第二张">
        </div>
        <div class="item">
        	<!-- webconfig.java中配置了/img/**代表/static/images/的路径但是不好用 -->
            <!-- <img src="/img/296494-106.jpg" alt="第三张"> -->
            <img src="static/images/296494-106.jpg" alt="第三张">
        </div>

    </div>
  <!--   <a class="carousel-control left" href="#myCarousel"
       data-slide="prev">&lsaquo;
    </a>
    <a class="carousel-control right" href="#myCarousel"
       data-slide="next">&rsaquo;
    </a> -->
</div>

<div  id="login">
    <div class="form-inline"  >
        <div class="input-group">
            <span class="input-group-addon">账号</span>
            <input type="text" class="form-control" name="id" id="adminId">
        </div><br/><br/>
        <div class="input-group">
            <span class="input-group-addon">密码</span>
            <input type="password" class="form-control" name="passwd" id="passwd">
        </div>
        <br/>
        <p style="text-align: right;color: red;position: absolute" id="info"></p>

        <br/>
        <button id="loginButton"  class="btn btn-primary">登陆
        </button>

    </div>
      <script src="static/js/jquery-3.2.1.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script> 
    <script type="text/javascript">
        $(function(){
            $('#myCarousel').carousel({
                interval: 3000
            })
        });
    </script>
   <script type="text/javascript">

        $("#adminId").keyup(
            function () {
                    $("#info").text("");
            }
        )
        $("#loginButton").click(function () {
            if($("#adminId").val()==''&&$("#passwd").val()==''){
                $("#info").text("提示:账号和密码不能为空");
            }
            else if ($("#adminId").val()==''){
                $("#info").text("提示:账号不能为空");
            }
            else if($("#passwd").val()==''){
                $("#info").text("提示:密码不能为空");
            }
             else {
                $.ajax({
                    type: "POST",
                    //这里的url是相对路径，此时的请求页面是/Blog-System/admin/login,
                    //相对路径前缀就是/Blog-System/admin
                    //也可以用绝对路径/Blog-System/admin/api/loginCheck
                    url: "subLogin",
                     data: {
                        username:$("#adminId").val() ,
                        password: $("#passwd").val()
                    }, 
                    dataType: "json",
                    success: function(data) {
                       /*  if(data.stateCode.trim() == "0") {
                            $("#info").text("提示:该用户不存在");
                        } else if(data.stateCode.trim() == "1") {
                            $("#info").text("提示:密码错误");
                        } else if(data.stateCode.trim() == "2"){
                            $("#info").text("提示:登陆成功，跳转中...");
                            window.location.href="main";
                        } */
                        //跳转回登录前被shiro拦截的页面
                    	//window.location.href=data.url;
                    	window.location.href="main";
                    }
                });
            } 
            
        })

    </script>

</div>

</body>
</html>