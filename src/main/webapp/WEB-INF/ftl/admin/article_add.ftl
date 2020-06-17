<!-- url:Blog-System/admin/article/add -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="static/css/bootstrap4.0.min.css" >
    <script src="static/js/jquery.slim.min.js" ></script>
    <script src="static/js/popper.min.js" ></script>
    <script src="static/js/bootstrap4.0.min.js"></script>
    <script type="text/javascript" src="static/js/wangEditor.min.js"></script>
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
	<!-- add/do是相对于此jsp页面上一级目录的目录，完整的是/admin/article/add/do，
	访问的是ArticleController中的articleAddDo方法 -->
    <form action="article_add/do" method="post">
        <div class="form-group">
            <label for="title">文章标题</label>
            <input type="text" class="form-control" id="title" name="title" placeholder="文章标题">
        </div>
        <div class="form-group">
            <label for="catalogId">栏目</label>
            <select class="form-control" id="catalogId" name="catalogId">
                <option value="0">学习</option>
                <option value="1">生活</option>
            </select>
        </div>
        <div class="form-group">
            <label for="keywords">关键字</label>
            <input type="text" class="form-control" id="keywords" name="keywords" placeholder="关键字">
        </div>
        <div class="form-group">
            <label for="desci">简介</label>
            <textarea class="form-control" id="desci" rows="3" name="desci" placeholder="简介"></textarea>
        </div>
        <div class="form-group">
            <label for="div1">内容</label>
            <div id="div1">
            </div>
            <textarea id="content" name="content" style="display: none"></textarea>
        </div>
        <input type="submit" value="发表" />
    </form>
            <script type="text/javascript">
                var E = window.wangEditor
                var editor = new E('#div1')
                var $text1 = $('#content')
                editor.customConfig.onchange = function (html) {
                    /* 监控变化，同步更新到 textarea*/
                    $text1.val(html)
                }
                editor.create()
            </script>
</div>
</body>
</html>