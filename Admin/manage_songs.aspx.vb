Imports System.Data.SqlClient
Imports System.IO
Imports System.IO.Path
Partial Class manage_img_base
    Inherits System.Web.UI.Page
    Dim conn As SqlConnection
    Dim comm As SqlCommand
    Public ds As Data.DataSet
    Public da As SqlDataAdapter
    Public cs As String = System.Configuration.ConfigurationSettings.AppSettings.Item("connection_string")
    Public filetodelete As String
    Public img_id As Integer
    Public user_id As Integer

    Protected Sub SqlDataSource1_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource1.Deleted
        If e.AffectedRows <> 0 Then
            lblshow.Text = " Record deleted Successfully"
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        user_id = CType(Session("aid"), Integer)
        If user_id = 0 Then
            Response.Redirect("Login.aspx")
        End If
        If Request.QueryString("msg") = "save" Then
            lblshow.Text = "Record Saved Successfully"
        ElseIf Request.QueryString("msg") = "update" Then
            lblshow.Text = "Record Updated Successfully"
        ElseIf Request.QueryString("msg") = "delete" Then
            lblshow.Text = "Record Delete Successfully"
        End If

    End Sub

    Protected Sub GridView1_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridView1.RowDeleting
        img_id = GridView1.DataKeys(e.RowIndex).Value
        conn = New SqlConnection(cs)
        conn.Open()
        da = New SqlDataAdapter
        da.SelectCommand = New SqlCommand
        da.SelectCommand.Connection = conn
        da.SelectCommand.CommandText = "select img_path from image_base where img_id = " & img_id & ""
        da.SelectCommand.CommandType = Data.CommandType.Text
        ds = New Data.DataSet
        da.Fill(ds, "image_base")
        filetodelete = ds.Tables("image_base").Rows(0).Item("img_path")
        File.Delete(Server.MapPath(filetodelete))
    End Sub
End Class
