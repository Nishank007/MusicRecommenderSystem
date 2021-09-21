Imports System.Data.SqlClient

Partial Class recommend
    Inherits System.Web.UI.Page


    Dim conn As SqlConnection
    Dim comm As SqlCommand
    Public ds As Data.DataSet
    Public ds1 As Data.DataSet
    Public da As SqlDataAdapter
    Public cs As String = System.Configuration.ConfigurationSettings.AppSettings.Item("connection_string")
    Public username As String
    Public song_id As Integer
    Public user_id As Integer
    Public crating As Integer
    Public trating As Integer
    Public gr As GridViewRow
    Public usercount As Integer
    Public rating As Integer
    Public line_no As String
    Public songs As String = ""
    Public collection(9000) As String
    Public Xt_tem As Double
    Public Xt_pic As Double
    Public Xt_oct As Double
    Public Xt_root As Double
    Public Xt_mod As Double
    Public Yt_tem As Double
    Public Yt_pic As Double
    Public Yt_oct As Double
    Public Yt_root As Double
    Public Yt_mod As Double
    Public Di_tem As Double
    Public Di_pic As Double
    Public Di_oct As Double
    Public Di_root As Double
    Public Di_mod As Double
    Public min_tem As Double
    Public min_pic As Double
    Public min_oct As Double
    Public min_root As Double
    Public min_mod As Double
    Public max_tem As Double
    Public max_pic As Double
    Public max_oct As Double
    Public max_root As Double
    Public max_mod As Double
    Public X_offsprings_tem As Double
    Public X_offsprings_pic As Double
    Public X_offsprings_oct As Double
    Public X_offsprings_root As Double
    Public X_offsprings_mod As Double
    Public Y_offsprings_tem As Double
    Public Y_offsprings_pic As Double
    Public Y_offsprings_oct As Double
    Public Y_offsprings_root As Double
    Public Y_offsprings_mod As Double
    Public tem_dist As Double
    Public pic_dist As Double
    Public oct_dist As Double
    Public root_dist As Double
    Public mod_dist As Double
    Public tempo As Double
    Public pitch As Double
    Public octav As Double
    Public root As Double
    Public mode As Double
    Public tem_diff As Double
    Public pic_diff As Double
    Public oct_diff As Double
    Public root_diff As Double
    Public mod_diff As Double
    Public total_diff As Double
    Public alpha As Double = 0.5
    Public RandomNumGen As New System.Random



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim req, req1 As String
        req = Request.QueryString("cat")
        req1 = Request.QueryString("flag")


    End Sub

    'Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
    'Dim i As Integer = 0
    'collection(i) = "s"
    'conn = New SqlConnection(cs)
    'conn.Open()
    'da = New SqlDataAdapter
    'da.SelectCommand = New SqlCommand
    'da.SelectCommand.Connection = conn
    'da.SelectCommand.CommandText = "select distinct song_id from rating_temp"
    'da.SelectCommand.CommandType = Data.CommandType.Text
    'ds = New Data.DataSet
    'da.Fill(ds, "rating_temp")
    'For Each row As Data.DataRow In ds.Tables("rating_temp").Rows
    '    songs = songs + row.Item("song_id").ToString + ","
    'Next
    'Dim len As Integer = songs.Length
    'songs = songs.Remove(len - 1)
    'conn = New SqlConnection(cs)
    'conn.Open()
    'da = New SqlDataAdapter
    'da.SelectCommand = New SqlCommand
    'da.SelectCommand.Connection = conn
    'da.SelectCommand.CommandText = "Select distinct song_id,rating,id from rating_temp where song_id in (" + songs + ") order by id desc"
    'da.SelectCommand.CommandType = Data.CommandType.Text
    'ds = New Data.DataSet
    'da.Fill(ds, "rating_temp1")

    'For Each row As Data.DataRow In ds.Tables("rating_temp1").Rows
    '    'Dim t As Int16 = ds.Tables("rating_temp1").Rows.Count
    '    song_id = ds.Tables("rating_temp1").Rows(i).Item("song_id")
    '    crating = ds.Tables("rating_temp1").Rows(i).Item("rating")
    '    If collection.Contains(song_id.ToString) Then
    '    Else
    '        user_id = CType(Me.Session("uid"), Integer)
    '        conn = New SqlConnection(cs)
    '        conn.Open()
    '        da = New SqlDataAdapter
    '        da.SelectCommand = New SqlCommand
    '        da.SelectCommand.Connection = conn
    '        da.SelectCommand.CommandText = "insert into favorites (song_id,user_id) Values(" & song_id & "," & user_id & ")"
    '        da.SelectCommand.CommandType = Data.CommandType.Text
    '        da.SelectCommand.ExecuteNonQuery()
    '        conn = New SqlConnection(cs)
    '        conn.Open()
    '        da = New SqlDataAdapter
    '        da.SelectCommand = New SqlCommand
    '        da.SelectCommand.Connection = conn
    '        da.SelectCommand.CommandText = "Select trating,UserCount from Songs where song_id = " & song_id & ""
    '        da.SelectCommand.CommandType = Data.CommandType.Text
    '        ds1 = New Data.DataSet
    '        da.Fill(ds1, "Songs")
    '        trating = ds1.Tables("Songs").Rows(0).Item("trating")
    '        usercount = ds1.Tables("Songs").Rows(0).Item("UserCount")
    '        usercount = usercount + 1
    '        rating = (crating + trating) \ usercount
    '        trating = (crating + trating)
    '        conn = New SqlConnection(cs)
    '        conn.Open()
    '        da = New SqlDataAdapter
    '        da.SelectCommand = New SqlCommand
    '        da.SelectCommand.Connection = conn
    '        da.SelectCommand.CommandText = "update Songs set Rating = " & rating & ", UserCount = " & usercount & ", trating = " & trating & ", crating = " & crating & " where song_id= " & song_id & ""
    '        da.SelectCommand.CommandType = Data.CommandType.Text
    '        da.SelectCommand.ExecuteNonQuery()
    '        collection(i) = song_id.ToString
    '    End If
    '    i = i + 1
    'Next
    ''------------------------------------------------------------------------------------------------------------------------------------------------------------Crossover Begins Here-------------------------------------------------------------------------------------------------------------------------------------------------------------------
    'conn = New SqlConnection(cs)
    'conn.Open()
    'da = New SqlDataAdapter
    'da.SelectCommand = New SqlCommand
    'da.SelectCommand.Connection = conn
    'da.SelectCommand.CommandText = "Select Top 2(crating),song_id,Title,Tempo,Pitch,Octav,Root,Mode from Songs order by crating desc"                                            'Query for selecting 2 highest rating songs
    'da.SelectCommand.CommandType = Data.CommandType.Text
    'ds = New Data.DataSet
    'da.Fill(ds, "songs1")
    'Dim j As Integer = 0
    'For Each row As Data.DataRow In ds.Tables("songs1").Rows
    '    If j = 0 Then
    '        Xt_tem = ds.Tables("songs1").Rows(0).Item("Tempo")   'X-Tempo
    '        Xt_pic = ds.Tables("songs1").Rows(0).Item("Pitch")   'X-Pitch
    '        Xt_oct = ds.Tables("songs1").Rows(0).Item("Octav")   'X-Octav
    '        Xt_root = ds.Tables("songs1").Rows(0).Item("Root")   'X-Root
    '        Xt_mod = ds.Tables("songs1").Rows(0).Item("Mode")    'X-Mode
    '        j = 1
    '    ElseIf j = 1 Then
    '        Yt_tem = ds.Tables("songs1").Rows(1).Item("Tempo")   'Y-Tempo
    '        Yt_pic = ds.Tables("songs1").Rows(1).Item("Pitch")   'Y-Pitch
    '        Yt_oct = ds.Tables("songs1").Rows(1).Item("Octav")   'Y-Octav
    '        Yt_root = ds.Tables("songs1").Rows(1).Item("Root")   'Y-Root
    '        Yt_mod = ds.Tables("songs1").Rows(1).Item("Mode")    'Y-Mode
    '    End If
    'Next
    ''---------------------Distance Calculation Between Xt and Yt-------------------------------------------
    'Di_tem = Math.Abs(Xt_tem - Yt_tem)  'Distance Between Xt_tem and Yt_tem
    'Di_pic = Math.Abs(Xt_pic - Yt_pic)  'Distance Between Xt_pic and Yt_pic
    'Di_oct = Math.Abs(Xt_oct - Yt_oct)  'Distance Between Xt_oct and Yt_oct
    'Di_root = Math.Abs(Xt_root - Yt_root) 'Distance Between Xt_root and Yt_root
    'Di_mod = Math.Abs(Xt_mod - Yt_mod) 'Distance Between Xt_mod and Yt_mod
    ''-------------------------------------------------------------------------------------------------------
    ''----------------------Calculating Intervals------------------------------------------------------------
    'min_tem = (Math.Min(Xt_tem, Yt_tem) - (alpha * Di_tem)) 'interval Between Xt_tem and Yt_tem (Min)
    'min_pic = (Math.Min(Xt_pic, Yt_pic) - (alpha * Di_pic)) 'interval Between Xt_pic and Yt_pic (Min)
    'min_oct = (Math.Min(Xt_oct, Yt_oct) - (alpha * Di_oct)) 'interval Between Between Xt_oct and Yt_oct (Min)
    'min_root = (Math.Min(Xt_root, Yt_root) - (alpha * Di_root)) 'interval Between Xt_root and Yt_root (Min)
    'min_mod = (Math.Min(Xt_mod, Yt_mod) - (alpha * Di_mod)) 'interval Between Xt_mod and Yt_mod (Min)
    'max_tem = (Math.Max(Xt_tem, Yt_tem) - (alpha * Di_tem)) 'interval Between Xt_tem and Yt_tem (Max)
    'max_pic = (Math.Max(Xt_oct, Yt_oct) - (alpha * Di_oct)) 'interval Between Xt_pic and Yt_pic (Max)
    'max_oct = (Math.Max(Xt_tem, Yt_tem) - (alpha * Di_tem)) 'interval Between Xt_oct and Yt_oct (Max)
    'max_root = (Math.Max(Xt_root, Yt_root) - (alpha * Di_root)) 'interval Between Xt_root and Yt_root (Max)
    'max_mod = (Math.Max(Xt_mod, Yt_mod) - (alpha * Di_mod)) 'interval Between Xt_mod and Yt_mod (Max)
    ''-------------------------------------------------------------------------------------------------------
    ''--------------------Generating Offsprings of each chromosome Randomly----------------------------------
    'Randomize()
    'X_offsprings_tem = CDbl((max_tem * Rnd()) + min_tem)  'X offsprings of Tempo
    'X_offsprings_pic = CDbl((max_pic * Rnd()) + min_pic)  'X offsprings of Pitch
    'X_offsprings_oct = CDbl((max_oct * Rnd()) + min_oct)  'X offsprings of Octav
    'X_offsprings_root = CDbl((max_root * Rnd()) + min_root) 'X offsprings of Root
    'X_offsprings_mod = CDbl((max_mod * Rnd()) + min_mod)  'X offsprings of Mode
    'Y_offsprings_tem = CDbl((max_tem * Rnd()) + min_tem) 'Y offsprings of Tempo
    'Y_offsprings_pic = CDbl((max_pic * Rnd()) + min_pic) 'Y offsprings of Picth
    'Y_offsprings_oct = CDbl((max_oct * Rnd()) + min_oct) 'Y offsprings of Octav
    'Y_offsprings_root = CDbl((max_root * Rnd()) + min_root) 'Y offsprings of Root
    'Y_offsprings_mod = CDbl((max_mod * Rnd()) + min_mod) 'Y offsprings of Mode
    ''------------------------------------------------------------------------------------------------------------------------------------------------------------Crossover Ends Here--------------------------------------------------------------------------------------------------------------------------------------------------------------

    ''---------------------------------Euclidean Distance Formula-----------------------
    'tem_dist = Math.Sqrt((X_offsprings_tem - Y_offsprings_tem) ^ 2)
    'pic_dist = Math.Sqrt((X_offsprings_pic - Y_offsprings_pic) ^ 2)
    'oct_dist = Math.Sqrt((X_offsprings_oct - Y_offsprings_oct) ^ 2)
    'root_dist = Math.Sqrt((X_offsprings_root - Y_offsprings_root) ^ 2)
    'mod_dist = Math.Sqrt((X_offsprings_mod - Y_offsprings_mod) ^ 2)

    'conn = New SqlConnection(cs)
    'conn.Open()
    'da = New SqlDataAdapter
    'da.SelectCommand = New SqlCommand
    'da.SelectCommand.Connection = conn
    'If CheckBox1.Checked Then
    '    ' da.SelectCommand.CommandText = "Select song_id,category,Tempo,Pitch,Octav,Root,Mode from Songs where category='" & ddlcategory.SelectedValue & "'"
    'Else
    '    da.SelectCommand.CommandText = "Select song_id,category,Tempo,Pitch,Octav,Root,Mode from Songs"
    'End If
    'da.SelectCommand.CommandType = Data.CommandType.Text
    'ds = New Data.DataSet
    'da.Fill(ds, "songs_master")
    'For Each row As Data.DataRow In ds.Tables("songs_master").Rows
    '    song_id = row.Item("song_id")
    '    tempo = row.Item("Tempo")
    '    pitch = row.Item("Pitch")
    '    octav = row.Item("Octav")
    '    root = row.Item("Root")
    '    mode = row.Item("Mode")
    '    tem_diff = Math.Abs(tem_dist - tempo)
    '    pic_diff = Math.Abs(pic_dist - pitch)
    '    oct_diff = Math.Abs(oct_dist - octav)
    '    root_diff = Math.Abs(root_dist - root)
    '    mod_diff = Math.Abs(mod_dist - mode)

    '    total_diff = tem_diff + pic_diff + oct_diff + root_diff + mod_diff

    '    conn = New SqlConnection(cs)
    '    conn.Open()
    '    da = New SqlDataAdapter
    '    da.SelectCommand = New SqlCommand
    '    da.SelectCommand.Connection = conn
    '    da.SelectCommand.CommandText = "update Songs set diff = " & total_diff & " where song_id = " & song_id & ""
    '    da.SelectCommand.CommandType = Data.CommandType.Text
    '    da.SelectCommand.ExecuteNonQuery()
    'Next

    'SqlDataSource1.SelectCommand = ""
    'SqlDataSource1.SelectCommand = "SELECT [song_id], [Artist], [Title], [Category], [Tempo], [Pitch], [Octav], [Root], [Mode], [UserCount], [Rating], [song_path],[diff] FROM [Songs] order by  [diff]"
    'SqlDataSource1.DataBind()
    'GridView1.DataBind()
    ' End Sub
   
  
End Class
