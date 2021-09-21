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
			<h1>Music Lounge</h1>
			<%If userid = Nothing Then%>
           <div id="top-navigation">
				Welcome <a href="#"><strong>Guest</strong></a>
				<span>|</span>
				<a href="register.aspx">New User..Register Here</a>
				<span>|</span>
				<a href="admin/Login.aspx"><strong>Admin</strong></a>
			</div>
			<%Else%>
			<div id="top-navigation">
				Welcome <a href="#"><strong><%=name%></strong></a>
				<span>|</span>
				<a href="change_password.aspx">Change Password</a>
				<span>|</span>
				<a href="Login.aspx?msg=logout">Log out</a>
			</div>
			<%End If%>
		</div>
		<!-- End Logo + Top Nav -->
		
		<!-- Main Nav -->
		<div id="navigation">
			<ul>
			<%If (InStr(Page.Request.RawUrl, "Default.aspx") = 0) Then%>
            	  <li><a href="Default.aspx" ><span>Home</span></a></li>
            	  <%Else%>
            	  <li><a href="#" class="active"><span>Home</span></a></li>
            	  <%End If%>
           <%--<%If (InStr(Page.Request.RawUrl, "about_us.aspx") = 0) Then%>
            	  <li><a href="about_us.aspx" ><span>About Us</span></a></li>
            	  <%Else%>
            	  <li><a href="#" class="active"><span>About Us</span></a></li>
            	  <%End If%>--%>
		 
       <%If userid = 0 Then%>
         <%If (InStr(Page.Request.RawUrl, "Login.aspx") = 0) Then%>
            	  <li><a href="Login.aspx" ><span>Login</span></a></li>
            	  <%Else%>
            	  <li><a href="#" class="active"><span>Login</span></a></li>
            	  <%End If%>
            	  <%Else%>
   <%If (InStr(Page.Request.RawUrl, "Songs.aspx") = 0) Then%>
            	  <li><a href="Songs.aspx" ><span>Discover</span></a></li>
            	  <%Else%>
            	  <li><a href="#" class="active"><span>Discover</span></a></li>
            	  <%End If%>
    <%If (InStr(Page.Request.RawUrl, "favorites_songs.aspx") = 0) Then%>
            	  <li><a href="favorites_songs.aspx" ><span>My Music</span></a></li>
            	  <%Else%>
            	  <li><a href="#" class="active"><span>My Music</span></a></li>
            	  <%End If%>
      <%If (InStr(Page.Request.RawUrl, "profile.aspx") = 0) Then%>
            	  <li><a href="profile.aspx" ><span>My Profie</span></a></li>
            	  <%Else%>
            	  <li><a href="#" class="active"><span>My Profie</span></a></li>
            	  <%End If%>
      <%If (InStr(Page.Request.RawUrl, "recommend.aspx") = 0) Then%>
            	  <li><a href="recommend.aspx" ><span>Recommendation</span></a></li>
            	  <%Else%>
            	  <li><a href="#" class="active"><span>Recommendation</span></a></li>
            	  <%End If%>
       <%If (InStr(Page.Request.RawUrl, "Share.aspx") = 0) Then%>
            	  <li><a href="Share.aspx" ><span>Share</span></a></li>
            	  <%Else%>
            	  <li><a href="#" class="active"><span>Share</span></a></li>
            	  <%End If%>
       
		<%end if %>	    	    
			 
	    
			    

			</ul>
		</div>
		<!-- End Main Nav -->
	</div>
</div>
</body>
</html>
