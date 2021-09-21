Imports System.Data.SqlClient
Partial Class Admin_Login
    Inherits System.Web.UI.Page
    Public conn As SqlConnection
    Public comm As SqlCommand
    Public ds As Data.DataSet
    Public da As SqlDataAdapter
    Public cs As String = System.Configuration.ConfigurationSettings.AppSettings.Item("connection_string")
    Public username As String
    Public user_id As Integer
    Protected Sub btnLogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLogin.Click
        Dim u As String = txtUsername.Text
        Dim p As String = txtPassword.Text
        conn = New SqlConnection(cs)
        conn.Open()
        da = New SqlDataAdapter
        da.SelectCommand = New SqlCommand
        da.SelectCommand.Connection = conn
        da.SelectCommand.CommandText = "Select * From admin where username = @username and password = @password"
        da.SelectCommand.CommandType = Data.CommandType.Text
        da.SelectCommand.Parameters.AddWithValue("@username", u)
        da.SelectCommand.Parameters.AddWithValue("@password", p)
        ds = New Data.DataSet()
        da.Fill(ds, "admin_login")
        If ds.Tables("admin_login").Rows.Count = 0 Then
            lblshow.Text = "Invalid Login Information"
            txtUsername.Text = ""
            txtPassword.Text = ""
            txtUsername.Focus()
        ElseIf ds.Tables("admin_login").Rows.Count > 0 Then
            username = ds.Tables("admin_login").Rows(0).Item("username")
            user_id = ds.Tables("admin_login").Rows(0).Item("user_id")
            'custid = ds.Tables("admin_login").Rows(0).Item("admin_id")
            Session("aid") = user_id
            Session("uname") = username
            'Session("username") = username
            Response.Redirect("Default.aspx")
            Exit Sub
        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        user_id = CType(Session("aid"), Integer)
        If Request.QueryString("msg") = "logout" Then
            lblshow.Text = "You are Logout Successfully"
            Session("aid") = 0
            Session("uname") = ""
        ElseIf Request.QueryString("msg") = "register" Then
            lblshow.Text = "You are Registred Successfully..Please Login.."
        ElseIf user_id <> 0 Then
            Response.Redirect("Default.aspx")
        End If
    End Sub
End Class
