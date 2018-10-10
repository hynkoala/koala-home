<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2018/10/9
  Time: 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        .ui-jqgrid .ui-jqgrid-htable th {
            height: 25px;
        }

        .ui-jqgrid .ui-jqgrid-view .ui-jqgrid-bdiv .ui-jqgrid-btable tr {
            height: 25px;
        }

        #out-box {
            width: 1024px;
            margin: 0 auto;
            margin-top: 20px;
        }

        table {
            border: 1px solid black;
            text-align: center;
        }

        /*.ui-state-default ui-jqgrid-hdiv .ui-jqgrid-labels{
            height: 30px;
        }*/
        tr {
            border: 0.2px solid darkgray;
            height: 20px;
        }

        td {
            border: 0.2px solid darkgray;
        }

        a {
            color: black;
            /*position:absolute;*/
            cursor: default;
            text-decoration: none;
        }

        a:link {
            color: black;
        }

          /* 未被访问的链接 蓝色 */
        a:visited {
            color: black;
        }

          /* 已被访问过的链接 蓝色 */
        a:hover {
            color: black;
        }

          /* 鼠标悬浮在上的链接 蓝色 */
        a:active {
            color: black;
        }

        .table-title {
            font-family: "Adobe 黑体 Std R";
            text-align: center;
            font-size: 18px;
            font-weight: bold;
        }

        /* 鼠标点中激活链接 蓝色 */
    </style>
    <script type="text/javascript" src="/koala-home/static/thirdControl/jquery/jQuery.js"></script>
    <script type="text/javascript" src="/koala-home/static/thirdControl/jqgrid/js/jquery.jqGrid.src.js"></script>
    <script type="text/javascript" src="/koala-home/static/thirdControl/jqgrid/js/i18n/grid.locale-cn.js"></script>
    <script>
        var winData = window.opener;
        var printData = winData.select_users;
        var grid_selector = "#grid-table";
        var pager_selector = "#grid-pager";
        $(function () {
            $(grid_selector)
                    .jqGrid(
                            {
                                mtype: 'post',
                                datatype: "json",
                                height: '20px',
                                colNames: ["id", "用户名", '真实名', '电话', '邮箱', '性别', '年龄', '注册时间', '最近修改时间', '最近登陆时间', '管理员'],
                                colModel: [
                                    {
                                        name: 'userId',
                                        index: 'userId',
                                        width: '0px',
                                        heigth: '30px',
                                        sortable: false,
                                        key: true,
                                        hidden: true
                                    },
                                    {
                                        name: 'userName',
                                        index: 'userName',
                                        width: '10%',
                                        heigth: '30px',
                                        sortable: false,
                                        //formatter: editLink
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
                                        width: '15%',
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
                                        //formatoptions: {srcformat: 'u/1000', newformat: 'Y-m-d'}
                                    },
                                    {
                                        name: 'lastUpdateTime',
                                        index: 'lastUpdateTime',
                                        width: '10%',
                                        sortable: false,
                                        formatter: "date",
                                        //formatoptions: {srcformat: 'u/1000', newformat: 'Y-m-d'}
                                    },
                                    {
                                        name: 'lastLoginTime',
                                        index: 'lastLoginTime',
                                        width: '10%',
                                        sortable: false,
                                        formatter: "date",
                                        //formatoptions: {srcformat: 'u/1000', newformat: 'Y-m-d'}
                                    },
                                    {
                                        name: 'adminId',
                                        index: 'adminId',
                                        width: '5%',
                                        sortable: false,
                                        //cellattr: addCellAttr
                                    }
                                ],
                                viewrecords: false,//定义是否要显示总记录数
                                //loadui: "enable",
                                loadonce: true,//不配置始终只显示页面显示的数据，无法显示隐藏的后面的数据，导致无法翻页
                                multiselect: false,//不配置不会显示复选框
                                //multiboxonly: true,
                                //viewrecords: true,
                                rowNum: -1,
                                //rowList: [5, 10, 20],
                                //pgbuttons: true,
                                //pager: pager_selector,
                                // pagerpos: "left",
                                //altRows: true,
                                rownumbers: true,
                                rownumWidth: 50,
                                //editurl: "", //nothing is saved
                                //caption: "",
                                autowidth: true,
                                autoheight: false
                            });
            if (printData != null && printData != 'undefined') {
                for (i = 0; i < printData.length; i++) {
                    data = printData[i];
                    $(grid_selector).jqGrid("addRowData", i + 1, data);
                }
            }
        });
    </script>
</head>
<body>
<div id="out-box">
    <div class="table-title">用户信息查询</div>
    <table id="grid-table"></table>
</div>
<%--<div id="grid-pager"></div>--%>
</body>
</html>
