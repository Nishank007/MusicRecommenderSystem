<%@ Page Language="VB" AutoEventWireup="false" CodeFile="favorites_songs.aspx.vb"
    Inherits="manage_img_base" %>

<%@ Register TagPrefix="uc1" TagName="header" Src="~/includes/header.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>My Favorites Songs</title>
    <link rel="stylesheet" type="text/css" href="css/style.css" />

    <script type="text/javascript">
        var StyleFile = "theme" + document.cookie.charAt(6) + ".css";
        document.writeln('<link rel="stylesheet" type="text/css" href="css/' + StyleFile + '">');
        function email_onclick() {

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
            </div>
            <!-- End Small Nav -->
            <!-- Message OK -->
            <!-- End Message OK -->
            <!-- Message Error -->
            <!-- End Message Error -->
            <br />
            <!-- Main -->
            <div id="main">
                <div class="cl">
                </div>
                <!-- Content -->
                <div id="content">
                    <div class="box">
                        <div>
                            <%--<a href="add_new_song.aspx">Add New Song</a>--%><br />
                            <asp:Label ID="lblshow" runat="server" Text=""></asp:Label></div>
                        <!-- Box Head -->
                        <div class="box-head">
                            <h2 class="left">
                                My Favorites</h2>
                            <h2 class="right">
                                Select User:
                                <asp:DropDownList ID="DropDownList1" runat="server" Height="23px" Width="129px" AutoPostBack="True"
                                    DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="user_id">
                                    <asp:ListItem Value="0" Selected="True">Select</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:genetic_dbConnectionString %>"
                                    SelectCommand="SELECT [user_id], ([first_name]+' '+[last_name]) as name FROM [MUser]">
                                </asp:SqlDataSource>
                            </h2>
                        </div>
                        <!-- End Box -->
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                            AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333"
                            GridLines="None" Height="75px" Width="746px" DataKeyNames="song_id" EmptyDataText="No Song Found.">
                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                            <Columns>
                                <asp:BoundField DataField="song_id" HeaderText="Song ID" SortExpression="ID">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="title" HeaderText="Song Title" SortExpression="title">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="30%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Artist" HeaderText="Artist" SortExpression="Artist">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="20%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="category" HeaderText="Category" SortExpression="category">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="20%" />
                                </asp:BoundField>
                                <asp:HyperLinkField DataNavigateUrlFields="song_path" DataNavigateUrlFormatString=""
                                    Text="Listen" Target="_blank" HeaderImageUrl="~/css/images/sound-m.gif">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                                </asp:HyperLinkField>
                                <asp:TemplateField HeaderText="Select">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkSelect" runat="server" />
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:genetic_dbConnectionString %>"
                            SelectCommand="SELECT Distinct(F.song_id),S.title,F.user_id,S.Artist, S.category,S.song_path FROM favorites F, Songs S where F.song_id = S.song_id and F.user_id = @user_id"
                            DeleteCommand="Delete From favorites where song_id = @song_id and user_id = @user_id">
                            <DeleteParameters>
                                <asp:Parameter Name="song_id" />
                                <asp:Parameter Name="user_id" />
                            </DeleteParameters>
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="" Name="user_id" SessionField="uid" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <div style="text-align: right; margin-right: 20px;">
                            <asp:Button ID="btnShare" runat="server" Text="Share" Height="31px" Width="63px" /></div>
                    </div>
                    <div class="cl">
                        &nbsp;</div>
                </div>
            </div>
    </form>
</body>
</html>
