<%@ Control Language="VB" AutoEventWireup="false" CodeFile="header.ascx.vb" Inherits="header" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="../css/style.css" /></head>
<body>
<div id="header">
	<div class="shell">
		<!-- Logo + Top Nav -->
		<div id="top">
			<h1>&nbsp;Music Lounge- Admin Panel  </h1>
			&nbsp;
			
			
			<%If user_id = 0 Then%>
           <div id="top-navigation">
			
			</div>
			<%Else%>
			<div id="top-navigation">
				Welcome <a href="#"><strong><%=uname%></strong></a>
				<span>|</span>
				<a href="change_password.aspx">Change Password</a>
				<span>|</span>
				<a href="Login.aspx?msg=logout">Log out</a>
				<span>|</span>
				<a href="http://localhost:49186/Final%20Genetic%20Algo/Login.aspx">User Login</a>
				
				
	
		</div>
			<%End If%>
		</div>
		<!-- End Logo + Top Nav -->
		
		<!-- Main Nav -->
		<div id="navigation">
			<ul>
			<%If user_id = Nothing Then%>
			<%else %>
			<%If (InStr(Page.Request.RawUrl, "Default.aspx") = 0) Then%>
            	  <li><a href="Default.aspx" ><span>Home</span></a></li>
            	  <%Else%>
            	  <li><a href="#" class="active"><span>Home</span></a></li>
            	  <%End If%>
         
           <%If (InStr(Page.Request.RawUrl, "manage_songs.aspx") = 0) Then%>
            	  <li><a href="manage_songs.aspx" ><span>Manage Songs</span></a></li>
            	  <%Else%>
            	  <li><a href="#" class="active"><span>Manage Songs</span></a></li>
            	  <%End If%>
            
     
         <%End if %>
			</ul>
		</div>
		<!-- End Main Nav -->
	</div>
</div>
</body>
</html>
