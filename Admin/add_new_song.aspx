<%@ Page Language="VB" AutoEventWireup="false" CodeFile="add_new_song.aspx.vb" Inherits="add_new_song" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="~/Admin/includes/header.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Add New Song</title>
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
						<h2 class="left">Add New Song</h2>
					
					<div >
					
					</div>
				
				</div>
				<!-- End Box -->

						 <table border="0" class="table ">
						
                            <tr style="height: 20px; width: 100px">
                               <td width="25%">
                                   <asp:Label ID="lblorgan_name" runat="server" 
                                       Text="Song Name:"></asp:Label></td>
                                <td width="18%">
                                    <asp:TextBox ID="txtname" runat="server" CssClass="field"></asp:TextBox>
                                </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ControlToValidate="txtname" ErrorMessage="Song Name can not be Blank" 
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </td></tr>
              
                                    <tr style="height: 20px; width: 100px">
                               <td width="25%">
                                   <asp:Label ID="Label4" runat="server" 
                                       Text="Artist:"></asp:Label></td>
                                <td width="18%">
                                    <asp:TextBox ID="txtartist" runat="server" CssClass="field"></asp:TextBox>
                                </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                            ControlToValidate="txtartist" ErrorMessage="Artist can not be Blank" 
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td></tr>
                                        <tr style="height: 20px; width: 100px">
                               <td width="25%">
                                   <asp:Label ID="Label2" runat="server" 
                                       Text="Category:"></asp:Label></td>
                                <td width="18%">
                                    <asp:DropDownList ID="ddlcategory" runat="server" CssClass="field">
                                        <asp:ListItem>Select Category</asp:ListItem>
                                        <asp:ListItem>Romantic</asp:ListItem>
                                        <asp:ListItem>Sad</asp:ListItem>
                                        <asp:ListItem>Pop/Remix</asp:ListItem>
                                        <asp:ListItem>Rock</asp:ListItem>
                                        <asp:ListItem>Happy/Fun</asp:ListItem>
                                        <asp:ListItem>Dance</asp:ListItem>
                                        <asp:ListItem>Dance-Item</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                            ControlToValidate="ddlcategory" ErrorMessage="Please select category" 
                                            SetFocusOnError="True" InitialValue="0"></asp:RequiredFieldValidator>
                                        </td></tr>
              
                                  <tr style="height: 20px; width: 100px">
                               <td width="10%">
                                   <asp:Label ID="Label1" runat="server" 
                                       Text="Select Song:"></asp:Label></td>
                                <td width="18%">
                                    <asp:FileUpload ID="fuimg" runat="server" />
                                   
                                     </td>
                                        <td>
                                            <asp:Label ID="lblval" runat="server" ForeColor="Red" Visible="true"></asp:Label>
                                    </td></tr>
                                 <tr style="height: 20px; width: 100px">
                               <td width="25%">
                                   <asp:Label ID="Label3" runat="server" 
                                       Text="Tempo:"></asp:Label></td>
                                <td width="18%">
                                    <asp:TextBox ID="txttempo" runat="server" CssClass="field"></asp:TextBox>
                                </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                            ControlToValidate="txttempo" ErrorMessage="Tempo can not be Blank" 
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td></tr>
                                        <tr style="height: 20px; width: 100px">
                               <td width="25%">
                                   <asp:Label ID="Label5" runat="server" 
                                       Text="Pitch:"></asp:Label></td>
                                <td width="18%">
                                    <asp:TextBox ID="txtpitch" runat="server" CssClass="field"></asp:TextBox>
                                </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                            ControlToValidate="txtpitch" ErrorMessage="Pitch can not be Blank" 
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td></tr>
                                        <tr style="height: 20px; width: 100px">
                               <td width="25%">
                                   <asp:Label ID="Label6" runat="server" 
                                       Text="Octav:"></asp:Label></td>
                                <td width="18%">
                                    <asp:TextBox ID="txtoctav" runat="server" CssClass="field"></asp:TextBox>
                                </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                            ControlToValidate="txtoctav" ErrorMessage="Octav can not be Blank" 
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td></tr>
                                        <tr style="height: 20px; width: 100px">
                               <td width="25%">
                                   <asp:Label ID="Label7" runat="server" 
                                       Text="Root:"></asp:Label></td>
                                <td width="18%">
                                    <asp:TextBox ID="txtroot" runat="server" CssClass="field"></asp:TextBox>
                                </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                            ControlToValidate="txtroot" ErrorMessage="Root can not be Blank" 
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td></tr>
                                        <tr style="height: 20px; width: 100px">
                               <td width="25%">
                                   <asp:Label ID="Label8" runat="server" 
                                       Text="Mode:"></asp:Label></td>
                                <td width="18%">
                                    <asp:TextBox ID="txtmode" runat="server" CssClass="field"></asp:TextBox>
                                </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                            ControlToValidate="txtmode" ErrorMessage="Mode can not be Blank" 
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td></tr>
                                    
                                                   
                                 <tr style="height: 20px; width: 100px"><td colspan="3" valign="bottom" >
                                   <asp:Button ID="btnreg" runat="server" 
                                        Text="Save" Width="150px" Height="25px" CssClass="button" />&nbsp;&nbsp;<asp:Button 
                                        ID="btncancel" runat="server" 
                                        Text="Cancel" Width="150px" Height="25px" OnClientClick="history.back()" 
                                        CssClass="button" />&nbsp;&nbsp;<asp:Button ID="btlreset" runat="server" 
                                        Text="Reset" Width="150px" Height="25px" CssClass="button" />&nbsp;
                                     <asp:Button ID="btlDelete" runat="server" 
                                        Text="Delete" Width="150px" Height="25px" CssClass="button" /></td></tr>
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