<%@ Page Language="VB" CodeFile="Songs.aspx.vb" Inherits="Songs" AutoEventWireup="False" %>

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
        /* The following styles are for the Rating */.ratingStar
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
        /******************************************/</style>

    <script type="text/javascript">
    
  
    function GridViewRowChecked(what)
    {
           
		    var Ctl = new RegExp("ctl\\d+") // this regular expression will get the line nubmer with the ctl prefix 
		    //which is put automatically by ASP.NET for GridViews and DataGrids ;
		    var LineNumber = Ctl.exec(what.name).toString();
    		    
    				
		    //get the control names to operate on:
		   var txtProduct = document.getElementById( "GridView1_" + LineNumber + "_txtProduct");
    		
    		//set Product textbox to readonly or not accroding to the checkbox check: 		
		    if (what.checked)
		    {
		        //in order to accomodate for IE and other browsers I set the readonly attribute in two ways: 
		        txtProduct.setAttribute("readonly", "none");
		        txtProduct.readOnly = false;
		        //it's not worth it to use Ifs to determine which browser it is cuz it will only slow id down
		        
		     }
		    else
		    {
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
                        <asp:ScriptManager ID="ScriptManager1" runat="server" />
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
                            AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" Height="30px"
                            DataKeyNames="song_id" Font-Bold="True">
                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" Height="25px" />
                            <Columns>
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
                                <asp:TemplateField ItemStyle-Width="25%" HeaderText="Give Ratings">
                                    <ItemTemplate>
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                                <cc1:Rating ID="Rating1" runat="server" FilledStarCssClass="filledRatingStar" EmptyStarCssClass="emptyRatingStar"
                                                    StarCssClass="ratingStar" WaitingStarCssClass="savedRatingStar" AutoPostBack="False"
                                                    OnChanged="Rating1_Changed">
                                                </cc1:Rating>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </ItemTemplate>
                                    <ItemStyle Width="10%" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="25%" HeaderText="Overall Ratings">
                                    <ItemTemplate>
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                            <ContentTemplate>
                                                <cc1:Rating ID="Rating2" runat="server" FilledStarCssClass="filledRatingStar" EmptyStarCssClass="emptyRatingStar"
                                                    StarCssClass="ratingStar" WaitingStarCssClass="savedRatingStar" AutoPostBack="False"
                                                    CurrentRating='<%# Bind("Rating") %>' Enabled="False" EnableTheming="False" ReadOnly="True">
                                                </cc1:Rating>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </ItemTemplate>
                                    <ItemStyle Width="10%" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                </asp:TemplateField>
                                <asp:HyperLinkField DataNavigateUrlFields="song_path" DataNavigateUrlFormatString=""
                                    Text="Listen" Target="_blank" HeaderImageUrl="~/css/images/sound-m.gif">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                                </asp:HyperLinkField>
                            </Columns>
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:genetic_dbConnectionString %>"
                            SelectCommand="SELECT [song_id], [Artist], [Title], [Category], [Tempo], [Pitch], [Octav], [Root], [Mode], [UserCount], [Rating], [song_path] FROM [Songs] ">
                        </asp:SqlDataSource>
                        <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="button" Height="44px"
                            Width="135px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" CssClass="checkbox"
                            Text="Category Wise"  Font-Bold="True" 
                            Font-Size="Medium" ForeColor="Maroon" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                        <asp:DropDownList ID="ddlcategory" runat="server" Enabled="False" CssClass="field">
                            <asp:ListItem>Select Category</asp:ListItem>
                            <asp:ListItem>Romantic</asp:ListItem>
                            <asp:ListItem>Sad</asp:ListItem>
                            <asp:ListItem>Pop/Remix</asp:ListItem>
                            <asp:ListItem>Rock</asp:ListItem>
                            <asp:ListItem>Happy/Fun</asp:ListItem>
                            <asp:ListItem>Dance</asp:ListItem>
                            <asp:ListItem>Dance-Item</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                    </div>
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
