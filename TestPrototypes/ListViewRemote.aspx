﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ListViewRemote.aspx.cs" Inherits="TestPrototypes_ListViewRemote" %>

<asp:Content ContentPlaceHolderID ="ContentPlaceHolder1" runat ="server">

     <div id="listView"></div>
     <div id="pager" class="k-pager-wrap"></div>
    
   
    <script type="text/x-kendo-template" id="template">
        <div class="product">
            <img src="#=DownloadUrl#"/>
        </div>
    </script>


    <script type="text/JavaScript">
        $(function () {
            $.ajax({
                type: "post",
                url: "ListViewRemote.aspx/GetPlaylist",
                contentType: "application/json",
                dataType: "json",
                success: function (result) {
                    var jsonResult = JSON.parse(result.d).BScores;
                    var jstring = JSON.stringify(jsonResult);

                    var dataSource = new kendo.data.DataSource({
                        data: jsonResult,
                        pageSize:20
                    });

                    $("#pager").kendoPager({
                        dataSource: dataSource
                    });
                    $("#listView").kendoListView({
                        dataSource: dataSource,
                       //template: '<img src="#=DownloadUrl#"/>'
                         template: kendo.template($("#template").html())
                    });
                }
            });
        });

</script>


   
    <style>
        #listView {
            padding: 10px 5px;
            margin-bottom: -1px;
            min-height: 510px;
        }
        .product {
            float: left;
            position: relative;
            width: 201px;
            height: 170px;
            margin: 0 5px;
            padding: 0;
        }
        .product img {
            width: 200px;
            height: 200px;
        }
        .product h3 {
            margin: 0;
            padding: 3px 5px 0 0;
            max-width: 96px;
            overflow: hidden;
            line-height: 1.1em;
            font-size: .9em;
            font-weight: normal;
            text-transform: uppercase;
            color: #999;
        }
        .product p {
            visibility: hidden;
        }
        .product:hover p {
            visibility: visible;
            position: absolute;
            width: 110px;
            height: 110px;
            top: 0;
            margin: 0;
            padding: 0;
            line-height: 110px;
            vertical-align: middle;
            text-align: center;
            color: #fff;
            background-color: rgba(0,0,0,0.75);
            transition: background .2s linear, color .2s linear;
            -moz-transition: background .2s linear, color .2s linear;
            -webkit-transition: background .2s linear, color .2s linear;
            -o-transition: background .2s linear, color .2s linear;
        }
        .k-listview:after {
            content: ".";
            display: block;
            height: 0;
            clear: both;
            visibility: hidden;
        }
    </style>

</asp:Content>

