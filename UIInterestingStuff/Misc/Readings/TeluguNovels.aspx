﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="TeluguNovels.aspx.cs" Inherits="TeluguNovels" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="fb-root"></div>
    <script>
        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&appId=386874354670915&version=v2.0";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'))
    </script>

    <div class="bg-white text-shadow">
        <div class="container">
            <div class="row">
                <div class="span16">
                    <div class="tile-content">
                        <div class="panel no-border">
                            <div class="panel-header bg-blue fg-white text-center">Telugu Novels</div>


                            <!-- Kendo JavaScript -->
                            <script src="<%= ResolveUrl("~js/jszip.min.js")%>"></script>
                            <script src="<%= ResolveUrl("~js/kendo.all.min.js")%>"></script>
                            <script src="<%= ResolveUrl("~js/kendo.listview.min.js")%>"></script>

                            <div id="listView"></div>
                            <%--<div id="pager" class="k-pager-wrap"></div>--%>
                            <div id="pager"></div>

                            <script type="text/x-kendo-template" id="template">
<div class="product">
    <img src="../../../images/pdficon.jpg" onclick ="javascript:location.href='#=BookUrl#'"/>
    <h3>#:BookTitle#</h3>
</div>
                            </script>

                            <script type="text/JavaScript">
                                $(function () {
                                    $.ajax({
                                        type: "post",
                                        url: "TeluguNovels.aspx/GetBooklist",
                                        contentType: "application/json",
                                        dataType: "json",
                                        success: function (result) {
                                            var jsonResult = JSON.parse(result.d);
                                            var dataSource = new kendo.data.DataSource({
                                                data: jsonResult,
                                                pageSize: 20
                                            });

                                            $("#pager").kendoPager({
                                                dataSource: dataSource,
                                                pageSize: 2
                                            });
                                            $("#listView").kendoListView({
                                                dataSource: dataSource,
                                                //template: '<img src="#=ImgUrl#"/>'
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
                                    min-height: 900px;
                                }

                                .product {
                                    float: left;
                                    position: relative;
                                    width: 201px;
                                    height: 220px;
                                    margin: 0 10px;
                                    padding: 0;
                                }

                                    .product img {
                                        width: 120px;
                                        height: 120px;
                                    }

                                    .product h3 {
                                        margin: 10px;
                                        padding: 5px 8px 0 0;
                                        max-width: 200px;
                                        overflow: inherit;
                                        line-height: 2em;
                                        font-size: .65em;
                                        font-weight: normal;
                                        font-family: 'Segoe UI';
                                        font-style: italic;
                                        text-transform: fullsize-kana;
                                        color: deepskyblue;
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










                            <div class="grid no-margin">
                                <div class="row">

                                    <div class="span1 no-tablet-portrait no-phone">
                                        <div class="notice marker-on-right bg-white padding1 text-center" style="height: 1px">
                                        </div>
                                    </div>

                                    <div class="accordion with-marker span12  place-right   " data-role="accordion" data-closeany="false">
                                    </div>
                                </div>
                            </div>





                        </div>
                    </div>
                </div>
            </div>

            <div class="grid no-margin">
                <div class="row">

                    <div class="span1 no-tablet-portrait no-phone">
                        <div class="notice marker-on-right bg-white padding1 text-center" style="height: 1px">
                        </div>
                    </div>


                    <div class="accordion with-marker span12  place-right" data-role="accordion" data-closeany="false">

                        <div class="accordion-frame active ">

                            <div class="fb-save"
                                data-uri=""
                                data-size="large">
                            </div>
                            <div class="fb-like"
                                data-href=""
                                data-layout="standard"
                                data-action="like"
                                data-show-faces="false"
                                data-share="true"
                                data-size="large">
                            </div>

                            <div class="fb-comments"
                                data-href=""
                                data-numposts="5"
                                data-width="200px">
                            </div>



                            <script>(function (d, s, id) {
                                    var js, fjs = d.getElementsByTagName(s)[0];
                                    if (d.getElementById(id)) return;
                                    js = d.createElement(s); js.id = id;
                                    js.src = "https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v3.0";
                                    fjs.parentNode.insertBefore(js, fjs);
                                }(document, 'script', 'facebook-jssdk'));</script>



                        </div>
                    </div>




                </div>
            </div>
        </div>
    </div>
    <br />
</asp:Content>
