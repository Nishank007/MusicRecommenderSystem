Imports System.Data.SqlClient
Imports System.IO.Path
Partial Class add_new_song
    Inherits System.Web.UI.Page
    Dim conn As SqlConnection
    Dim comm As SqlCommand
    Public ds As Data.DataSet
    Public da As SqlDataAdapter
    Public cs As String = System.Configuration.ConfigurationSettings.AppSettings.Item("connection_string")
    Public filename As String
    Public filepath As String
    Public song_id As Integer
    Public title As String
    Public Artist As String
    Public Category As String
    Public tempo As Double
    Public pitch As Double
    Public octav As Double
    Public root As Double
    Public mode As Double
    Public user_id As Integer

    Protected Sub btnreg_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnreg.Click
        If fuimg.HasFile Then
            filename = fuimg.FileName
        End If
        If Request.QueryString("action") = "edit" Then
            song_id = Request.QueryString("song_id")
            conn = New SqlConnection(cs)
            conn.Open()
            da = New SqlDataAdapter
            da.SelectCommand = New SqlCommand
            da.SelectCommand.Connection = conn
            da.SelectCommand.CommandText = "song_update"
            da.SelectCommand.CommandType = Data.CommandType.StoredProcedure
            da.SelectCommand.Parameters.AddWithValue("@song_id", song_id)
            da.SelectCommand.Parameters.AddWithValue("@Title", Trim(txtname.Text))
            da.SelectCommand.Parameters.AddWithValue("@Artist", Trim(txtartist.Text))
            da.SelectCommand.Parameters.AddWithValue("@category", ddlcategory.SelectedValue)
            da.SelectCommand.Parameters.AddWithValue("@Tempo", Trim(txttempo.Text))
            da.SelectCommand.Parameters.AddWithValue("@pitch", Trim(txtpitch.Text))
            da.SelectCommand.Parameters.AddWithValue("@Octav", Trim(txtoctav.Text))
            da.SelectCommand.Parameters.AddWithValue("@Root", Trim(txtroot.Text))
            da.SelectCommand.Parameters.AddWithValue("@Mode", Trim(txtmode.Text))
            da.SelectCommand.ExecuteNonQuery()
            Response.Redirect("manage_songs.aspx?msg=update")
        Else
            fuimg.SaveAs(Server.MapPath("songs/" + filename))
            conn = New SqlConnection(cs)
            conn.Open()
            da = New SqlDataAdapter
            da.SelectCommand = New SqlCommand
            da.SelectCommand.Connection = conn
            da.SelectCommand.CommandText = "song_insert"
            da.SelectCommand.CommandType = Data.CommandType.StoredProcedure
            da.SelectCommand.Parameters.AddWithValue("@Title", Trim(txtname.Text))
            da.SelectCommand.Parameters.AddWithValue("@Artist", Trim(txtartist.Text))
            da.SelectCommand.Parameters.AddWithValue("@category", ddlcategory.SelectedValue)
            da.SelectCommand.Parameters.AddWithValue("@song_path", "Admin/songs/" + filename)
            da.SelectCommand.Parameters.AddWithValue("@Tempo", Trim(txttempo.Text))
            da.SelectCommand.Parameters.AddWithValue("@pitch", Trim(txtpitch.Text))
            da.SelectCommand.Parameters.AddWithValue("@Octav", Trim(txtoctav.Text))
            da.SelectCommand.Parameters.AddWithValue("@Root", Trim(txtroot.Text))
            da.SelectCommand.Parameters.AddWithValue("@Mode", Trim(txtmode.Text))
            da.SelectCommand.ExecuteNonQuery()
            Response.Redirect("manage_songs.aspx?msg=save")
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        btlDelete.Visible = False
        If Request.QueryString("action") = "edit" And Me.IsPostBack = False Then
            fuimg.Enabled = False
            btlDelete.Visible = True
            song_id = Request.QueryString("song_id")
            conn = New SqlConnection(cs)
            conn.Open()
            da = New SqlDataAdapter
            da.SelectCommand = New SqlCommand
            da.SelectCommand.Connection = conn
            da.SelectCommand.CommandText = "song_select"
            da.SelectCommand.CommandType = Data.CommandType.StoredProcedure
            da.SelectCommand.Parameters.AddWithValue("@song_id", song_id)
            ds = New Data.DataSet
            da.Fill(ds, "song_select")
            title = ds.Tables("song_select").Rows(0).Item("Title")
            Artist = ds.Tables("song_select").Rows(0).Item("Artist")
            Category = ds.Tables("song_select").Rows(0).Item("Category")
            tempo = ds.Tables("song_select").Rows(0).Item("tempo")
            pitch = ds.Tables("song_select").Rows(0).Item("pitch")
            octav = ds.Tables("song_select").Rows(0).Item("octav")
            root = ds.Tables("song_select").Rows(0).Item("root")
            mode = ds.Tables("song_select").Rows(0).Item("mode")
            txtname.Text = title
            txtartist.Text = Artist
            ddlcategory.SelectedValue = Category
            txttempo.Text = tempo
            txtpitch.Text = pitch
            txtoctav.Text = octav
            txtroot.Text = root
            txtmode.Text = mode
        End If
    End Sub

    Protected Sub btlDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btlDelete.Click
        conn = New SqlConnection(cs)
        conn.Open()
        da = New SqlDataAdapter
        da.SelectCommand = New SqlCommand
        da.SelectCommand.Connection = conn
        da.SelectCommand.CommandText = "delete from Songs where Title=@Title"
        da.SelectCommand.CommandType = Data.CommandType.Text
        da.SelectCommand.Parameters.AddWithValue("@Title", txtname.Text)
        da.SelectCommand.ExecuteNonQuery()
        Response.Redirect("manage_songs.aspx?msg=Delete")
    End Sub
End Class
