<#assign base=rc.contextPath/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${base}/static/css/bootstrap4.0.min.css" >
    <script src="${base}/static/js/jquery.slim.min.js" ></script>
    <script src="${base}/static/js/popper.min.js" ></script>
    <script src="${base}/static/js/bootstrap4.0.min.js"></script>
    <script type="text/javascript" src="${base}/static/js/wangEditor.min.js"></script>
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
    <form action="/easy-blog/edit/do" method="post">
        <input type="hidden" value="${article.id}" name="id">
        <div class="form-group">
            <label for="title">文章标题</label>
            <input type="text" class="form-control" id="title" name="title" placeholder="文章标题" value="${article.title}">
        </div>
        <div class="form-group">
            <label for="catalogId">栏目</label>
            <select class="form-control" id="catalogId" name="catalogId">
                <option value="0" <#if article.catalogId==0>selected="selected"</#if>>学习</option>
                <option value="1" <#if article.catalogId==1>selected="selected"</#if>>生活</option>
            </select>
        </div>
        <div class="form-group">
            <label for="keywords">关键字</label>
            <input type="text" class="form-control" id="keywords" name="keywords" placeholder="关键字" <#if article.keywords??> value="${article.keywords}" </#if>>
        </div>
        <div class="form-group">
            <label for="desci">简介</label>
            <textarea class="form-control" id="desci" rows="3" name="desci" placeholder="简介">  <#if article.desci??>${article.desci}</#if></textarea>
        </div>
        <!-- style="display: none"表示不显示-->

        <div class="form-group">
            <label for="div1">内容</label>
            <!-- wangEditor在页面中显示的位置绑定在div1 -->
            <div id="div1">
            </div>
            <!-- style="display: none"表示不显示，这个textarea用来绑定wangEditor -->
            <textarea id="content" name="content" style="display: none"></textarea>
        </div>
            <input type="submit" value="提交"/>
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
                /*初始化 textarea 的值
                wangEditor将数据库中的信息进行回显*/
                editor.txt.html(`${article.content}`);
                   
                </script>
                

</div>
</body>
</html>