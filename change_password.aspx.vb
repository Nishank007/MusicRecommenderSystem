Imports System.Data.SqlClient
Partial Class change_password
    Inherits System.Web.UI.Page
    Dim conn As SqlConnection
    Dim comm As SqlCommand
    Public da As SqlDataAdapter
    Public ds As Data.DataSet
    Public dr As SqlDataReader
    Public cs As String = System.Configuration.ConfigurationSettings.AppSettings.Item("connection_string")
    Public msg As String
    Public user_id As Integer
    Public password As String

    Protected Sub btnreg_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnreg.Click
        user_id = CType(Session("uid"), Integer)
        If user_id = Nothing Then
            Response.Redirect("Login.aspx")
        End If
        conn = New SqlConnection(cs)
        conn.Open()
        da = New SqlDataAdapter
        da.SelectCommand = New SqlCommand
        da.SelectCommand.Connection = conn
        da.SelectCommand.CommandText = "select * from MUser where user_id = " & user_id & ""
        da.SelectCommand.CommandType = Data.CommandType.Text
        ds = New Data.DataSet
        da.Fill(ds, "MUser")
        password = ds.Tables("Muser").Rows(0).Item("password")
        If txtopass.Text <> password Then
            lblshow.Text = "Invalid current Password"
        Else
            conn = New SqlConnection(cs)
            conn.Open()
            da = New SqlDataAdapter
            da.SelectCommand = New SqlCommand
            da.SelectCommand.Connection = conn
            da.SelectCommand.CommandText = "update Muser set password = '" & txtnpass.Text & "' where user_id = " & user_id & ""
            da.SelectCommand.CommandType = Data.CommandType.Text
            ds = New Data.DataSet
            da.SelectCommand.ExecuteNonQuery()
            lblshow.Text = "Password has been reset Succsessfully"

        End If
    End Sub
End Class
