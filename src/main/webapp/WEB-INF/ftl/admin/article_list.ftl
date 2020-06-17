<!-- url:Blog-System/admin/article/list -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>博客管理系统</title>
    <link rel="stylesheet" href="static/css/bootstrap4.0.min.css" >
    <script src="static/js/jquery.slim.min.js" ></script>
    <script src="static/js/popper.min.js" ></script>
    <script src="static/js/bootstrap4.0.min.js"></script>
    <script src="static/js/layer.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light" >
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <!-- 跳转网页时，href后要项目名加modelandview名 -->
    <a class="navbar-brand text-success" >博客管理</a>

    <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
            <li class="nav-item">
                <!-- Example single danger button -->
                <div class="btn-group">
                    <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        新建
                    </button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="javascript:void(0);" onclick="fullScreen('添加文章','article_add')">文章</a>
                        <!-- <a class="dropdown-item" href="#">评论</a>-->
                    </div>
                </div>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="index">主页 </a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="main">系统信息 </a>
            </li>         
        </ul>
        <!-- 此页面的映射url是/Blog-System/admin/article/search，
        	所以相对路径前缀是/Blog-System/admin/article/ 
        	本页面的映射url只需加search
        -->
          <form class="form-inline my-2 my-lg-0" action="search" method="GET">
            <input class="form-control mr-sm-2" type="text" placeholder="文章标题或内容..." aria-label="Search" name="word">
            <button class="btn btn-outline-success my-2 my-sm-0 btn-sm" type="submit">搜索</button>
        </form>

        <a class="btn btn-outline-danger btn-sm" href="logout" role="button">退出</a>
    </div>
</nav>
<br/>
<table class="table table-sm">
    <thead>
    <tr class="table-info">
        <th>id</th>
        <th width="25%">标题</th>
        <th>发表时间</th>
        <th>点击量</th>
        <th>详情</th>
        <th>评论</th>
        <th>编辑</th>
        <th>删除</th>
    </tr>
    </thead>
    <tbody>
    <#list articles as article>
    <tr>
        <th scope="row">${article.id}</th>
        <td>${article.title}</td>
        <td>${article.localTime}</td>
        <td>${article.click}</td>
        <td><button type="button" class="btn btn-outline-info btn-sm" onclick="fullScreen('《${article.title}》','detail?id=${article.id}')">详情</button></td>
        <td><button type="button" class="btn btn-outline-success btn-sm" onclick="fullScreen('《${article.title}》|评论管理','comment?id=${article.id}')">评论</button></td>
        <td><button type="button" class="btn btn-outline-primary btn-sm" onclick="fullScreen('《${article.title}》|编辑','edit?id=${article.id}')">编辑</button>&nbsp;&nbsp;</td>
        <td><button type="button" class="btn btn-outline-danger btn-sm" onclick="ifdelete('${article.id}','${article.title}') ">删除</button></td>
    </tr>
    </#list>
    </tbody>
</table>
<!-- url不确定的话可以看404报错的url是哪里出错了 -->
<nav aria-label="Page navigation example" style="position: absolute;bottom: 10px;left: 42%">
    <ul class="pagination justify-content-center">
        <li class="page-item  <#if pageInfo.pageNum==1>disabled</#if>">
            <a class="page-link" href="article_list?page=1" >&laquo;</a>
        </li>
        <#list 1..pageInfo.pages as pageNo>
            <li class="page-item <#if pageInfo.pageNum==pageNo>active</#if>"><a class="page-link" href="article_list?page=${pageNo}">${pageNo}</a></li>
        </#list>
        <li class="page-item  <#if pageInfo.pageNum==pageInfo.pages>disabled</#if>">
            <a class="page-link" href="article_list?page=${pageInfo.pages}">&raquo;</a>
        </li>
    </ul>
</nav>
<script src="static/js/jquery-3.2.1.min.js"></script>
<script>
    function fullScreen(title,url){
        var index = layer.open({
            type: 2,
            title: title,
            area: ['70%', '70%'],
            content: url,
            maxmin: true
        });
        layer.full(index);
    }

    function ifdelete(id,title) {
        layer.confirm('确定删除该文章吗?', {
            btn: ['确定','取消'] //按钮
        }, function(){
            $.ajax({
                type: 'POST',
                url: '/easy-blog/article_del',
                datatype:'json',
                data:{"id":id},
                success: function(data){
                    if(data['stateCode']==1){
                        layer.msg('删除成功!',{icon:1,time:1000});
                        setTimeout("window.location.reload()",1000);
                    }
                    else {
                        layer.msg('删除失败!',{icon:5,time:1000});
                    }
                },
                error:function(data) {
                    console.log('错误...');
                },
            });
        }, function(){

        });
    }

</script>
</body>
</html>