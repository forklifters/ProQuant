<%@ page import="VO.StockVO" %><%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 2017/6/6
  Time: 10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个股信息</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/stockInfo.css">
    <link rel="stylesheet" href="../css/myCSS/DialogCSS.css">
    <script src="../js/jquery-3.2.1.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/header.js"></script>
    <script src="../js/echarts.min.js"></script>
</head>
<body>
<!--导航栏start-->


<nav class="navbar navbar-default navbar-fixed-top" style="background-color: #407FCE;height: 51px">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">ProQuant</a>
        </div>
        <ul id="navigation" class="nav navbar-nav">
            <li><a href="#">首页</a></li>
            <li class="active"><a href="#">大盘</a></li>
            <li><a href="#">个股</a></li>
            <li><a href="#">策略</a></li>
            <li><a href="#">论坛</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li id="searchText">
                <input id="searchInput" type="text" placeholder="搜索">
                <button style="background-color: transparent;color: #1F4374;"><i class="fa fa-search" aria-hidden="true"></i></button>
            </li>
            <li><button id="loginButton"><i class="fa fa-user-circle" aria-hidden="true"></i>未登录</button></li>
            <li>
                <div class="dropdown" id="skin">
                    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" style="background-color: transparent;border: none">
                        <img src="../images/skin.png">
                    </button>
                    <ul class="dropdown-menu dropdown-menu-right">
                        <li><button style="background-color: #292C31"><span>酷炫黑<i class="fa fa-check-circle" style="color: #B82525" aria-hidden="true"></i></span></button></li>
                        <li><button style="background-color: #90C5E7"><span>淡蓝</span></button></li>
                        <li><button style="background-color: #601F00"><span>棕色</span></button></li>
                        <li><button style="background-color: #48A564"><span>清新绿</span></button></li>
                        <li><button style="background-color: #ECC180"><span>土豪金</span></button></li>
                        <li><button style="background-color: #EF99BC"><span>可爱粉</span></button></li>
                    </ul>
                </div>
            </li>
        </ul>
    </div>
</nav>
<!--导航栏end-->

<%
    StockVO stockVO =(StockVO) session.getAttribute("StockVO");
%>

<!--个股信息start-->
<div id="stockInfo">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-2" style="margin-top: 100px;padding-left: 100px">
                <div class="headLabel" style="margin-right: -100px"><p>最近访问</p></div>
                <div class="whiteBackground" style="margin-right: -100px;padding-bottom: 10px">
                    <table class="table browseTable" style="margin-bottom: 10px">
                        <thead>
                        <tr>
                            <th>股票名称</th>
                            <th>最新价</th>
                            <th>涨跌幅(%)</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><a>华联超综</a></td>
                            <td>6.55</td>
                            <td>10.08</td>
                        </tr>
                        <tr>
                            <td><a>上海九百</a></td>
                            <td>12.60</td>
                            <td>10.04</td>
                        </tr>
                        <tr>
                            <td><a>青海华鼎</a></td>
                            <td>9.66</td>
                            <td>10.02</td>
                        </tr>
                        <tr>
                            <td><a>晶瑞股份</a></td>
                            <td>14.60</td>
                            <td>10.02</td>
                        </tr>
                        <tr>
                            <td><a>展鹏科技</a></td>
                            <td>26.04</td>
                            <td>10.01</td>
                        </tr>
                        <tr>
                            <td><a>杭州解百</a></td>
                            <td>9.34</td>
                            <td>10.01</td>
                        </tr>
                        <tr>
                            <td><a>顶点软件</a></td>
                            <td>44.18</td>
                            <td>10.01</td>
                        </tr>
                        <tr>
                            <td><a>正海生物</a></td>
                            <td>39.81</td>
                            <td>10.00</td>
                        </tr>
                        <tr>
                            <td><a>中兴商业</a></td>
                            <td>11.90</td>
                            <td>5.40</td>
                        </tr>
                        <tr>
                            <td><a>徐家汇</a></td>
                            <td>13.06</td>
                            <td>5.15</td>
                        </tr>
                        </tbody>
                    </table>
                    <div style="text-align: center"><button id="deleteBrowseButton">清空浏览记录</button></div>
                </div>
            </div>
            <div class="col-sm-8" style="padding: 100px">
                <!--股票基本信息start-->
                <div id="basicInfo" style="margin-bottom: 40px">
                    <div class="headLabel"><p>个股信息</p></div>
                    <div id="info">
                        <div class="row">
                            <!--股票名称 代码 加入自选股-->
                            <div class="infoName col-sm-3">
                                <div>
                                    <div id="stockName"><%=stockVO.getName()%></div>
                                    <div style="font-size: 20px;margin-top: 10px;margin-bottom: 20px;color: #333333">
                                        300649
                                    </div>
                                    <a id="stockAddButton" href="#"><i class="fa fa-plus"
                                                                       aria-hidden="true"></i>加入自选股</a>
                                </div>
                            </div>
                            <!--股票当前价格 增幅-->
                            <div class="infoPrice col-sm-3">
                                <div style="text-align: center">
                                    <div style="margin-top: 30px;margin-bottom: 5px">
                                        <span id="stockPrice">25.38</span>
                                        <img src="../images/rise.svg" style="margin-top: -15px">
                                    </div>
                                    <div style="margin-bottom: 15px">
                                        <span class="addPrice">+2.31</span>
                                        <span class="addPrice">(</span>
                                        <span class="addPrice">10.01</span>
                                        <span class="addPrice">%)</span>
                                    </div>
                                    <div><button id="buyButton"><img src="../images/buy.svg">买入</button></div>
                                </div>
                            </div>
                            <!--股票数据 开盘价 收盘价等-->
                            <div class="infoData col-sm-6">
                                <ul>
                                    <li class="stockData">今开：<span>25.38</span></li>
                                    <li class="stockData">成交量：<span>6800.00</span></li>
                                    <li class="stockData">振幅：<span>0.00%</span></li>
                                    <li class="stockData">最高：<span>25.38</span></li>
                                    <li class="stockData">成交额：<span>17.26万</span></li>
                                    <li class="stockData">换手：<span>0.04%</span></li>
                                    <li class="stockData">最低：<span>25.38</span></li>
                                    <li class="stockData">总市值：<span>16.24亿</span></li>
                                    <li class="stockData">市净率：<span>5.56</span></li>
                                    <li class="stockData">昨收：<span>23.07</span></li>
                                    <li class="stockData">流通市值：<span>4.06亿</span></li>
                                    <li class="stockData">市盈率(动)：<span>74.17</span></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!--股票基本信息end-->

                <!--k线图start-->
                <div style="margin-bottom: 40px">
                    <div class="headLabel"><p>股票k线</p></div>
                    <div id="kLine">
                        <div>
                            <ul>
                                <li id="time"><a>分时</a></li>
                                <li id="dayLine" class="blueBackground"><a>日K</a></li>
                                <li id="weekLine"><a>周K</a></li>
                                <li id="monthLine"><a>月K</a></li>
                            </ul>
                        </div>
                        <!--k线图容器-->
                        <div>
                            <div id="main" style="height: 700px"></div>
                        </div>
                    </div>
                </div>
                <!--k线图end-->

                <!--综合分析start-->
                <div style="margin-bottom: 40px;margin-top: 190px">
                    <div class="headLabel"><p>综合分析</p></div>
                    <div id="analysis" style="background-color: white">
                        <div class="row">
                            <div class="col-sm-6">
                                <div id="meter" style="height: 400px"></div>
                                <div align="center" style="margin-top: -60px;font-size: 25px">综合评分</div>
                            </div>
                            <div class="col-sm-6">
                                <div id="radar" style="height: 400px;"></div>
                                <div align="center" style="margin-top: -60px;font-size: 25px">分项得分</div>
                            </div>
                        </div>
                        <div align="center" style="font-size: 22px;margin-top: 10px">综合评判：<span id="score">5.5分</span></div>
                        <div align="center" style="font-size: 22px;padding-bottom: 20px">打败了<span>68%</span>的股票!</div>
                    </div>

                </div>
                <!--综合分析end-->

                <!--股票详细数据start-->
                <div style="margin-bottom: 40px">
                    <div class="headLabel"><p>详细数据</p></div>
                    <div id="historyData" style="background-color: white">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>日期</th>
                                <th>开盘价</th>
                                <th>收盘价</th>
                                <th>最高价</th>
                                <th>最低价</th>
                                <th>成交量</th>
                                <th>换手率</th>
                                <th>市盈率</th>
                                <th>市净率</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>yyyy-mm-dd</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                            </tr>
                            <tr>
                                <td>yyyy-mm-dd</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                            </tr>
                            <tr>
                                <td>yyyy-mm-dd</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                            </tr>
                            <tr>
                                <td>yyyy-mm-dd</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                            </tr>
                            <tr>
                                <td>yyyy-mm-dd</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                            </tr>
                            <tr>
                                <td>yyyy-mm-dd</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                            </tr>
                            <tr>
                                <td>yyyy-mm-dd</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                            </tr>
                            <tr>
                                <td>yyyy-mm-dd</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                            </tr>
                            <tr>
                                <td>yyyy-mm-dd</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                            </tr>
                            <tr>
                                <td>yyyy-mm-dd</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                            </tr>
                            <tr>
                                <td>yyyy-mm-dd</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                            </tr>
                            <tr>
                                <td>yyyy-mm-dd</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                            </tr>
                            <tr>
                                <td>yyyy-mm-dd</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                            </tr>
                            <tr>
                                <td>yyyy-mm-dd</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                            </tr>
                            <tr>
                                <td>yyyy-mm-dd</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                            </tr>
                            <tr>
                                <td>yyyy-mm-dd</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                            </tr>
                            </tbody>
                        </table>
                        <div style="text-align: center">
                            <ul class="pagination">
                                <li><a href="#">&laquo;</a></li>
                                <li><a href="#" class="active">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">&raquo;</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!--股票详细数据end-->
            </div>
            <div class="col-sm-2" style="margin-top: 100px;margin-left: -100px">
                <!--公司简介-->
                <div class="headLabel"><p>公司简介</p></div>
                <div style="background-color: white;padding: 10px">
                    <div>
                        <p><span class="companyIntro">公司名称：</span>杭州园林设计院股份有限公司</p>
                    </div>
                    <br>
                    <div>
                        <p><span class="companyIntro">英文名称：</span>Hangzhou Landscape Architecture Design Institute Co., Ltd.</p>
                    </div>
                    <br>
                    <div>
                        <p><span class="companyIntro">所属行业：</span>建筑材料 — 建筑装饰</p>
                    </div>
                    <br>
                    <div>
                        <p><span class="companyIntro">公司网址：</span><a href="http://www.hzyly.com" style="cursor: hand">www.hzyly.com</a></p>
                    </div>
                    <br>
                    <div>
                        <p><span class="companyIntro">办公地址：</span>浙江省杭州市西湖区杨公堤32号</p>
                    </div>
                    <br>
                    <br>
                    <div>
                        <p><span class="companyIntro">业务：</span>从事风景园林设计行业。</p>
                    </div>
                    <br>
                    <div>
                        <p><span class="companyIntro">简介：</span>2001年11月13日,公司前身杭州园林设计院有限公司成立。 2011年2月12日,公司名称由杭州园林设计院有限公司变更为杭州园林设计院股份有限公司。</p>
                    </div>
                    <br>
                    <div>
                        <p><span class="companyIntro"></span></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--个股信息end-->

<!--登录弹出框start-->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="model-content">
            <div class="cont_principal">
                <div class="cont_centrar">
                    <div class="cont_login">
                        <form action="">
                            <div class="cont_tabs_login">
                                <ul class='ul_tabs'>
                                    <li class="active"><a href="#" onclick="sign_in()">SIGN IN</a>
                                        <span class="linea_bajo_nom"></span>
                                    </li>
                                    <li><a href="#up" onclick="sign_up()">SIGN UP</a><span class="linea_bajo_nom"></span>
                                    </li>
                                </ul>
                            </div>
                            <div class="cont_text_inputs">
                                <input type="text" class="input_form_sign " placeholder="NAME" name="name_us" />
                                <input type="text" class="input_form_sign d_block active_inp" placeholder="EMAIL" name="emauil_us" />
                                <input type="password" class="input_form_sign d_block  active_inp" placeholder="PASSWORD" name="pass_us" />
                                <input type="password" class="input_form_sign" placeholder="CONFIRM PASSWORD" name="conf_pass_us" />
                                <a href="#" class="link_forgot_pass d_block" >Forgot Password ?</a>
                                <div class="terms_and_cons d_none">
                                    <div><input type="checkbox" name="terms_and_cons" /> <label>Accept  Terms and Conditions.</label></div>
                                </div>
                            </div>
                            <div class="cont_btn">
                                <button class="btn_sign">SIGN IN</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--登录弹出框end-->

<!--滑动提示框start-->
<div id="toaster_close">
    <div id="toaster">
        <div id="pic_div" class="green_pic"></div>
        <div id="remind" class="green_word">提示消息</div>
    </div>
</div>
<!--滑动提示框end-->


<div style="margin-bottom: 50px;" class="buy-page-holder disappear">
    <div class="top-triangle"><!--本Div只来实现三角形，无其他作用--></div>
    <div style="overflow: hidden;display: inline-block;padding: 10px">

        <div style="overflow: hidden">
            <div style="padding-top:7px;border: 1.5px solid #dddddd;border-radius: 2px;color: #333;height: 40px;display: inline-block;text-align: center;float: left;width: 200px">
                <span style="margin-left: 10px;padding-right: 10px;font-size: 18px;">数 量</span>
                <img src="../images/line.svg">
                <span style="margin-right: 30px;font-size: 18px;">2100</span>
            </div>
            <div style="display: inline-block;">
                <button class="addPriceButton">
                    <img src="../images/reducePrice.svg">
                    <span style="font-size: 10px;color: #3999ff">100</span>
                </button>
            </div>
            <div style="display: inline-block;">
                <button class="addPriceButton">
                    <img src="../images/addPrice.svg">
                    <span style="font-size: 10px;color:#3999ff">100</span>
                </button>
            </div>
        </div>
        <!--<div style="padding: 0">-->

        <!--</div>-->
        <div style="margin-top: 5px">
            <span style="font-size: 12px;margin-bottom: 5px;margin-right: 20px">最大数量：<span style="color: #3999FF;">41,839</span></span>
            <span style="font-size: 12px;margin-bottom: 5px">可用资金：<span style="color: #3999FF;">￥1,954,061</span></span>
        </div>
        <div>
            <button style="float: right" id="buyConfirmButton">确认</button>
        </div>

    </div>
</div>


<script type="text/javascript" src="../charts/kLineChart.js"></script>
<script type="text/javascript" src="../charts/meterChart.js"></script>
<script type="text/javascript" src="../charts/radarChart.js"></script>
<script type="text/javascript" src="../js/myJS/DialogJS.js"></script>
<script type="text/javascript" src="../js/stockInfo.js"></script>
</body>
</html>
