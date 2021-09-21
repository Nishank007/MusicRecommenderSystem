<%@ Page Language="VB" AutoEventWireup="false" CodeFile="register.aspx.vb" Inherits="register" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="~/includes/header.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Registration</title>
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
        <style type="text/css">
            .style1
            {
                width: 268px;
            }
        </style>
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
			Registration
		</div>
		<!-- End Small Nav -->
		
		<!-- Message OK -->		
		<!-- End Message OK -->		
		
		<!-- Message Error -->
		<!-- End Message Error -->
		<br />
		<!-- Main -->
		<div id="main">
			<div class="cl"><asp:Label ID="lblshow" runat="server" Font-Bold="True" 
                    Font-Italic="True" Font-Size="Small" ForeColor="Red"></asp:Label></div>
			
			<!-- Content -->
			<br />
			<div id="content">
				
				<!-- Box -->
				<div class="box">
					<!-- Box Head -->
					<div class="box-head">
						<h2 class="left">Login</h2>
						<br />
						<div>
                            </div>
					</div>
					<div >
						 <table border="0" class="table" width="100%">
                        
                            <tr style="height: 20px; width: 100px">
                               <td width="30%"><asp:Label ID="lblUsername" runat="server" Text="Email ID:"></asp:Label>
                                   *</td>
                                <td width="18%"><asp:TextBox ID="txtemail" runat="server" Height="20px" 
                                        Width="160px" CssClass="field"></asp:TextBox></td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ErrorMessage="Email Id is Required" ControlToValidate="txtemail" 
                                            SetFocusOnError="True" Width="181%" Display="Dynamic"></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                                                ID="RegularExpressionValidator1" runat="server" 
                                            ErrorMessage="Invalid E-Mail ID" ControlToValidate="txtemail" 
                                            ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"></asp:RegularExpressionValidator></td></tr>
                                 <tr style="height: 20px; width: 100px">
                               <td width="10%"><asp:Label ID="lblPassword" runat="server" Text="Password :"></asp:Label>
                                   *</td>
                                <td width="18%">
                                    <asp:TextBox ID="txtpass" runat="server" TextMode="Password" Height="20px" 
                                        Width="160px" CssClass="field"></asp:TextBox></td>
                                        <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                ErrorMessage="Password is Required" ControlToValidate="txtpass" 
                                                SetFocusOnError="True" Width="181%"></asp:RequiredFieldValidator></td></tr>
                                                <tr style="height: 20px; width: 100px">
                               <td width="10%"><asp:Label ID="Label1" runat="server" Text="Confirm Password:"></asp:Label>
                                   *</td>
                                <td width="18%">
                                    <asp:TextBox ID="txtcpass" runat="server" TextMode="Password" Height="20px" 
                                        Width="160px" CssClass="field"></asp:TextBox></td>
                                        <td>
                                            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                                ControlToCompare="txtpass" ControlToValidate="txtcpass" 
                                                ErrorMessage="Password Does Not Match" SetFocusOnError="True"></asp:CompareValidator>
                                                    </td></tr>
                                </table>
                                 &nbsp;&nbsp;&nbsp;<div class="box-head"><h2 class="left">Personal Information</h2></div>
                                 <table class="table" width="100%"><tr style="height: 20px; width: 100px">
                               <td width="33%"><asp:Label ID="Label2" runat="server" Text="First Name:"></asp:Label>
                                   *</td>
                                <td width="18%">
                                    <asp:TextBox ID="txtfirstname" runat="server" Height="20px" 
                                        Width="160px" CssClass="field"></asp:TextBox></td>
                                        <td class="style1">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                ErrorMessage="First Name is Required" ControlToValidate="txtfirstname" 
                                                SetFocusOnError="True" Width="181%"></asp:RequiredFieldValidator></td></tr>
                   
                                   <tr>
                               <td width="10%"><asp:Label ID="Label3" runat="server" Text="Middle Name:"></asp:Label>
                                   *</td>
                                <td width="18%">
                                    <asp:TextBox ID="txtmiddlename" runat="server" Height="20px" 
                                        Width="160px" CssClass="field"></asp:TextBox></td>
                                        <td class="style1">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                                ErrorMessage="Middle Name is Required" ControlToValidate="txtmiddlename" 
                                                SetFocusOnError="True" Width="181%"></asp:RequiredFieldValidator></td></tr>
                                             <tr style="height: 20px; width: 100px">
                               <td width="10%"><asp:Label ID="Label4" runat="server" Text="Last Name:"></asp:Label>*</td>
                                <td width="18%">
                                    <asp:TextBox ID="txtlastname" runat="server" Height="20px" 
                                        Width="160px" CssClass="field"></asp:TextBox></td>
                                        <td class="style1">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                                ErrorMessage="Last Name is Required" ControlToValidate="txtlastname" 
                                                SetFocusOnError="True" Width="181%"></asp:RequiredFieldValidator></td></tr>
                                                <tr style="height: 20px; width: 100px">
                               <td width="10%"><asp:Label ID="Label5" runat="server" Text="Address:"></asp:Label>*</td>
                                <td width="18%">
                                    <asp:TextBox ID="txtaddress" runat="server" Height="70px" 
                                        Width="161px" TextMode="MultiLine" CssClass="field"></asp:TextBox></td>
                                        <td class="style1">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                                ErrorMessage="Address is Required" ControlToValidate="txtaddress" 
                                                SetFocusOnError="True" Width="181%"></asp:RequiredFieldValidator></td></tr>
                                                <tr style="height: 20px; width: 100px">
                               <td width="10%"><asp:Label ID="Label6" runat="server" Text="State:"></asp:Label>*</td>
                                <td width="18%">
                                    <asp:TextBox ID="txtstate" runat="server" Height="20px" 
                                        Width="160px" CssClass="field"></asp:TextBox></td>
                                        <td class="style1">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                                ErrorMessage="State is Required" ControlToValidate="txtstate" 
                                                SetFocusOnError="True" Width="181%"></asp:RequiredFieldValidator></td></tr>
                                              <tr style="height: 20px; width: 100px">
                               <td width="10%"><asp:Label ID="Label7" runat="server" Text="Country:"></asp:Label>*</td>
                                <td width="18%">
                                    <asp:TextBox ID="txtcountry" runat="server" Height="20px" 
                                        Width="160px" CssClass="field"></asp:TextBox></td>
                                        <td class="style1">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                                ErrorMessage="Country is Required" ControlToValidate="txtcountry" 
                                                SetFocusOnError="True" Width="181%"></asp:RequiredFieldValidator></td></tr>
                                                
                                 <tr style="height: 20px; width: 100px">
                               <td width="10%"><asp:Label ID="Label8" runat="server" Text="Zip Code:"></asp:Label>*</td>
                                <td width="18%">
                                    <asp:TextBox ID="txtzip" runat="server" Height="20px" 
                                        Width="160px" CssClass="field"></asp:TextBox></td>
                                        <td class="style1">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                                ErrorMessage="Zipcode is Required" ControlToValidate="txtzip" 
                                                SetFocusOnError="True" Width="125px" Display="Dynamic"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator
                                                ID="RegularExpressionValidator2" runat="server" 
                                                ErrorMessage="Invalid Zip Code" ControlToValidate="txtzip" 
                                                ValidationExpression="^[0-9]+$" Display="Dynamic"></asp:RegularExpressionValidator></td></tr>
                                
                                                <tr style="height: 20px; width: 100px">
                               <td width="10%"><asp:Label ID="Label10" runat="server" Text="Mobile No.:"></asp:Label>*</td>
                                <td width="18%">
                                    <asp:TextBox ID="txtmob" runat="server" Height="20px" 
                                        Width="160px" CssClass="field"></asp:TextBox></td>
                                        <td class="style1">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                                                ErrorMessage="Mobile Number is Rquired" ControlToValidate="txtmob" 
                                                SetFocusOnError="True" Width="175px" Display="Dynamic"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator
                                                ID="RegularExpressionValidator3" runat="server" 
                                                ErrorMessage="Invalid Moblie Number" ControlToValidate="txtmob" 
                                                ValidationExpression="^[0-9]+$" Display="Dynamic"></asp:RegularExpressionValidator></td></tr>
                                                <tr style="height: 20px; width: 100px">
                               <td width="10%"><asp:Label ID="Label9" runat="server" Text="Contact No.:"></asp:Label></td>
                                <td width="18%">
                                    <asp:TextBox ID="txtcontact1" runat="server" Height="20px" 
                                        Width="160px" CssClass="field"></asp:TextBox></td>
                                        <td class="style1">
                                            &nbsp;</td></tr>
                                <tr style="height: 20px; width: 100px"><td colspan="3" valign="bottom" >
                                   <asp:Button ID="btnreg" runat="server" 
                                        Text="Register" Width="150px" Height="25px" CssClass="button" />&nbsp;&nbsp;<asp:Button 
                                        ID="btncancel" runat="server" 
                                        Text="Cancel" Width="150px" Height="25px" OnClientClick="history.back()" 
                                        CssClass="button" />&nbsp;&nbsp;<asp:Button ID="btlreset" runat="server" 
                                        Text="Reset" Width="150px" Height="25px" CssClass="button" /></td></tr>
                                </table>
					
					</div>
				
				</div>
				<!-- End Box -->

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