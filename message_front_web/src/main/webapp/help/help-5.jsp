<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="x-ua-compatible" content="IE=11">
    <meta http-equiv="Content-Language" content="utf-8" />
    <meta content="all" name="robots" />
    <title>
        政务信息咨询
    </title>
    <meta name="keywords" content="领导咨询板" />
    <meta name="description" content="领导咨询板" />
    <meta name="filetype" content="1" />
    <meta name="publishedtype" content="1" />
    <meta name="pagetype" content="2" />
    <meta name="catalogs" content="XTW_0002000" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/page.css-v=R36.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/message.css"/>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/cascader.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/layui.css"/>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.webui-popover.css"/>
    <link href="/favicon.ico" rel="icon" type="image/x-icon" />

    <script src="../static/common/js/thirdparty/jquery.min.js" type="text/javascript"></script>
    <script src="../static/common/js/thirdparty/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../static/common/js/thirdparty/jquery.form.js" type="text/javascript"></script>
    <script src="../static/common/js/thirdparty/jquery.webui-popover.js" type="text/javascript"></script>
    <script src="../static/common/js/thirdparty/layer/layer.js" type="text/javascript"></script>
    <script src="../static/common/js/thirdparty/tmpl.min.js" type="text/javascript"></script>
    <script src="../static/common/js/thirdparty/json2.js" type="text/javascript"></script>
    <script src="../static/common/js/common.js" type="text/javascript"></script>
    <script src="../static/common/js/tab.js" type="text/javascript"></script>
    <script type="text/javascript">
        CONTEXT_PATH = "";
        $(function() {
            $("#login-point").on("click", function() {
                $('#mask').show()
                $('#login-box').show();
            });
            $('#login-box .btn').click(function() {
                $('#mask').hide()
                $('#login-box').hide();
            });
            $("#search_btn").click(function() {
                var searchWord = $("#srchtxt").val();
                if(searchWord == "" || Common.getByteLen(searchWord) < 4) {
                    layer.alert("输入的关键词过短，必须多于2个中文汉字", {
                        icon: 5
                    });
                    return false;
                }
            });
            $("#topbanner .inner .n1").mouseover(function() {
                $("#topbanner .inner .n1 .search").show();
                $("#topbanner .inner .n1").addClass("active");

            }).mouseout(function() {
                $("#topbanner .inner .n1 .search").hide();
                $("#topbanner .inner .n1").removeClass("active")
            });

            Common.loadAllAdvs();
        });
    </script>
</head>

<body>
<!--nav-->
<%@ include file="../common/common-top-help.jsp"%>
<!--nav end-->

<script type="text/javascript" src="../static/common/js/thirdparty/jquery.highlighter.min.js" tppabs="http://liuyan.people.com.cn/static/common/js/thirdparty/jquery.highlighter.min.js"></script>

<style type="text/css">
    .highlight {
        color: #F00;
        font-weight: bold;
        font-size: 18px;
    }

    .sl-btn input {
        padding: 0 4px;
        height: 30px;
        line-height: 30px;
        letter-spacing: 4px;
        text-indent: 2px;
        background: #e49960;
        color: #fff;
    }

    .sl-txt input {
        width: 151px;
        height: 26px;
        border: 1px solid #cdcdcd;
    }

    .liuyanqudao-div li img {
        width: 260px;
        height: 300px;
    }

    .deletion-btn-area {
        text-align: center;
    }

    .deletion-btn-area a {
        color: #fff;
        margin: 0px 30px;
        text-decoration: none;
    }

    .help-btn {
        display: inline-block;
        border: none;
        width: 100px;
        height: 30px;
        background: #d73240;
        text-align: center;
        line-height: 30px;
        color: #fff;
        border-radius: 6px;
    }
</style>

<script>
    function initMobileMenu() {
        var mobileBar = document.getElementById('help-bar')
        var sidebar = document.querySelector('.sidebar')
        var menuButton = mobileBar.querySelector('.menu-button')

        menuButton.addEventListener('click', function() {
            sidebar.classList.toggle('open')
        })

        document.body.addEventListener('click', function(e) {
            if(e.target !== menuButton && !sidebar.contains(e.target)) {
                sidebar.classList.remove('open')
            }
        })
    }

    function search(text) {
        $(".highlight").each(function() {
            var c = $(this).html();
            $(this).replaceWith(c);
        });

        var findFlag = false;
        for(var i = 1; i < 9; i++) {

            $("#content_" + i).hide();
            $("#content_" + i).each(function(index, domEle) {
                $(domEle).hide();
                $(domEle).find("li").each(function(index, ele) {
                    if($(ele).html().indexOf(text) > 0) {
                        findFlag = true;
                        $(ele).show();
                        $(ele).highlight(text, {
                            needUnhighlight: false,
                            hClass: "highlight"
                        });
                        $(domEle).show();
                        $("#content_" + i).show();
                    } else {
                        $(ele).hide();
                    }
                });

            });
        }
        if(findFlag) {
            $("#noresult").hide();
        } else {
            $("#noresult").show();
        }
    }

    function dosearch() {
        var value = $("#srchtxt").val();
        if(value == "") {
            alert("请输入关键词！");
            return;
        }
        search(value.trim());

    }

    $(function() {
        var cat = Common.getPageParamsByRequest(["cat"])["cat"];
        if(cat != undefined && cat != null && cat != "") {
            showmen(cat);
        }

        var top = parseInt('')
        if(top) {
            var anchorPoint = $('#' + top).offset().top;
            $(window).scrollTop(anchorPoint);
        }

        initMobileMenu();
    })

    window.onload = function() {
        var hashName = location.hash.replace(/^#/, "")
        var isM = $("#isMobile").val();
        if(hashName.length > 0 && isM) {
            var hashObjTop = $("a[name=" + hashName + "]").offset().top - 40;
            $(window).scrollTop(hashObjTop)
        }
    }
</script>

<div class="path_2j w1200 grey2">
    <p>当前位置 :
        <a href="../index.jsp" >领导咨询 </a>&nbsp;&gt;&nbsp;
        <a href="help-1.jsp" >帮助中心</a>
    </p>
</div>

<input type="hidden" id="isMobile" value="false">
<div id="help-bar">
    <a class="menu-button"></a>
</div>
<div id="help" class="col clearfix">
    <div class="col-ctn">

        <div class="col-left sidebar">
            <ul>
                <li>
                    <a href="help-1.jsp" id="title_1" >新用户必读</a>
                </li>
                <li>
                    <a href="help-2.jsp" id="title_2" >服务协议</a>
                </li>
                <li>
                    <a href="help-3.jsp" id="title_3">咨询基础操作</a>
                </li>
                <li>
                    <a href="help-4.jsp" id="title_4" >如何删除咨询</a>
                </li>
                <li>
                    <a href="help-5.jsp" id="title_6" class="active">常见问题</a>
                </li>
                <li>
                    <a href="help-6.jsp" id="title_7" >咨询如何迅速得到办理</a>
                </li>
                <li>
                    <a href="help-7.jsp" id="title_8" >联系我们</a>
                </li>
                <li>
                    <a href="help-8.jsp" id="title_9" >隐私政策</a>
                </li>
            </ul>
        </div>

        <div class="col-right" id="noresult" style="display:none;">未找到相关内容！</div>

        <div class="col-right" id="content_6" style="display:block;">
            <div class="table">
                <h4>5 常见问题</h4>
                <ol>
                    <li><b>《领导咨询板》为您搭建与领导沟通的桥梁，不干涉双方沟通结果。《领导咨询板》会积极携手各方更好地解决问题，但作为非主管部门，《领导咨询板》无法保证您的咨询一定能获得公开展示（有关咨询能否展示请参阅“2.3咨询及评价涉及以下内容将无法获得公开展示”），也不保证您的咨询能获得回复，亦不保证您的诉求一定能获得解决。</b></li>
                </ol>
                <ul>
                    <li>
                        <a href="#5-1">5.1 咨询怎么没有展示？</a>
                    </li>
                    <li>
                        <a href="#5-2">5.2 咨询怎么没有回复？</a>
                    </li>
                    <li>
                        <a href="#5-3">5.3 咨询怎么进行修改？</a>
                    </li>
                </ul>
            </div>
            <div class="details">
                <div class="item">
                    <a name="5-1"></a>
                    <h5>5.1 咨询怎么没有展示？</h5>
                    <ol>
                        <li>《领导咨询板》的咨询处理需要时间，随着咨询量的不断增加，我们将尽量在24小时内处理完咨询，送达领导案头。如超过24小时未获得展示，可能由于咨询内容中有《管理协议》中提到的无法展示的内容。</li>
                    </ol>
                </div>
                <div class="item">
                    <a name="5-2"></a>
                    <h5>5.2 咨询怎么没有回复？</h5>
                    <ol>
                        <li>根据您提供信息的详实程度、事项办理的难易程度，及是否有办理机构进行办理，具体回复时间无法估计，请耐心等待。</li>
                    </ol>
                </div>
                <div class="item">
                    <a name="5-3"></a>
                    <h5>5.3 咨询怎么进行修改？</h5>
                    <ol>
                        <li>您发送的每一封咨询，我们都认为是真实有效的，所以便于咨询的审核和后续的办理，咨询提交后是不能修改的，您需要在提交咨询时对所说的内容负责。</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>

</div>
<script type="application/javascript">
    $(function() {
        var isM = $("#isMobile").val();
        if(isM == "true") {
            $(".nav01").hide();
            $(".nav02").hide();
            $(".nav03").hide();
        }

    });

    function checkToDel() {
        var isM = $("#isMobile").val();
        if(isM == "true") {
            layer.alert("仅支持在PC浏览器申请删帖", {
                icon: 5
            });
        } else {
            window.location.href = CONTEXT_PATH + "/deletion/index";
        }
    }
</script>

<%@ include file="../common/common-bottom-help.jsp"%>

<script src="../static/common/js/webdig_test.js" tppabs="http://liuyan.people.com.cn/static/common/js/webdig_test.js" language="javascript" type="text/javascript"></script>

</body>

</html>
