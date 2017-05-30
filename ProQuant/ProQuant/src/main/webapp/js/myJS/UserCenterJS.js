/**
 * Created by xiezhenyu on 2017/5/17.
 */
//全局变量，选中的第一行，选中的最后一行
//rowChanged用来标识行是否变化过，来判断是最一开始还没进行行删除和增加操作还是已进行过这些操作的不同状态，之所以设置该标志，
//     是因为最一开始行上是没有类的，这时要添加新类，而进行过操作的行是有类的，这时要将原有的类替换为新的类（奇->偶/偶->奇）
//operationButtonWasClicked用来标识删除键或其他操作键是否被点击，以区分是在行上的点击事件还是在这些功能键上的点击,
//    该状态需要注意的是什么是否被置为false
var firstRowIndex, lastRowIndex, currentEle, mouseIsDown, dialogIsShow, rowChanged, operationButtonWasClicked;


$(function(){
    //为tab标签设置点击事件
    var tablist = ["#tab1", "#tab2", "#tab3", "#tab4"];
    var pagelist = ["#zixuangu-part", "#makestrategy-part", "#usestrategy-part", "#history-part"];
    function myRemoveOtherClass(tabName) {
        for(var i = 0;i < tablist.length;i++)
        {
            if(tabName != tablist[i])
            {
                $(tablist[i]).removeClass("active");
            }
        }
    }
    function showPage(pageName) {
        $(pageName).removeClass("disappear");
        for (var i = 0;i < pagelist.length;i++)
        {
            if(pagelist[i] != pageName)
            {
                $(pagelist[i]).addClass("disappear");
            }

        }
    }
    $("#tab1").click(function () {
        $(this).addClass("active");
        myRemoveOtherClass("#tab1");
        $("#zixuangu-part").removeClass("disappear");
        showPage("#zixuangu-part");
    });
    $("#tab2").click(function () {
        $(this).addClass("active");
        myRemoveOtherClass("#tab2");
        $("#makestrategy-part").removeClass("disappear");
        showPage("#makestrategy-part");
    });
    $("#tab3").click(function () {
        $(this).addClass("active");
        myRemoveOtherClass("#tab3");
        $("#usestrategy-part").removeClass("disappear");
        showPage("#usestrategy-part");
    });
    $("#tab4").click(function () {
        $(this).addClass("active");
        myRemoveOtherClass("#tab4");
        $("#history-part").removeClass("disappear");
        showPage("#history-part");
    });





    //实现提示框拖动的效果
    $("#attentionDialog")[0].onmousedown = fnDown;
    $("#confirm-button").click(function () {
        deleteManyEleOneTime();
    });
    $("#cancel-button").click(function () {
        $("#attentionDialog")[0].style.display = "none";
        deSelectTableRows(currentEle, firstRowIndex, lastRowIndex);
    })






    //为表格行添加样式
    addStyleToRow();






    //获取行的高度
    // var rowHeight = $("tr:first").height();
    // alert(rowHeight);
    //获取鼠标按下和弹起时各自的位置

    // $("tr").click(function () {
    //     alert("sadas");
    // });
    // $("table")[0].onmousedown = getY1;


    $("tr").mousedown(function () {
        mouseIsDown = true;
        firstRowIndex = $(this).index();
        if(!operationButtonWasClicked){
            // alert("here");
            selectThisRow($(this));
        }
    });
    $("tr").mouseup(function () {
        mouseIsDown = false;
        lastRowIndex = $(this).index();
        currentEle = $(this);
        if(!operationButtonWasClicked){
            selectRows(currentEle, firstRowIndex, lastRowIndex);
        }
    });
    $("tr").mouseover(function () {
        if(mouseIsDown){
            if(!operationButtonWasClicked){
                selectThisRow($(this));
            }
        }
    });

    //为所有不是行的地方设置监听事件，点击之后选中的行取消选中，如果提示框在就隐藏
    // deEffect();


    $("a[title=deleteButton]").mousedown(function () {
        $(this).parent().parent().remove();
        addStyleToRow();
        rowChanged = true;
        operationButtonWasClicked = true;
    })

});




//为表格行添加样式
function addStyleToRow() {
    var trLists = $("tbody").find("tr");
    for(var i = 0;i < trLists.length;i++){
        var index = trLists.eq(i).index();
        // if(index % 2 === 1){
        //    if(!rowChanged){
        //        trLists.eq(i).addClass("oddRowBg");
        //    }else{
        //        if(trLists.eq(i).hasClass("oddRowBg")){
        //            trLists.eq(i).removeClass("oddClass");
        //            trLists.eq(i).addClass("evenRowBg");
        //        }else if(trLists.eq(i).hasClass("evenRowBg")){
        //            trLists.eq(i).removeClass("evenRowBg");
        //            trLists.eq(i).addClass("oddRowBg");
        //        }
        //    }
        // }else{
        //     if(!rowChanged){
        //         trLists.eq(i).addClass("evenRowBg");
        //     }else{
        //         if(trLists.eq(i).hasClass("oddRowBg")){
        //             trLists.eq(i).removeClass("oddClass");
        //             trLists.eq(i).addClass("evenRowBg");
        //         }else if(trLists.eq(i).hasClass("evenRowBg")){
        //             trLists.eq(i).removeClass("evenRowBg");
        //             trLists.eq(i).addClass("oddRowBg");
        //         }
        //     }
        // }
        if(!rowChanged){
            if(index % 2 === 1){
                trLists.eq(i).addClass("oddRowBg");
            }else{
                trLists.eq(i).addClass("evenRowBg");
            }
        }else{
            if(trLists.eq(i).hasClass("oddRowBg")){
               trLists.eq(i).removeClass("oddClass");
               trLists.eq(i).addClass("evenRowBg");
            }else if(trLists.eq(i).hasClass("evenRowBg")){
               trLists.eq(i).removeClass("evenRowBg");
               trLists.eq(i).addClass("oddRowBg");
            }
        }
    }
}

function fnDown(event) {
    event = event || window.event;
    var oDrag = $("#attentionDialog").get(0),
        //光标按下时，光标距离面板左边的距离
        disX = event.clientX - oDrag.offsetLeft,
        //光标按下时，光标距离面板上边的距离
        disY = event.clientY - oDrag.offsetTop;
    //移动
    document.onmousemove = function (event) {
        event = event || window.event;
        fnMove(event, disX, disY);
    }
    //释放鼠标
    document.onmouseup = function () {
        document.onmousemove = null;
        //把本身时间也卸载掉
        document.onmouseup = null;
    }
}


function fnMove(e, posX, posY) {
    var oDrag = $("#attentionDialog").get(0),
        l = e.clientX - posX,
        t = e.clientY - posY,
        //获取浏览器窗口的宽度和高度
        winWidth = document.documentElement.clientWidth || document.body.clientWidth,
        winHeight = document.documentElement.clientHeight || document.body.clientHeight,
        //div.offsetWidth获取容器的宽度
        maxWidth = winWidth - oDrag.offsetWidth,
        maxHeight = winHeight - oDrag.offsetHeight;
    //最后确定容器位置的是left和top
    if(l < 0){
        l = 0;
    }else if(l > maxWidth){
        l = maxWidth;
    }
    if(t < 0){
        t = 0;
    }else if(t > maxHeight){
        t = maxHeight;
    }
    oDrag.style.left = l + 'px';
    oDrag.style.top = t + 'px';
}
// var Y1, Y2;
// function getY1(event) {
//     alert("getY1");
//     event = event || window.event;
//     Y1 = event.clientY;
// }
// function getY2(event) {
//     alert("getY2");
//     event = event || window.event;
//     Y2 = event.clientY;
//     document.write(Y1 + "<br>");
//     document.write(Y2 + "<br>");
//     document.write(Y2 - Y1);
// }

//功能：当两行的差距大于1时才显示提示框
function selectRows(ele, frIndex, lrIndex) {
    //要用父级元素获得全部的行，在选中其中的某些行
    // var tableRowList = ele[0].parentNode.rows;
    // for(var i = 0;i < tableRowList.length;i++){
    //     if((i >= frIndex)&&(i <= lrIndex)&&((lrIndex - frIndex)>1)){
    //         $(tableRowList[i]).addClass("selectedClass")
    //     }
    // }
    if((lrIndex - frIndex)>1){
        // setTimeout(showDialog, 200);
        showDialog();
    }else{
        ele.removeClass("selectedClass");
    }

    // showDialog();
}
function deSelectTableRows(ele, frIndex, lrIndex) {
    //要用父级元素获得全部的行，在选中其中的某些行
    var tableRowList = ele[0].parentNode.rows;
    for(var i = 0;i < tableRowList.length;i++){
        if((i >= frIndex)&&(i <= lrIndex)){
            $(tableRowList[i]).removeClass("selectedClass")
        }
    }
    //本来灰色的行的样式都已经给去掉了，现在再加回去
    addStyleToRow();

    hideDialog();
}

//该方法实现了单行即时选中效果
function selectThisRow(ele) {
    if(ele.hasClass("oddRowBg")||(ele.hasClass("evenRowBg"))){
        ele.removeClass("oddRowBg");
        ele.removeClass("evenRowBg");
    }
    ele.addClass("selectedClass");
}

function showDialog() {
    dialogIsShow = true;
    $("#attentionDialog").fadeIn();
}
function hideDialog() {
    dialogIsShow = false;
    $("#attentionDialog").fadeOut();
}


//为所有不是行的地方设置监听事件，点击之后选中的行取消选中，如果提示框在就隐藏
function deEffect() {
    $(":not(tr)").click(function () {
        alert($(this).nodeName);
        var trLists = $("tbody").find("tr");
        for(var i = 0;i < trLists.length;i++){
            if(trLists.eq(i).hasClass("selectedClass")){
                trLists.eq(i).removeClass("selectedClass")
            }
        }
        addStyleToRow();
        hideDialog();
    })

}

function deleteManyEleOneTime() {
    var trLists = $("tbody").find("tr");
    for(var i = 0;i < trLists.length;i++){
        if(trLists.eq(i).hasClass("selectedClass")){
            trLists.eq(i).remove();
        }
    }
    hideDialog();
}

