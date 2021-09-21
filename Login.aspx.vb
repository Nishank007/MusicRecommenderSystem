Imports System.Data.SqlClient
Partial Class Admin_Login
    Inherits System.Web.UI.Page
    Dim conn As SqlConnection
    Dim comm As SqlCommand
    Public ds As Data.DataSet
    Public da As SqlDataAdapter
    Public cs As String = System.Configuration.ConfigurationSettings.AppSettings.Item("connection_string")
    Public username As String
    Public user_id As Integer
    Public first_name As String
    Public last_name As String
    

    Protected Sub btnLogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLogin.Click
        Dim u As String = txtUsername.Text
        Dim p As String = txtPassword.Text
        conn = New SqlConnection(cs)
        conn.Open()
        da = New SqlDataAdapter
        da.SelectCommand = New SqlCommand
        da.SelectCommand.Connection = conn
        da.SelectCommand.CommandText = "user_login"
        da.SelectCommand.CommandType = Data.CommandType.StoredProcedure
        da.SelectCommand.Parameters.AddWithValue("@username", u)
        da.SelectCommand.Parameters.AddWithValue("@password", p)
        ds = New Data.DataSet()
        da.Fill(ds, "user_login")
        If ds.Tables("user_login").Rows.Count = 0 Then
            lblshow.Text = "Invalid Login Information"
            txtUsername.Text = ""
            txtPassword.Text = ""
        ElseIf ds.Tables("user_login").Rows.Count > 0 Then
            username = ds.Tables("user_login").Rows(0).Item("username")
            user_id = ds.Tables("user_login").Rows(0).Item("user_id")
            first_name = ds.Tables("user_login").Rows(0).Item("first_name")
            last_name = ds.Tables("user_login").Rows(0).Item("last_name")

            'custid = ds.Tables("admin_login").Rows(0).Item("admin_id")
            Session("uid") = user_id
            Session("name") = first_name + " " + last_name
            'Session("username") = username
            Response.Redirect("Default.aspx")
            Exit Sub
        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.QueryString("msg") = "logout" Then
            lblshow.Text = "You are Logout Successfully"
            Session("uid") = 0
            Session("name") = ""
        ElseIf Request.QueryString("msg") = "register" Then
            lblshow.Text = "You are Registred Successfully..Please Login.."
        End If
    End Sub
End Class
