<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2018/9/29
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户管理系统</title>
    <jsp:include page="alluse/autoImport.jsp"/>
    <link type="text/css" rel="stylesheet" href="/koala-home/static/css/userManager.css"/>
    <link rel="stylesheet" href="/koala-home/static/thirdControl/jqgrid/css/ui.jqgrid.css"/>
    <link rel="stylesheet" href="/koala-home/static/thirdControl/jqgrid/css/css/flick/jquery-ui-1.8.16.custom.css"/>
    <script type="text/javascript" src="/koala-home/static/thirdControl/jquery/jquery-1.8.1.min.js"></script>
    <script type="text/javascript" src="/koala-home/static/thirdControl/jqgrid/js/jquery.jqGrid.src.js"></script>
    <script type="text/javascript" src="/koala-home/static/thirdControl/jqgrid/js/i18n/grid.locale-cn.js"></script>


    <script>
        var grid_selector = "#grid-table";
        var pager_selector = "#grid-pager";
        $(function () {
            $(grid_selector)
                    .jqGrid(
                            {
                                url: "http://127.0.0.1:8090/koala-home/user/getUserInfo",
                                mtype: 'post',
                                datatype: "json",
                                height: '600px',
                                colNames: ["id", "用户名", '真实名', '电话', '邮箱', '性别', '年龄', '注册时间', '最近修改时间', '最近登陆时间', '是否是管理员'],
                                colModel: [
                                    {
                                        name: 'userId',
                                        index: 'userId',
                                        width: '0px',
                                        heigth: '50px',
                                        sortable: false,
                                        key: true,
                                        hidden: true
                                    },
                                    {
                                        name: 'userName',
                                        index: 'userName',
                                        width: '10%',
                                        heigth: '50px',
                                        sortable: false,
                                        formatter: editLink
                                    },
                                    {
                                        name: 'userTrueName',
                                        index: 'userTrueName',
                                        width: '8%',
                                        sortable: false,
                                    },
                                    {
                                        name: 'userPhone',
                                        index: 'userPhone',
                                        width: '8%',
                                        sortable: false
                                    },
                                    {
                                        name: 'userEmail',
                                        index: 'userEmail',
                                        width: '10%',
                                        sortable: false
                                    },
                                    {
                                        name: 'userSex',
                                        index: 'userSex',
                                        width: '4%',
                                        sortable: false
                                    },
                                    {
                                        name: 'userAge',
                                        index: 'userAge',
                                        width: '4%',
                                        sortable: false
                                    },
                                    {
                                        name: 'regTime',
                                        index: 'regTime',
                                        width: '10%',
                                        sortable: false,
                                        formatter: "date",
                                        formatoptions: {srcformat: 'u/1000', newformat: 'Y-m-d'}
                                    },
                                    {
                                        name: 'lastUpdateTime',
                                        index: 'lastUpdateTime',
                                        width: '10%',
                                        sortable: false
                                    },
                                    {
                                        name: 'lastLoginTime',
                                        index: 'lastLoginTime',
                                        width: '10%',
                                        sortable: false
                                    },
                                    {
                                        name: 'adminId',
                                        index: 'adminId',
                                        width: '5%',
                                        sortable: false,
                                        cellattr: addCellAttr
                                    }
                                ],
                                viewrecords: true,//定义是否要显示总记录数
                                loadui: "enable",
                                loadonce: true,//不配置始终只显示页面显示的数据，无法显示隐藏的后面的数据，导致无法翻页
                                multiselect: true,//不配置不会显示复选框
                                //multiboxonly: true,
                                //viewrecords: true,
                                rowNum: 10,
                                rowList: [5, 10, 20],
                                //pgbuttons: true,
                                pager: pager_selector,
                                // pagerpos: "left",
                                //altRows: true,
                                rownumbers: true,
                                rownumWidth: 50,
                                //editurl: "", //nothing is saved
                                caption: "",
                                autowidth: true,
                                beforeSelectRow: function (rowid, e) {
                                    var $myGrid = $(this);
                                    var i = $.jgrid.getCellIndex($(e.target).closest('td')[0]);
                                    var cm = $myGrid.jqGrid('getGridParam', 'colModel');
                                    // cb列为复选框（multiselect : true时生效）, 复选框列和no列不屏蔽单击选中行事件，其他列屏蔽单击事件
                                    //return (cm[i].name === 'qlrmc' || cm[i].name === "qlrzjh");
                                    return (cm[i].name === 'cb');
                                }

                                ,
                                //beforeSelectRow: function(rowid, e) { return true; },
                                onSelectRow: function (id) {
                                    if (id) {
                                        //window.open();
                                    }
                                }
                            });
            $(grid_selector).jqGrid('navGrid', pager_selector, {edit: false, add: false, del: false});
        });
        function formatTime(cellvalue) {
            if (cellvalue) {
                return new Date(cellvalue).toLocaleString().replace(/\/|年|月/g, "-").replace(/日/g, " ").replace(/下午|上午/g, "");
            } else {
                return '';
            }
        }

        function editLink(cellValue, options, rowdata, action) {
            var str = rowdata.userId;
            return "<a href=# onclick=seeCorrectUser('" + str + "')>" + rowdata.userName + "</a>";
        }
        function addCellAttr(rowId, val, rawObject, cm, rdata) {
            return "style='color:orange'"
        }

        function muldelete() {
            var ids = $(grid_selector).jqGrid('getGridParam', 'selarrrow');
            var qlrids = ids.toString();
            /*var rowDatas = $(grid_selector).jqGrid("getRowData",ids);//根据上面的id获得本行的所有数据
             var qlrids= rowDatas.qlrid;*/
            $.ajax({
                type: 'post',
                //dataType:'json',
                //contentType : "application/json",
                url: "http://localhost:8090/ssm-test/qlr/deleteQlr",
                data: {qlrids: qlrids},
                traditional: true,
                beforeSend: function () {//ajax处理之前出现spin图标
                    //异步请求时spinner出现
                    //$("#load-text")
                    var target = $("#load-text").get(0);
                    target.innerHTML = "loading...";
                    target.hidden = false;
                    target.style.zIndex = 1;
                    var parent = target.parentElement;
                    parent.style.zIndex = -1;
                    //spinner.spin(target);//显示loading图标*/
                },
                success: function (data0) {
                    alert("删除成功！");
                    refreshtable();
                    setTimeout(function () {//ajax请求成功0.3秒以后，关闭loading图标
                        //ajax处理之后，关闭spinner
                        var target = $("#load-text").get(0);

                        target.innerHTML = "";
                        target.hidden = true;
                    }, 300);

                }
            })
        }
        function refreshtable() {
            $("#grid-table").trigger("reloadGrid");
        }
        function queryUser() {
            var userName = $("#user-name").val();
            var data = {userName: userName};
            $("#grid-table").setGridParam({
                url: "http://127.0.0.1:8090/koala-home/user/getUserInfo",
                datatype: 'json',
                page: 1,
                postData: data
            });
            $("#grid-table").trigger("reloadGrid");
        }
        function openaddqlr() {
            var url = "/ssm-test/view/addqlr.ftl";
            window.open(url, window, "dialogWidth:700px;status:no;dialogHeight:400px");
        }
        function seeCorrectUser(str) {
            //var dqqlrid = qlrid.toString();
            var url = '/koala-home/user/getUserInfo?userId' + str;
            window.open(url, window, "dialogWidth:700px;status:no;dialogHeight:400px");
        }
    </script>
</head>
<body>
<div id="select-area">
    <form role="form" class="form-inline">
        <div class="form-group">
            <label for="user-name">用户名：</label>
            <input class="form-control" id="user-name">
        </div>
    </form>
    <div class="btn-group">
        <button class="btn btn-default" onclick="queryUser()">查询</button>
        <button class="btn btn-default" type="reset">重置</button>
    </div>
</div>
<table id="grid-table"></table>
<div id="grid-pager"></div>
</body>
</html>
