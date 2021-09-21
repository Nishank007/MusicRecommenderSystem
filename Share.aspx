<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Share.aspx.vb" Inherits="Share" %>

<%@ Register TagPrefix="uc1" TagName="header" Src="~/includes/header.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Share Songs</title>
    <link rel="stylesheet" type="text/css" href="css/style.css" />

    <script type="text/javascript">
        var StyleFile = "theme" + document.cookie.charAt(6) + ".css";
        document.writeln('<link rel="stylesheet" type="text/css" href="css/' + StyleFile + '">');
        function email_onclick() {

        }

    </script>

</head>
<body>
    <form id="form1" runat="server">
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
                                &nbsp;Shared Favorites</h2>
                        </div>
                        <!-- End Box -->
                        <div>
                            <asp:GridView ID="GridView1" runat="server" Width="750px" CellPadding="4" ForeColor="#333333"
                                GridLines="None" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True"
                                DataSourceID="SqlDataSource1">
                                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                <Columns>
                                    <asp:BoundField DataField="Song_id" HeaderText="Song_id" 
                                        SortExpression="Song_id" >
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" >
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="name" HeaderText="From User" 
                                        SortExpression="From User" >
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
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
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:genetic_dbConnectionString %>">
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <div class="cl">
                        &nbsp;</div>
                </div>
            </div>
    </form>
</body>
</html>
