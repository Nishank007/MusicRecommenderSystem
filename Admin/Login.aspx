<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Admin_Login" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="~/Admin/includes/header.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Login</title>
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
			<div class="cl">&nbsp;</div>
			
			<!-- Content -->
			<div id="content">
				
				<!-- Box -->
				<div class="box">
					<!-- Box Head -->
					<div class="box-head">
						<h2 class="left">Login</h2>
					
					<div >
					
					</div>
				
				</div>
				<!-- End Box -->

						 <table border="0" class="table "> 
						    <tr style="height: 20px; width: 100px">
						        <td colspan="3">
                                    <asp:Label ID="lblshow" runat="server" ForeColor="Red"></asp:Label></td></tr>
                            <tr style="height: 20px; width: 100px">
                               <td width="20%"><asp:Label ID="lblUsername" runat="server" Text="Username :"></asp:Label></td>
                                <td width="18%"><asp:TextBox ID="txtUsername" runat="server" Height="20px" Width="160px" CssClass ="field"></asp:TextBox></td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ErrorMessage="Username can not be blank" ControlToValidate="txtUsername" 
                                            SetFocusOnError="True" Width="181%"></asp:RequiredFieldValidator></td></tr>
                                 <tr style="height: 20px; width: 100px">
                               <td width="10%"><asp:Label ID="lblPassword" runat="server" Text="Password :"></asp:Label></td>
                                <td width="18%"><asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Height="20px" 
                                        Width="160px"  CssClass ="field"></asp:TextBox></td>
                                        <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                ErrorMessage="Password can not be blank" ControlToValidate="txtPassword" 
                                                SetFocusOnError="True" Width="181%"></asp:RequiredFieldValidator></td></tr>
                                <tr style="height: 20px; width: 100px"><td colspan="3" valign="bottom" >
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnLogin" runat="server" 
                                        Text="Login" Width="150px" Height="25px" CssClass="button"/>
                                  
                                </td></tr>
                                </table>
					
			</div>
			<!-- End Content -->
			
			<!-- Sidebar -->
			<!-- End Sidebar -->
			
			<div class="cl">&nbsp;</div>			
		</div>

</div>

</form>

 <p>
     &nbsp;</p>

</body>
</html>
