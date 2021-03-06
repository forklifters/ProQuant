<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%--<meta charset="UTF-8">--%>
    <title>用户中心</title>
    <%@include file="common/head.jsp"%>
    <link href="../../css/myCSS/UserCenterCSS2.css" rel="stylesheet">
    <script type="text/javascript" src="../js/myJS/UserCenterJS.js"></script>

</head>
<body>
<!--导航栏start-->
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">ProQuant</a>
        </div>
        <ul class="nav navbar-nav">
            <li class="active"><a href="HomePage.jsp">首页</a></li>
            <li><a href="/MarketPage.do">大盘</a></li>
            <li><a href="/StockInfo.do">个股</a></li>
            <li><a href="/StockCompare.do">比较</a></li>
            <li><a href="#">策略</a></li>
            <li><a href="#">论坛</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li id="searchText"><input id="searchInput" type="text" placeholder="搜索"><i class="fa fa-search" aria-hidden="true"></i></li>
            <li><button id="loginButton"><i class="fa fa-user-circle" aria-hidden="true"></i>未登录</button></li>
            <li><img src="../images/skin.png"></li>
        </ul>
    </div>
</nav>
<!--导航栏end-->
<div class="user-main-body">
    <div class="content-holder">
        <div class="personal-info-holder">
            <img src="../images/temp-head.png" alt="Head Image" style="cursor: pointer">
            <span>Welcome!</span><span>XXX</span><span><img src="../images/edit.png" style="width: 20px;height: 20px;border-radius: 0px;margin-left: -10px;border: none;cursor: pointer"></span>
        </div>
        <div class="function-zone">
            <div class="bootstrap-tab">
                <ul class="nav nav-tabs">
                    <li class="active" id="tab0"><a href="#" style="cursor: pointer">个人账户</a></li>
                    <li  id="tab1"><a href="#">自选股</a></li>
                    <li id="tab2"><a href="#">创建策略记录</a></li>
                    <li id="tab3"><a href="#">使用策略记录</a></li>
                    <li id="tab4"><a href="#">浏览个股历史</a></li>
                    <button id="clear-button">清空</button>
                </ul>
            </div>
            <div class="function-content" id="user-account-part">
                <div class="user-data-holder">
                    <div>
                        <script>
                            function changeToCNY() {
                                $("#popover").webuiPopover('hide');
                                $("#popover").html("总资产-人民币计 ∨");
                            }
                            function changeToUSD() {
                                $("#popover").webuiPopover('hide');
                                $("#popover").html("总资产-美元计 ∨");
                            }
                        </script>
                        <h4><a href="#" id="popover" data-title="货币类型" data-content="<a href='#' id='cnyLink' style='cursor: pointer' onclick='changeToCNY()'>人民币CNY</a></br><a href='#' id='usdLink' style='cursor: pointer' onclick='changeToUSD()'>美元USD</a>" data-placement="right">总资产-人民币计 ∨</a></h4>
                        <h2 id="totalAssets">￥2,000,000</h2>
                        <div class="user-item">
                            <h2>可用现金</h2>
                            <div><h4>￥1,999,999</h4></div>
                        </div>
                        <div class="user-item">
                            <h2>总盈亏</h2>
                            <div><h4>￥0</h4></div>

                        </div>
                        <div class="user-item">
                            <h2>今日盈亏</h2>
                            <div><h4>￥0</h4></div>
                        </div>
                        <div class="user-item">
                            <h2 style="border-left: 3px solid #296ec2">投资表现</h2>
                            <div id="graph-holder">

                            </div>
                        </div>
                    </div>
                </div>
                <div class="deal-record-holder">
                    <h2>交易明细</h2>
                    <table class="table-hover table-responsive">
                        <thead>
                        <tr>
                            <th>股票名称</th>
                            <th>买入时间</th>
                            <th>卖出时间</th>
                            <th>买入数量</th>
                            <th>总盈亏</th>
                            <th>今日盈亏</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>阿里巴巴</td>
                            <td>2017/05/25</td>
                            <td>----/--/--</td>
                            <td>1000</td>
                            <td>10%</td>
                            <td>1.2%</td>
                        </tr>
                        <tr>
                            <td>百度</td>
                            <td>2017/05/25</td>
                            <td>----/--/--</td>
                            <td>1000</td>
                            <td>10%</td>
                            <td>1.2%</td>
                        </tr>
                        <tr>
                            <td>腾讯</td>
                            <td>2017/05/25</td>
                            <td>----/--/--</td>
                            <td>1000</td>
                            <td>10%</td>
                            <td>1.2%</td>
                        </tr>
                        <tr>
                            <td>谷歌</td>
                            <td>2017/05/25</td>
                            <td>----/--/--</td>
                            <td>1000</td>
                            <td>10%</td>
                            <td>1.2%</td>
                        </tr>
                        <tr>
                            <td>苹果</td>
                            <td>2017/05/25</td>
                            <td>----/--/--</td>
                            <td>1000</td>
                            <td>10%</td>
                            <td>1.2%</td>
                        </tr>
                        <tr>
                            <td>亚马逊</td>
                            <td>2017/05/25</td>
                            <td>----/--/--</td>
                            <td>1000</td>
                            <td>10%</td>
                            <td>1.2%</td>
                        </tr>
                        <tr>
                            <td>Facebook</td>
                            <td>2017/05/25</td>
                            <td>----/--/--</td>
                            <td>1000</td>
                            <td>10%</td>
                            <td>1.2%</td>
                        </tr>
                        <tr>
                            <td>IBM</td>
                            <td>2017/05/25</td>
                            <td>----/--/--</td>
                            <td>1000</td>
                            <td>10%</td>
                            <td>1.2%</td>
                        </tr>
                        <tr>
                            <td>三星</td>
                            <td>2017/05/25</td>
                            <td>----/--/--</td>
                            <td>1000</td>
                            <td>10%</td>
                            <td>1.2%</td>
                        </tr>
                        <tr>
                            <td>小米</td>
                            <td>2017/05/25</td>
                            <td>----/--/--</td>
                            <td>1000</td>
                            <td>10%</td>
                            <td>1.2%</td>
                        </tr>
                        <tr>
                            <td>华为</td>
                            <td>2017/05/25</td>
                            <td>----/--/--</td>
                            <td>1000</td>
                            <td>10%</td>
                            <td>1.2%</td>
                        </tr>
                        <tr>
                            <td>华为</td>
                            <td>2017/05/25</td>
                            <td>----/--/--</td>
                            <td>1000</td>
                            <td>10%</td>
                            <td>1.2%</td>
                        </tr>
                        <tr>
                            <td>华为</td>
                            <td>2017/05/25</td>
                            <td>----/--/--</td>
                            <td>1000</td>
                            <td>10%</td>
                            <td>1.2%</td>
                        </tr>
                        <tr>
                            <td>华为</td>
                            <td>2017/05/25</td>
                            <td>----/--/--</td>
                            <td>1000</td>
                            <td>10%</td>
                            <td>1.2%</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!--标签页下面的功能区部分-->
            <div class="function-content zixuangu-part disappear" id="zixuangu-part">
                <table class="table-hover table-responsive">
                    <thead>
                    <tr>
                        <th style="width: 30px;">序号</th>
                        <th style="width: 70px;">股票ID</th>
                        <th style="width: 70px;">股票名称</th>
                        <th style="width: 60px;">现价</th>
                        <th style="width: 70px;">涨跌幅</th>
                        <th style="width: 70px;">成交量</th>
                        <th style="width: 70px;">删除自选</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>1</td>
                        <td>
                            <a href="javascript:void(0);">000000</a>
                        </td>
                        <td>
                            <a href="javascript:void(0);">测试股</a>
                        </td>
                        <td>--</td>
                        <td>--</td>
                        <td>--</td>
                        <td>
                            <a href="javascript:void(0);" title="deleteButton">
                                <img src="../images/delete.png">
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>
                            <a href="javascript:void(0);">000001</a>
                        </td>
                        <td>
                            <a href="javascript:void(0);">测试股</a>
                        </td>
                        <td>--</td>
                        <td>--</td>
                        <td>--</td>
                        <td>
                            <a href="javascript:void(0);" title="deleteButton">
                                <img src="../images/delete.png">
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>
                            <a href="javascript:void(0);">000002</a>
                        </td>
                        <td>
                            <a href="javascript:void(0);">测试股</a>
                        </td>
                        <td>--</td>
                        <td>--</td>
                        <td>--</td>
                        <td>
                            <a href="javascript:void(0);" title="deleteButton">
                                <img src="../images/delete.png">
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>
                            <a href="javascript:void(0);">000003</a>
                        </td>
                        <td>
                            <a href="javascript:void(0);">测试股</a>
                        </td>
                        <td>--</td>
                        <td>--</td>
                        <td>--</td>
                        <td>
                            <a href="javascript:void(0);" title="deleteButton">
                                <img src="../images/delete.png">
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td>
                            <a href="javascript:void(0);">000004</a>
                        </td>
                        <td>
                            <a href="javascript:void(0);">测试股</a>
                        </td>
                        <td>--</td>
                        <td>--</td>
                        <td>--</td>
                        <td>
                            <a href="javascript:void(0);" title="deleteButton">
                                <img src="../images/delete.png">
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>6</td>
                        <td>
                            <a href="javascript:void(0);">000005</a>
                        </td>
                        <td>
                            <a href="javascript:void(0);">测试股</a>
                        </td>
                        <td>--</td>
                        <td>--</td>
                        <td>--</td>
                        <td>
                            <a href="javascript:void(0);" title="deleteButton">
                                <img src="../images/delete.png">
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>7</td>
                        <td>
                            <a href="javascript:void(0);">000006</a>
                        </td>
                        <td>
                            <a href="javascript:void(0);">测试股</a>
                        </td>
                        <td>--</td>
                        <td>--</td>
                        <td>--</td>
                        <td>
                            <a href="javascript:void(0);" title="deleteButton">
                                <img src="../images/delete.png">
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>8</td>
                        <td>
                            <a href="javascript:void(0);">000007</a>
                        </td>
                        <td>
                            <a href="javascript:void(0);">测试股</a>
                        </td>
                        <td>--</td>
                        <td>--</td>
                        <td>--</td>
                        <td>
                            <a href="javascript:void(0);" title="deleteButton">
                                <img src="../images/delete.png">
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>9</td>
                        <td>
                            <a href="javascript:void(0);">000008</a>
                        </td>
                        <td>
                            <a href="javascript:void(0);">测试股</a>
                        </td>
                        <td>--</td>
                        <td>--</td>
                        <td>--</td>
                        <td>
                            <a href="javascript:void(0);" title="deleteButton">
                                <img src="../images/delete.png">
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td>
                            <a href="javascript:void(0);">00000</a>
                        </td>
                        <td>
                            <a href="javascript:void(0);">测试股</a>
                        </td>
                        <td>--</td>
                        <td>--</td>
                        <td>--</td>
                        <td>
                            <a href="javascript:void(0);" title="deleteButton">
                                <img src="../images/delete.png">
                            </a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="function-content makestrategy-part disappear" id="makestrategy-part">
                <table class="table-hover table-responsive">
                    <thead>
                    <tr>
                        <th style="width: 60px;">序号</th>
                        <th style="width: 60px;">策略名称</th>
                        <th style="width: 100px;">开始时间</th>
                        <th style="width: 100px;">结束时间</th>
                        <th style="width: 90px;">股票池</th>
                        <th style="width: 90px;">策略基准</th>
                        <th style="width: 70px;">调仓周期(天)</th>
                        <th style="width: 90px;">最大持股数(支)</th>
                        <th style="width: 60px;">选股指标</th>
                        <th style="width: 60px;">删除策略</th>
                        <!--<th>序号</th>-->
                        <!--<th>策略名称</th>-->
                        <!--<th>开始时间</th>-->
                        <!--<th>结束时间</th>-->
                        <!--<th>股票池</th>-->
                        <!--<th>策略基准</th>-->
                        <!--<th>调仓周期(天)</th>-->
                        <!--<th>最大持股数(支)</th>-->
                        <!--<th>选股指标</th>-->
                        <!--<th>删除策略</th>-->
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>1</td>
                        <td>
                            <a>最挣钱的策略</a>
                        </td>
                        <td>2017-5-23</td>
                        <td>2017-5-23</td>
                        <td>全部股票</td>
                        <td>沪深300</td>
                        <td>5</td>
                        <td>10</td>
                        <td>
                            <a href="javascript:void(0);" title="展开">
                                <img src="../images/open.png">
                            </a>
                        </td>
                        <td>
                            <a href="javascript:void(0);" title="deleteButton">
                                <img src="../images/delete.png">
                            </a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="function-content usestrategy-part disappear" id="usestrategy-part">
                <table class="table-hover table-responsive">
                    <thead>
                    <tr>
                        <th style="width: 60px;">序号</th>
                        <th>策略名称</th>
                        <th style="width: 100px;">开始时间</th>
                        <th style="width: 100px;">结束时间</th>
                        <th style="width: 90px;">股票池</th>
                        <th>策略基准</th>
                        <th style="width: 70px;">调仓周期(天)</th>
                        <th>最大持股数(支)</th>
                        <th style="width: 60px;">删除策略</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>1</td>
                        <td>最挣钱的策略</td>
                        <td>2017-5-23</td>
                        <td>2017-5-23</td>
                        <td>全部股票</td>
                        <td>沪深300</td>
                        <td>5</td>
                        <td>10</td>
                        <td>
                            <a href="javascript:void(0);" title="展开">
                                <img src="../images/delete.png">
                            </a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="function-content history-part disappear" id="history-part">
                <table class="table-hover table-responsive">
                    <thead>
                    <tr>
                        <th>序号</th>
                        <th>股票ID</th>
                        <th>股票名称</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>1</td>
                        <td>
                            <a>000000</a>
                        </td>
                        <td>
                            <a>测试股</a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!--页脚start-->
<div class="footer">
    <div class="left-footer">
        <div>
            <h2>关于ProQuant</h2>
            <br>
            <p>ProQuant是一款基于提供股票市场情况展示，个股信息展示，股票各项指标预测功能于一体的多功能股票查询、
                <br>分析的软件。</p>
        </div>
    </div>
    <div class="right-footer">
        <div>
            <h2>关于我们</h2>
            <br>
            <p></p>
        </div>
        <div>
            <a href=""><img src="../images/weibo.png" alt="微博"></a>
            <a href=""><img src="../images/weixin.png" alt="微信"></a>
            <a href=""><img src="../images/qq.png" alt="QQ"></a>

        </div>
    </div>
</div>
<!--页脚end-->
<!--隐藏对话框：功能：当用户选择多只删除时弹出-->
<div id="attentionDialog" class="fadeIn">
    <h2>提示</h2>
    <h4>您确认删除已选中的多只股票吗？</h4>
    <div style="width: 50%;margin: 5px auto;">
        <input type="button" value="确认" id="confirm-button">
        <input type="button" value="取消" style="background-color: #8c8c8c" id="cancel-button">
    </div>
</div>
</body>
</html>


