<%@ Page Language="VB" AutoEventWireup="false" CodeFile="manage_songs.aspx.vb" Inherits="manage_img_base" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="~/Admin/includes/header.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Manage Songs</title>
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
 X-<uc1:header ID="header" runat="server"></uc1:header><div id="container">
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
			<div class="cl"></div>
			<!-- Content -->
			<div id="content">
			<div class="box">
			<div>
			<a href="add_new_song.aspx">Add New Song</a><br />
                <asp:Label ID="lblshow" runat="server" Text=""></asp:Label></div>
					<!-- Box Head -->
					<div class="box-head">
						<h2 class="left">Songs</h2>

				
				</div>
				<!-- End Box -->

                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" 
                             AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" 
                             ForeColor="#333333" GridLines="None" 
                             Height="75px" Width="746px" DataKeyNames="song_id" Font-Bold="True">
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <Columns>
                            <asp:BoundField DataField="Title" HeaderText="Title" 
                                SortExpression="Title" >
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="20%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Artist" HeaderText="Artist" 
                                SortExpression="Artist" >
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="20%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Category" HeaderText="Category" 
                                SortExpression="Category" >
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="20%" />
                            </asp:BoundField>
                            <asp:HyperLinkField DataNavigateUrlFields="song_id" 
                                            DataNavigateUrlFormatString="add_new_song.aspx?action=edit&amp;song_id={0}" 
                                            Text="Edit" HeaderText="Action" >
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
					
			             <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                             ConnectionString="<%$ ConnectionStrings:genetic_dbConnectionString %>" 
                             
                             
                             SelectCommand="SELECT [song_id], [Artist], [Title], [Category], [song_path] FROM [Songs]">
                         </asp:SqlDataSource>
					
			</div>
			<div class="cl">&nbsp;</div>			
		</div>

</div>

</form>

</body>
</html>
