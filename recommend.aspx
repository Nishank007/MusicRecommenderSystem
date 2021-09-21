<%@ Page Language="VB" AutoEventWireup="false" CodeFile="recommend.aspx.vb" Inherits="recommend" %>

<%@ Register TagPrefix="uc1" TagName="header" Src="~/includes/header.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Songs</title>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <script type="text/javascript">

        var StyleFile = "theme" + document.cookie.charAt(6) + ".css";
        document.writeln('<link rel="stylesheet" type="text/css" href="css/' + StyleFile + '">');
        function email_onclick() {

        }


    </script>
    <style>
        /* The following styles are for the Rating */
        
        .ratingStar
        {
            font-size: 0pt;
            width: 13px;
            height: 12px;
            margin: 0px;
            padding: 0px;
            cursor: pointer;
            display: block;
            background-repeat: no-repeat;
        }
        
        .filledRatingStar
        {
            background-image: url(Images/FilledStar.png);
        }
        
        .emptyRatingStar
        {
            background-image: url(Images/EmptyStar.png);
        }
        
        .savedRatingStar
        {
            background-image: url(Images/SavedStar.png);
        }
        
        
        /******************************************/
    </style>
    <script type="text/javascript">


        function GridViewRowChecked(what) {

            var Ctl = new RegExp("ctl\\d+") // this regular expression will get the line nubmer with the ctl prefix 
            //which is put automatically by ASP.NET for GridViews and DataGrids ;
            var LineNumber = Ctl.exec(what.name).toString();


            //get the control names to operate on:
            var txtProduct = document.getElementById("GridView1_" + LineNumber + "_txtProduct");

            //set Product textbox to readonly or not accroding to the checkbox check: 		
            if (what.checked) {
                //in order to accomodate for IE and other browsers I set the readonly attribute in two ways: 
                txtProduct.setAttribute("readonly", "none");
                txtProduct.readOnly = false;
                //it's not worth it to use Ifs to determine which browser it is cuz it will only slow id down

            }
            else {
                txtProduct.setAttribute("readonly", "readonly");
                txtProduct.readOnly = true;
            }
        }
    
     
   
    </script>
    <!--[if IE]>
<link rel="stylesheet" type="text/css" href="css/ie-sucks.css" />
<![endif]-->
</head>
<body>
    <form id="form" method="post" runat="server">
    <uc1:header ID="header" runat="server"></uc1:header>
    <div id="container">
        <div class="shell">
            <!-- Small Nav -->
            <div class="small-nav">
                <div class="box-head">
                    <h2 class="left">
                        Songs</h2>
                    &nbsp;</div>
                <!-- Content -->
                <div id="content">
                    <!-- Box -->
                    <div class="box">
                        <!-- Box Head -->
                        <!--   <asp:ScriptManager ID="ScriptManager1" runat="server" />-->
                        <span>
                            <h2>
                                Using Euclidean Distance</h2>
                        </span>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:genetic_dbConnectionString %>"
                            SelectCommand="recommend_cat" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:QueryStringParameter DefaultValue="false" Name="flag" QueryStringField="flag"
                                    Type="String" />
                                <asp:QueryStringParameter DefaultValue="" Name="cat" QueryStringField="cat" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
                            AllowPaging="True" AllowSorting="True" Height="76px" DataKeyNames="song_id" Font-Bold="True">
                            <Columns>
                                <asp:BoundField DataField="song_id" HeaderText="song_id" SortExpression="song_id" />
                                <asp:BoundField DataField="Artist" HeaderText="Artist" SortExpression="Artist">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="20%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="25%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="20%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="UserCount" HeaderText="UserCount" SortExpression="UserCount">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Pitch" HeaderText="Pitch" SortExpression="Pitch" />
                                <asp:BoundField DataField="Tempo" HeaderText="Tempo" SortExpression="Tempo" />
                                <asp:BoundField DataField="Octav" HeaderText="Octav" SortExpression="Octav">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="20%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Root" HeaderText="Root" SortExpression="Root" />
                                <asp:BoundField DataField="Mode" HeaderText="Mode" SortExpression="Mode" />
                                <asp:HyperLinkField DataNavigateUrlFields="song_path" DataNavigateUrlFormatString=""
                                    Text="Listen" Target="_parent" HeaderImageUrl="~/css/images/sound-m.gif">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                                </asp:HyperLinkField>
                            </Columns>
                        </asp:GridView>
                        <br />
                        <br />
                        <span>
                            <h2>
                                Using Squared Euclidean distance</h2>
                                <br />
                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2"
                                AllowPaging="True" AllowSorting="True" Height="76px" DataKeyNames="song_id" Font-Bold="True">
                                <Columns>
                                    <asp:BoundField DataField="song_id" HeaderText="song_id" SortExpression="song_id" />
                                    <asp:BoundField DataField="Artist" HeaderText="Artist" SortExpression="Artist">
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="20%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title">
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="25%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category">
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="20%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="UserCount" HeaderText="UserCount" SortExpression="UserCount">
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Pitch" HeaderText="Pitch" SortExpression="Pitch" />
                                    <asp:BoundField DataField="Tempo" HeaderText="Tempo" SortExpression="Tempo" />
                                    <asp:BoundField DataField="Octav" HeaderText="Octav" SortExpression="Octav">
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="20%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Root" HeaderText="Root" SortExpression="Root" />
                                    <asp:BoundField DataField="Mode" HeaderText="Mode" SortExpression="Mode" />
                                    <asp:HyperLinkField DataNavigateUrlFields="song_path" DataNavigateUrlFormatString=""
                                        Text="Listen" Target="_parent" HeaderImageUrl="~/css/images/sound-m.gif">
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                                    </asp:HyperLinkField>
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:genetic_dbConnectionString %>"
                                SelectCommand="recommend_cat_new" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:QueryStringParameter DefaultValue="false" Name="flag" QueryStringField="flag"
                                        Type="String" />
                                    <asp:QueryStringParameter DefaultValue="" Name="cat" QueryStringField="cat" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </span>&nbsp;</div>
                    <!-- End Box -->
                </div>
                <!-- End Content -->
                <!-- Sidebar -->
                <!-- End Sidebar -->
                <div class="cl">
                    &nbsp;</div>
            </div>
        </div>
    </form>
</body>
</html>
