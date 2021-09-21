<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="Admin_Default" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="~/includes/header.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Home - Welcome to Genetic Algo</title>
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
			<!-- End Content -->
			
			<!-- Sidebar -->
			<!-- End Sidebar -->
			
			<div class="cl">&nbsp;<asp:Image ID="Image1" runat="server" 
                    DescriptionUrl="~/Images/music3.jpg" Height="309px" 
                    ImageUrl="~/Images/Musical-Instruments.jpg" Width="742px" />
                     </div>			
		</div>

</div>

</form>

</body>
</html>
