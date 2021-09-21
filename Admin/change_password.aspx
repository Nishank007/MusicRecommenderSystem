<%@ Page Language="VB" AutoEventWireup="false" CodeFile="change_password.aspx.vb" Inherits="change_password" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="~/includes/header.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Change Password</title>
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
			<a href="Default.aspx">Home</a>
			<span>&gt;</span>
			Change Password
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
						<h2 class="left">Change Password</h2>
					
					<div >
					
					</div>
				
				</div>
				<!-- End Box -->

						 <table border="0" class="table "> 
						    <tr style="height: 20px; width: 100px">
						        <td colspan="3">
                                    <asp:Label ID="lblshow" runat="server" ForeColor="Red"></asp:Label></td></tr>
                            <tr style="height: 20px; width: 100px">
                               <td width="25%"><asp:Label ID="lblUsername" runat="server" Text="Current Password :"></asp:Label></td>
                                <td width="18%"><asp:TextBox ID="txtopass" runat="server" Height="20px" Width="160px" CssClass ="field" TextMode="Password"></asp:TextBox></td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ErrorMessage="Current Password can not be blank" ControlToValidate="txtopass" 
                                            SetFocusOnError="True" Width="181%"></asp:RequiredFieldValidator></td></tr>
                                 <tr style="height: 20px; width: 100px">
                               <td width="10%"><asp:Label ID="lblPassword" runat="server" Text="New Password :"></asp:Label></td>
                                <td width="18%"><asp:TextBox ID="txtnpass" runat="server" TextMode="Password" Height="20px" 
                                        Width="160px"  CssClass ="field"></asp:TextBox></td>
                                        <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                ErrorMessage="New Password can not be blank" ControlToValidate="txtnpass" 
                                                SetFocusOnError="True" Width="181%"></asp:RequiredFieldValidator></td></tr>
                                                      <tr style="height: 20px; width: 100px">
                               <td width="10%"><asp:Label ID="Label1" runat="server" Text="Confirm Password :"></asp:Label></td>
                                <td width="18%"><asp:TextBox ID="txtcpass" runat="server" TextMode="Password" Height="20px" 
                                        Width="160px"  CssClass ="field"></asp:TextBox></td>
                                        <td>
                                            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                                ControlToCompare="txtnpass" ControlToValidate="txtcpass" 
                                                ErrorMessage="Password Does not Match" SetFocusOnError="True"></asp:CompareValidator>
                                                          </td></tr>
                                 <tr style="height: 20px; width: 100px"><td colspan="3" valign="bottom" >
                                   <asp:Button ID="btnreg" runat="server" 
                                        Text="Save" Width="150px" Height="25px" CssClass="button" />&nbsp;&nbsp;<asp:Button 
                                        ID="btncancel" runat="server" 
                                        Text="Cancel" Width="150px" Height="25px" OnClientClick="history.back()" 
                                        CssClass="button" />&nbsp;&nbsp;<asp:Button ID="btlreset" runat="server" 
                                        Text="Reset" Width="150px" Height="25px" CssClass="button" /></td></tr>
                                </table>
					
			</div>
			<!-- End Content -->
			
			<!-- Sidebar -->
			<!-- End Sidebar -->
			
			<div class="cl">&nbsp;</div>			
		</div>

</div>

</form>

</body>
</html>
