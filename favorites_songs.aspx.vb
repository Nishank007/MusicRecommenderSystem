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
        user_id = CType(Session("uid"), Integer)
        'If user_id = 0 Then
        '    Response.Redirect("Login.aspx")
        'End If
        If Request.QueryString("msg") = "save" Then
            lblshow.Text = "Record Saved Successfully"
        ElseIf Request.QueryString("msg") = "update" Then
            lblshow.Text = "Record Updated Successfully"
        End If

    End Sub

    Protected Sub GridView1_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridView1.RowDeleting
        'img_id = GridView1.DataKeys(e.RowIndex).Value
        'conn = New SqlConnection(cs)
        'conn.Open()
        'da = New SqlDataAdapter
        'da.SelectCommand = New SqlCommand
        'da.SelectCommand.Connection = conn
        'da.SelectCommand.CommandText = "select img_path from image_base where img_id = " & img_id & ""
        'da.SelectCommand.CommandType = Data.CommandType.Text
        'ds = New Data.DataSet
        'da.Fill(ds, "image_base")
        'filetodelete = ds.Tables("image_base").Rows(0).Item("img_path")
        'File.Delete(Server.MapPath(filetodelete))
    End Sub

    Protected Sub btnShare_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnShare.Click
        Dim str As String = String.Empty
        Dim song_id As String = String.Empty
        Dim From_user As Integer = CType(Session("uid"), Integer)
        Dim To_user As Integer = DropDownList1.SelectedValue

        For Each gvrow As GridViewRow In GridView1.Rows
            Dim chk As CheckBox = DirectCast(gvrow.FindControl("chkSelect"), CheckBox)
            If chk IsNot Nothing And chk.Checked Then
                str = GridView1.DataKeys(gvrow.RowIndex).Value.ToString()
                song_id = gvrow.Cells(0).Text

                conn = New SqlConnection(cs)
                conn.Open()
                da = New SqlDataAdapter()
                da.SelectCommand = New SqlCommand()
                da.SelectCommand.Connection = conn
                da.SelectCommand.CommandText = "insert into share(song_id,from_user,to_user)values(" & song_id & "," & From_user & "," & To_user & ")"
                da.SelectCommand.CommandType = Data.CommandType.Text
                da.SelectCommand.ExecuteNonQuery()

            End If
        Next
        lblshow.Text = "Songs Shared Successfully"
    End Sub
End Class
