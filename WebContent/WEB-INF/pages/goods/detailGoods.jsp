<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<style type="text/css">
div.inset {border-style: inset;
width:700px}
</style>
<head>
    <meta charset="utf-8" />
    <title>C2C</title>
    <link rel="stylesheet" href="<%=basePath%>css/index.css" />
    <script type="text/javascript" src="<%=basePath%>js/jquery.js" ></script>
    <script type="text/javascript" src="<%=basePath%>js/materialize.min.js" ></script>
    <script type="text/javascript" src="<%=basePath%>js/index.bundle.js" ></script>
    <link rel="stylesheet" href="<%=basePath%>css/materialize-icon.css" />
    <link rel="stylesheet" href="<%=basePath%>css/detail.css" />
    <link rel="stylesheet" href="<%=basePath%>css/new.css" />
    <script>
        function showLogin() {
            if($("#signup-show").css("display")=='block'){
                $("#signup-show").css("display","none");
            }
            if($("#login-show").css("display")=='none'){
                $("#login-show").css("display","block");
            }else{
                $("#login-show").css("display","none");
            }
        }
        function showSignup() {
            if($("#login-show").css("display")=='block'){
                $("#login-show").css("display","none");
            }
            if($("#signup-show").css("display")=='none'){
                $("#signup-show").css("display","block");
            }else{
                $("#signup-show").css("display","none");
            }
        }
        function ChangeName() {
            if($("#changeName").css("display")=='none'){
                $("#changeName").css("display","block");
            }else{
                $("#changeName").css("display","none");
            }
        }
         $(function(){
        	 $(".inset").hide(); //默认隐藏
    		
    	})
      
            </script>
<body ng-view="ng-view">
<!--
    作者：hlk_1135@outlook.com
    时间：2017-05-05
    描述：顶部
-->
<div ng-controller="headerController" class="header stark-components navbar-fixed ng-scope">
    <nav class="white nav1">
        <div class="nav-wrapper">
            <a href="<%=basePath%>goods/homeGoods" class="logo">
                <em class="em2">C2C</em>
            </a>
            <div class="nav-wrapper search-bar">
                <form ng-submit="search()" class="ng-pristine ng-invalid ng-invalid-required">
                    <div class="input-field">
                        <input id="search" placeholder="搜点什么吧233..." value="<c:out value="${search}"></c:out>" style="height: 40px;"
                               class="ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required"/>
                        <label for="search" class="active">
                            <i ng-click="search()" class="iconfont"></i>
                        </label>
                    </div>
                </form>
            </div>
            <ul class="right">
                <c:if test="${empty cur_user}">
                    <li class="publish-btn">
                        <button ng-click="showLogin()" data-position="bottom" data-delay="50"
                                data-tooltip="需要先登录哦！" class="red lighten-1 waves-effect waves-light btn" data-tooltip-id="510d3084-e666-f82f-3655-5eae4304a83a"	>
                            我要发布</button>
                    </li>
                </c:if>
                <c:if test="${!empty cur_user}">
                    <li class="publish-btn">
                        <button data-position="bottom" class="red lighten-1 waves-effect waves-light btn">
                            <a href="../../goods/publishGoods">我要发布</a>
                        </button>
                    </li>
                    <li>
                        <a href="../../user/allGoods">我发布的商品</a>
                    </li>
                    <li>
                        <a>${cur_user.username}</a>
                    </li>
                    <li class="notification">
                        <i ng-click="showNotificationBox()" class="iconfont"></i>
                        <div ng-show="notification.tagIsShow" class="notification-amount red lighten-1 ng-binding ng-hide">0 </div>
                    </li>
                    <li class="changemore">
                        <a class="changeMoreVertShow()">
                            <i class="iconfont"></i>
                        </a>
                        <div class="more-vert">
                            <ul class="dropdown-content">
                                <li><a href="../../user/home">个人中心</a></li>
                                <li><a>消息</a></li>
                                <li><a onclick="ChangeName()">更改用户名</a></li>
                                <li><a href="../../user/logout">退出登录</a></li>
                            </ul>
                        </div>
                    </li>
                </c:if>
                <c:if test="${empty cur_user}">
                    <li>
                        <a onclick="showLogin()">登录</a>
                    </li>
                    <li>
                        <a onclick="showSignup()">注册</a>
                    </li>
                </c:if>
            </ul>
        </div>
    </nav>
</div>
<!--
    作者：hlk_1135@outlook.com
    时间：2017-05-05
    描述：登录
-->
<div ng-controller="loginController" class="ng-scope">
    <div id="login-show" class="login stark-components">
        <div class="publish-box z-depth-4">
            <div class="row">
                <a onclick="showLogin()">
                    <div class="col s12 title"></div>
                </a>
                <form:form action="../../user/login" method="post" commandName="user" role="form">
                    <div class="input-field col s12">
                        <input type="text" name="phone" required="required" pattern="^1[0-9]{10}$" class="validate ng-pristine ng-empty ng-invalid ng-invalid-required ng-valid-pattern ng-touched" />
                        <label>手机</label>
                    </div>
                    <div class="input-field col s12">
                        <input type="password" name="password" required="required" class="validate ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required" />
                        <label>密码</label>
                        <a ng-click="showForget()" class="forget-btn">忘记密码？</a>
                    </div>
                    <button type="submit" class="waves-effect waves-light btn login-btn red lighten-1">
                        <i class="iconfont left"></i>
                        <em>登录</em>
                    </button>
                    <div class="col s12 signup-area">
                        <em>没有账号？赶快</em>
                        <a onclick="showSignup()" class="signup-btn">注册</a>
                        <em>吧！</em>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>
<!--
    作者：hlk_1135@outlook.com
    时间：2017-05-06
    描述：注册
-->
<div ng-controller="signupController" class="ng-scope">
    <div id="signup-show" class="signup stark-components">
        <div class="publish-box z-depth-4">
            <div class="row">
                <a onclick="showSignup()">
                    <div class="col s12 title"></div>
                </a>
                <form:form action="../../user/addUser" method="post" commandName="user" role="form">
                    <div class="input-field col s12">
                        <input type="text" name="username" required="required" class="validate ng-pristine ng-empty ng-invalid ng-invalid-required ng-valid-pattern ng-touched" />
                        <label>昵称</label>
                    </div>
                    <div class="input-field col s12">
                        <input type="text" name="phone" required="required" pattern="^1[0-9]{10}$" class="validate ng-pristine ng-empty ng-invalid ng-invalid-required ng-valid-pattern ng-touched" />
                        <label>手机</label>
                    </div>
                    <div class="input-field col s12">
                        <input type="password" name="password" required="required" class="validate ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required" />
                        <label>密码</label>
                    </div>
                    <div ng-show="checkTelIsShow" class="col s12">
                        <button type="submit" class="waves-effect waves-light btn verify-btn red lighten-1">
                            <i class="iconfont left"></i>
                            <em>点击注册</em>
                        </button>
                    </div>
                    <div ng-show="checkTelIsShow" class="login-area col s12">
                        <em>已有账号？去</em>
                        <a onclick="showLogin()">登录</a>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>
<!--更改用户名-->
<div ng-controller="changeNameController" class="ng-scope">
    <div id="changeName" class="change-name stark-components">
        <div class="publish-box z-depth-4">
            <div class="row">
                <div class="col s12 title">
                    <h1>修改用户名</h1>
                </div>
                <form:form action="../../user/changeName" method="post" commandName="user" role="form">
                    <div class="input-field col s12">
                        <input type="text" name="username" required="required" class="validate ng-pristine ng-empty ng-invalid ng-invalid-required ng-valid-pattern ng-touched" />
                        <label>修改用户名</label>
                    </div>
                    <div ng-show="checkTelIsShow" class="col s12">
                        <button class="waves-effect waves-light btn publish-btn red lighten-1">
                            <i class="iconfont left"></i>
                            <em>确认</em>
                        </button>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>
<!--显示商品详情-->
<div ng-controller="detailBoxController" class="detail-box stark-components z-depth-1 row ng-scope">
    <div class="col s12 path">
        <a href="<%=basePath%>goods/catelog/${catelog.id}">${catelog.name}</a>
        <em>></em>
        <a>${goodsExtend.goods.name}</a>
    </div>
    <div class="col s6">
        <div class="slider" style="height: 440px;">
            <ul class="slides" style="height: 400px;">
                <img src="<%=basePath%>upload/${goodsExtend.images[0].imgUrl}" />
            </ul>
            <ul class="indicators">
                <li class="indicator-item"></li>
                <li class="indicator-item"></li>
                <li class="indicator-item"></li>
                <li class="indicator-item"></li>
            </ul>
        </div>
    </div>
    <div class="col s6">
        <h1 class="item-name">${goodsExtend.goods.name}</h1>
        <h2 class="item-price">${goodsExtend.goods.price}</h2>
        <div class="item-public-info">
            <p class="bargain">可讲价</p>
            <p>
                <i class="iconfont"></i>
                <em class="item-location">C2C</em>
            </p>
        </div>
        <div class="publisher-info-title">
            <em>卖家信息</em><hr>
        </div>
        
        <c:if test="${empty cur_user}">
            <div class="item-contact">
                <p class="not-login">
                    <a onclick="showLogin()">登录</a>
                    <em>或</em>
                    <a onclick="showSignup()">注册</a>
                    <em>后查看联系信息</em>
                </p>
            </div>
        </c:if>
        <c:if test="${!empty cur_user}">
            <div class="item-contact">
                <div>
                    <div class="base-blue z-depth-1 attr">
                        <i class="iconfont"></i>
                    </div>
                    <div class="value">${seller.username}</div>
                </div>
                <div>
                    <div class="base-blue z-depth-1 attr">
                        <i class="iconfont"></i>
                    </div>
                    <div class="value">${seller.phone}</div>
                </div>
                <div>
                    <div class="base-blue z-depth-1 attr">
                        <i class="iconfont"></i>
                    </div>
                    <div class="value">${seller.qq}</div>
                </div>
                <!-- 按钮 -->
                <c:if test="${goodsExtend.goods.good_status!=3}">
                <div>
                <form action="../../order/enter" method="post">
                <input type="hidden" name="goodsId" value="${goodsExtend.goods.id}"/>
                <input type="hidden" name="sellerId" value="${seller.id}">
                <input type="hidden" name="goodsName" value="${goodsExtend.goods.name}"/>
                <input type="hidden" name="goodsPrice" value="${goodsExtend.goods.price}"/>
                <input type="hidden" name="image" value="${goodsExtend.images[0].imgUrl}"/>
                <input type="hidden" name="goodsDescrible" value="${goodsExtend.goods.describle}"/>                   
<!--                 <div class="debutton"> -->
                <input  type="submit"  value="我要购买"  style="width: 130px;border: 0px;font-size: 18px;  height: 40px;float: left;border:none;background-color: #EF5350;" /> 
<!--                 </div> -->
                </form>
                <div class="debutton1">
                <input type="button" value="收藏" onclick="shoucang(${goodsExtend.goods.id})"> 
                </div>
                </div>
                </c:if>
                <c:if test="${goodsExtend.goods.good_status==3}">
                	<h1 class="shouchu">已售出</h1>
                	</c:if>
            </div>
        </c:if>
        <h1 class="item-pub-time">发布于 ${goodsExtend.goods.startTime}</h1>
    </div>
</div>
<div class="detail-box stark-components z-depth-1 row">
    <h1 class="title">商品详情</h1>
    <hr class="hr1" />
    <hr class="hr2" />
    <p class="section">${goodsExtend.goods.describle}</p>
    <p class="section"></p>
    <p class="section">
    </p>
</div>
<div class="row detail-area">

    <div class="clo s12">
        <div ng-controller="commentController" class="comment stark-components z-depth-1 ng-scope">
            <h1 class="title">评论</h1>
            <hr class="hr1" />
            <hr class="hr2" />
            <c:forEach var="items" items="${commentsAndUserName}" varStatus="idxStatus">
            <input id="com${idxStatus.index}" type="hidden" value="${items.comments.id}"/>
            <div class="comment-collection">
                <div class="comment-item ng-scope">
                    <div class="comment-main-content">
                        <em class="name ng-binding">${items.name}:</em>
                        <em class=ng-binding>${items.comments.content} </em>
                        <em class="name ng-binding  ng-hide">@:</em>
                        <em class="ng-binding"></em>
                    </div>
                    <div class="comment-main-content">
                        <em class="time ng-biinding">${items.comments.createAt}</em>
                        <a class="reply-or-delete"   onclick="zk(${idxStatus.index})" >回复</a>
                     <div  id = "hide${idxStatus.index}" class ="inset" style="left:200px; position:relative;left: 200px;position: relative;display: block;border-top-width: 1px;border-left-width: 1px;border-bottom-width: 1px;border-right-width: 1px;"> 
                     
                    <div class ="comment-function" id="replysList">
                    	
                    </div>   
                 <div class="comment-add row" style="padding-bottom: 0px;margin-bottom: 1px;">
										<div class="input-field col s12"
											style="padding-right: 0px; width: 395.5px;">
											<input id="replybox" type="text" name="reply"
												class="validate ng-pristine ng-untouched ng-valid ng-empty" />
											<label for="replybox" style="right: -250px">这里写下回复</label>
											<button type="submit"
												class="waves-effect wave-light btn comment-submit"
												onclick="reply()">发表</button>
										</div>
									</div>
            </div>
                    </div>
                    
                </div>
            </div>
            </c:forEach>
            <div class="comment-add row">
                <div class="input-field col s12" >
                    <i class="iconfont prefix"></i>
                    <input id="commentbox" type="text" name="content" class="validate ng-pristine ng-untouched ng-valid ng-empty"/>
                    <label for="commentbox">这里写下评论</label>
                    <c:if test="${empty cur_user}">
                    <button type="submit" class="waves-effect wave-light btn comment-submit" onclick="">
                                                                      请先登录</button>
                    </c:if>
                     <c:if test="${!empty cur_user}">
                    <button type="submit" class="waves-effect wave-light btn comment-submit" onclick="comments()">
                                                                      确认</button>
                      </c:if>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" value="" id="temp"/>
</div>
<script type="text/javascript">
		function comments() {
			var content = $("#commentbox").val().trim();
			var goodsId ="${goodsExtend.goods.id}";
			
			if (content=="") {
				alert("请输入评论！");
				return;
			}
			$.post("<%=basePath%>comments/up", {
				"content" : content,
				"goodsId" : goodsId
			}, function(result) {
				if(result){
					alert("评论成功！");
					window.location.reload(); 
				}else{
					alert("评论失败！");
				}
			});

		}
		function zk(index){
			
			 var comid=$('#com'+index+'').val();
		      $('#hide'+index+'').toggle();//显示隐藏切换
		      $("#temp").val(comid);
		      $.post("<%=basePath%>reply/update", {
					"commentId" : comid
				}, function(result) {
					if(result.replyList.length>0){
						for (var i = 0; i < result.replyList.length; i++) {
							var node = "<div>"
										+"<em class='name ng-binding'>"+result.replyList[i].user[0].username+":</em>"
										+"<em class='ng-binding'>"+result.replyList[i].content+"</em><br>"
										+"<em class='time ng-biinding'>"+result.replyList[i].createAt+"</em>"
										+"<hr/></div>";
							$("#replysList").append(node);
						}
					}else{
						$("#replysList").html("<p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp暂无回复！</p>");
					}
					
				});
		}
		function reply() {
			
			var replyContent = $("#replybox").val().trim();
			var commentId =$("#temp").val();
		
			if (replyContent=="") {
				alert("请输入回复内容！");
				return;
			}
			$.post("<%=basePath%>reply/up", {
				"replyContent" : replyContent,
				"commentId" : commentId
			}, function(result) {
				if(result){
					alert("回复成功！");
					window.location.reload(); 
				}else{
					alert("回复失败！");
				}
			});

		}
		
		function shoucang(id){
			var collection ="${collection}";
			var img_url = "${goodsExtend.images[0].imgUrl}";
			var goods_name= "${goodsExtend.goods.name}";
			var goods_describle= "${goodsExtend.goods.describle}";
			if(!collection==""){
				alert("该商品已收藏！");
				return false;
			}else{
				$.post("<%=basePath%>collection/shoucang", {
					"goodsid" : id,
					"img_url" : img_url,
					"goods_describle":goods_describle,
					"goods_name":goods_name
				}, function(result) {
					if(result){
						alert("收藏成功！");
					}else{
						alert("收藏失败！");
					}
				});
			}
				
		}
	</script>
</body>
</html>