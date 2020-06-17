<!-- url:/admin/article/comment -->
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
<div style="position: relative;top: 10%">
    <#if succ??>
        <div class="alert alert-success" role="alert">
                ${succ}
        </div>
    </#if>
    <#if error??>
        <div class="alert alert-danger" role="alert">
                ${error}
        </div>
    </#if>
</div>
<div class="container">
    <#if comments??>
    <table class="table">
        <thead class="thead-default">
        <tr>
            <th>流水号</th>
            <th>评论内容</th>
            <th>日期</th>
            <th>昵称</th>
            <th>邮箱</th>
            <th>删除</th>
        </tr>
        </thead>
        <tbody>
        <#list comments as comment>
        <tr>
            <th scope="row">${comment.id}</th>
            <td>${comment.content}</td>
            <td>${comment.date}</td>
            <td>${comment.name}</td>
            <td>${comment.email}</td>
            <td><button type="button" class="btn btn-outline-danger btn-sm" onclick="ifdelete(${comment.id}) ">删除</button></td>
        </tr>
        </#list>
  
        </tbody>
    </table>
        <script src="static/js/jquery-3.2.1.min.js"></script>
        <script>
            function ifdelete(id) {
                layer.confirm('确定删除该评论吗?', {
                    btn: ['确定','取消'] //按钮
                }, function(){               
                    $.ajax({
                        type: "POST",
                        //相对路径：前缀为此jsp的前缀，也就是Blog-Sytem/admin/article/
                        //所以必须用绝对路径，或者修改requestMapping中的路径
                        url: "/easy-blog/comment/delete",                        
                        data:{"id":id},
                        datatype:"json",
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
    <#else>

        <div class="card">
            <div class="card-body">
                该文章暂无评论!
            </div>
        </div>

    </#if>

</div>
</body>
</html>