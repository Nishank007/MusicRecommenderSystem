﻿Imports System.Data.SqlClient
Partial Class Songs
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

    Public tem_dist1 As Double
    Public pic_dist1 As Double
    Public oct_dist1 As Double
    Public root_dist1 As Double
    Public mod_dist1 As Double

    Public tem_dist2 As Double
    Public pic_dist2 As Double
    Public oct_dist2 As Double
    Public root_dist2 As Double
    Public mod_dist2 As Double

    Public total_diff1 As Double

    Public tem_dist3 As Double
    Public pic_dist3 As Double
    Public oct_dist3 As Double
    Public root_dist3 As Double
    Public mod_dist3 As Double


    Protected Sub Rating1_Changed(ByVal sender As Object, ByVal e As AjaxControlToolkit.RatingEventArgs) Handles Rating1.Changed

        Dim myrating As AjaxControlToolkit.Rating = DirectCast(sender, AjaxControlToolkit.Rating)
        Dim row As GridViewRow = DirectCast(myrating.NamingContainer, GridViewRow)

        If row IsNot Nothing Then
            Dim x As Integer = row.DataItemIndex
            Dim p As Integer = GridView1.PageIndex * 10
            x = x - p
            song_id = GridView1.DataKeys(x).Value
            myrating = DirectCast(sender, AjaxControlToolkit.Rating)
            crating = Integer.Parse(e.Value)
        End If
        conn = New SqlConnection(cs)
        conn.Open()
        da = New SqlDataAdapter
        da.SelectCommand = New SqlCommand
        da.SelectCommand.Connection = conn
        da.SelectCommand.CommandText = "insert into rating_temp (song_id,rating) Values(" & song_id & "," & crating & ")"
        da.SelectCommand.CommandType = Data.CommandType.Text
        da.SelectCommand.ExecuteNonQuery()

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If CheckBox1.Checked Then
            ddlcategory.Enabled = True
        Else
            ddlcategory.Enabled = False
        End If
        If Me.IsPostBack = False Then
            conn = New SqlConnection(cs)
            conn.Open()
            da = New SqlDataAdapter
            da.SelectCommand = New SqlCommand
            da.SelectCommand.Connection = conn
            da.SelectCommand.CommandText = "Truncate Table rating_temp"
            da.SelectCommand.CommandType = Data.CommandType.Text
            da.SelectCommand.ExecuteNonQuery()
        End If
        GridView1.DataBind()
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim i As Integer = 0
        collection(i) = "s"
        conn = New SqlConnection(cs)
        conn.Open()
        da = New SqlDataAdapter
        da.SelectCommand = New SqlCommand
        da.SelectCommand.Connection = conn
        da.SelectCommand.CommandText = "select distinct song_id from rating_temp"
        da.SelectCommand.CommandType = Data.CommandType.Text
        ds = New Data.DataSet
        da.Fill(ds, "rating_temp")
        For Each row As Data.DataRow In ds.Tables("rating_temp").Rows
            songs = songs + row.Item("song_id").ToString + ","
        Next
        Dim len As Integer = songs.Length
        songs = songs.Remove(len - 1)
        conn = New SqlConnection(cs)
        conn.Open()
        da = New SqlDataAdapter
        da.SelectCommand = New SqlCommand
        da.SelectCommand.Connection = conn
        da.SelectCommand.CommandText = "Select distinct song_id,rating,id from rating_temp where song_id in (" + songs + ") order by id desc"
        da.SelectCommand.CommandType = Data.CommandType.Text
        ds = New Data.DataSet
        da.Fill(ds, "rating_temp1")
        
        For Each row As Data.DataRow In ds.Tables("rating_temp1").Rows
            'Dim t As Int16 = ds.Tables("rating_temp1").Rows.Count
            song_id = ds.Tables("rating_temp1").Rows(i).Item("song_id")
            crating = ds.Tables("rating_temp1").Rows(i).Item("rating")
            If collection.Contains(song_id.ToString) Then
            Else
                user_id = CType(Me.Session("uid"), Integer)
                conn = New SqlConnection(cs)
                conn.Open()
                If crating >= 3 Then
                    da = New SqlDataAdapter
                    da.SelectCommand = New SqlCommand
                    da.SelectCommand.Connection = conn
                    da.SelectCommand.CommandText = "insert into favorites (song_id,user_id) Values(" & song_id & "," & user_id & ")"
                    da.SelectCommand.CommandType = Data.CommandType.Text
                    da.SelectCommand.ExecuteNonQuery()
                End If
                conn = New SqlConnection(cs)
                conn.Open()
                da = New SqlDataAdapter
                da.SelectCommand = New SqlCommand
                da.SelectCommand.Connection = conn
                da.SelectCommand.CommandText = "Select trating,UserCount from Songs where song_id = " & song_id & ""
                da.SelectCommand.CommandType = Data.CommandType.Text
                ds1 = New Data.DataSet
                da.Fill(ds1, "Songs")
                trating = ds1.Tables("Songs").Rows(0).Item("trating")
                usercount = ds1.Tables("Songs").Rows(0).Item("UserCount")
                usercount = usercount + 1
                rating = (crating + trating) \ usercount
                trating = (crating + trating)
                conn = New SqlConnection(cs)
                conn.Open()
                da = New SqlDataAdapter
                da.SelectCommand = New SqlCommand
                da.SelectCommand.Connection = conn
                da.SelectCommand.CommandText = "update Songs set Rating = " & rating & ", UserCount = " & usercount & ", trating = " & trating & ", crating = " & crating & " where song_id= " & song_id & ""
                da.SelectCommand.CommandType = Data.CommandType.Text
                da.SelectCommand.ExecuteNonQuery()
                collection(i) = song_id.ToString
                End If
                i = i + 1
        Next
'------------------------------------------------------------------------------------------------------------------------------------------------------------Crossover Begins Here-------------------------------------------------------------------------------------------------------------------------------------------------------------------
        conn = New SqlConnection(cs)
        conn.Open()
        da = New SqlDataAdapter
        da.SelectCommand = New SqlCommand
        da.SelectCommand.Connection = conn
        'OLD_Query 31_5_12
        'da.SelectCommand.CommandText = "Select Top 2(crating),song_id,Title,Tempo,Pitch,Octav,Root,Mode from Songs order by crating desc"                                            'Query for selecting 2 highest rating songs

        'New_Query
        da.SelectCommand.CommandText = "Select crating,song_id,Title,Tempo,Pitch,Octav,Root,Mode from Songs where song_id in (select top 2(song_id) from rating_temp ORDER BY rating desc ) "                                            'Query for selecting 2 highest rating songs
        da.SelectCommand.CommandType = Data.CommandType.Text
        ds = New Data.DataSet
        da.Fill(ds, "songs1")
        Dim j As Integer = 0
        For Each row As Data.DataRow In ds.Tables("songs1").Rows
            If j = 0 Then
                Xt_tem = ds.Tables("songs1").Rows(0).Item("Tempo")   'X-Tempo
                Xt_pic = ds.Tables("songs1").Rows(0).Item("Pitch")   'X-Pitch
                Xt_oct = ds.Tables("songs1").Rows(0).Item("Octav")   'X-Octav
                Xt_root = ds.Tables("songs1").Rows(0).Item("Root")   'X-Root
                Xt_mod = ds.Tables("songs1").Rows(0).Item("Mode")    'X-Mode
                j = 1
            ElseIf j = 1 Then
                Yt_tem = ds.Tables("songs1").Rows(1).Item("Tempo")   'Y-Tempo
                Yt_pic = ds.Tables("songs1").Rows(1).Item("Pitch")   'Y-Pitch
                Yt_oct = ds.Tables("songs1").Rows(1).Item("Octav")   'Y-Octav
                Yt_root = ds.Tables("songs1").Rows(1).Item("Root")   'Y-Root
                Yt_mod = ds.Tables("songs1").Rows(1).Item("Mode")    'Y-Mode
            End If
        Next
        '---------------------Distance Calculation Between Xt and Yt-------------------------------------------
        Di_tem = Math.Abs(Xt_tem - Yt_tem)  'Distance Between Xt_tem and Yt_tem
        Di_pic = Math.Abs(Xt_pic - Yt_pic)  'Distance Between Xt_pic and Yt_pic
        Di_oct = Math.Abs(Xt_oct - Yt_oct)  'Distance Between Xt_oct and Yt_oct
        Di_root = Math.Abs(Xt_root - Yt_root) 'Distance Between Xt_root and Yt_root
        Di_mod = Math.Abs(Xt_mod - Yt_mod) 'Distance Between Xt_mod and Yt_mod
        '-------------------------------------------------------------------------------------------------------
        '----------------------Calculating Intervals------------------------------------------------------------
        min_tem = (Math.Min(Xt_tem, Yt_tem) - (alpha * Di_tem)) 'interval Between Xt_tem and Yt_tem (Min)
        min_pic = (Math.Min(Xt_pic, Yt_pic) - (alpha * Di_pic)) 'interval Between Xt_pic and Yt_pic (Min)
        min_oct = (Math.Min(Xt_oct, Yt_oct) - (alpha * Di_oct)) 'interval Between Between Xt_oct and Yt_oct (Min)
        min_root = (Math.Min(Xt_root, Yt_root) - (alpha * Di_root)) 'interval Between Xt_root and Yt_root (Min)
        min_mod = (Math.Min(Xt_mod, Yt_mod) - (alpha * Di_mod)) 'interval Between Xt_mod and Yt_mod (Min)
        max_tem = (Math.Max(Xt_tem, Yt_tem) - (alpha * Di_tem)) 'interval Between Xt_tem and Yt_tem (Max)
        max_pic = (Math.Max(Xt_oct, Yt_oct) - (alpha * Di_oct)) 'interval Between Xt_pic and Yt_pic (Max)
        max_oct = (Math.Max(Xt_tem, Yt_tem) - (alpha * Di_tem)) 'interval Between Xt_oct and Yt_oct (Max)
        max_root = (Math.Max(Xt_root, Yt_root) - (alpha * Di_root)) 'interval Between Xt_root and Yt_root (Max)
        max_mod = (Math.Max(Xt_mod, Yt_mod) - (alpha * Di_mod)) 'interval Between Xt_mod and Yt_mod (Max)
        '-------------------------------------------------------------------------------------------------------
        '--------------------Generating Offsprings of each chromosome Randomly----------------------------------
        Randomize()
        X_offsprings_tem = CDbl((max_tem * Rnd()) + min_tem)  'X offsprings of Tempo
        X_offsprings_pic = CDbl((max_pic * Rnd()) + min_pic)  'X offsprings of Pitch
        X_offsprings_oct = CDbl((max_oct * Rnd()) + min_oct)  'X offsprings of Octav
        X_offsprings_root = CDbl((max_root * Rnd()) + min_root) 'X offsprings of Root
        X_offsprings_mod = CDbl((max_mod * Rnd()) + min_mod)  'X offsprings of Mode
        Y_offsprings_tem = CDbl((max_tem * Rnd()) + min_tem) 'Y offsprings of Tempo
        Y_offsprings_pic = CDbl((max_pic * Rnd()) + min_pic) 'Y offsprings of Picth
        Y_offsprings_oct = CDbl((max_oct * Rnd()) + min_oct) 'Y offsprings of Octav
        Y_offsprings_root = CDbl((max_root * Rnd()) + min_root) 'Y offsprings of Root
        Y_offsprings_mod = CDbl((max_mod * Rnd()) + min_mod) 'Y offsprings of Mode
       



        '------------------------------------------------------------------------------------------------------------------------------------------------------------Crossover Ends Here--------------------------------------------------------------------------------------------------------------------------------------------------------------

        '---------------------------------Euclidean Distance Formula-----------------------
        tem_dist = Math.Sqrt((X_offsprings_tem - Y_offsprings_tem) ^ 2)
        pic_dist = Math.Sqrt((X_offsprings_pic - Y_offsprings_pic) ^ 2)
        oct_dist = Math.Sqrt((X_offsprings_oct - Y_offsprings_oct) ^ 2)
        root_dist = Math.Sqrt((X_offsprings_root - Y_offsprings_root) ^ 2)
        mod_dist = Math.Sqrt((X_offsprings_mod - Y_offsprings_mod) ^ 2)

        '--------------------------------- Manhattan distance --------------------------------
        tem_dist1 = Math.Abs(X_offsprings_tem) - Math.Abs(Y_offsprings_tem)
        pic_dist1 = Math.Abs(X_offsprings_pic) - Math.Abs(Y_offsprings_pic)
        oct_dist1 = Math.Abs(X_offsprings_oct) - Math.Abs(Y_offsprings_oct)
        root_dist1 = Math.Abs(X_offsprings_root) - Math.Abs(Y_offsprings_root)
        mod_dist1 = Math.Abs(X_offsprings_mod) - Math.Abs(Y_offsprings_mod)
        '---------------------------- Manhattan distance ------------------------------------
        tem_dist2 = ManhattanDistance(X_offsprings_tem, Y_offsprings_tem)
        pic_dist2 = ManhattanDistance(X_offsprings_pic, Y_offsprings_pic)
        oct_dist2 = ManhattanDistance(X_offsprings_oct, Y_offsprings_oct)
        root_dist2 = ManhattanDistance(X_offsprings_root, Y_offsprings_root)
        mod_dist2 = ManhattanDistance(X_offsprings_mod, Y_offsprings_mod)
        '----------------------------- Squared Euclidean distance --------------------------
        ' total_diff1 = (X_offsprings_tem - Y_offsprings_tem) ^ 2 + (X_offsprings_pic - Y_offsprings_pic) ^ 2 + (X_offsprings_oct - Y_offsprings_oct) ^ 2 + (X_offsprings_root - Y_offsprings_root) ^ 2 + (X_offsprings_mod - Y_offsprings_mod) ^ 2

        tem_dist3 = (X_offsprings_tem - Y_offsprings_tem) ^ 2
        pic_dist3 = (X_offsprings_pic - Y_offsprings_pic) ^ 2
        oct_dist3 = (X_offsprings_oct - Y_offsprings_oct) ^ 2
        root_dist2 = (X_offsprings_root - Y_offsprings_root) ^ 2
        mod_dist2 = (X_offsprings_mod - Y_offsprings_mod) ^ 2

        '------------------------------------------------------------------------------------
        conn = New SqlConnection(cs)
        conn.Open()
        da = New SqlDataAdapter
        da.SelectCommand = New SqlCommand
        da.SelectCommand.Connection = conn
        If CheckBox1.Checked Then
            da.SelectCommand.CommandText = "Select song_id,category,Tempo,Pitch,Octav,Root,Mode from Songs where category='" & ddlcategory.SelectedValue & "'"
        Else
            da.SelectCommand.CommandText = "Select song_id,category,Tempo,Pitch,Octav,Root,Mode from Songs"
        End If
        da.SelectCommand.CommandType = Data.CommandType.Text
        ds = New Data.DataSet
        da.Fill(ds, "songs_master")
        For Each row As Data.DataRow In ds.Tables("songs_master").Rows
            song_id = row.Item("song_id")
            tempo = row.Item("Tempo")
            pitch = row.Item("Pitch")
            octav = row.Item("Octav")
            root = row.Item("Root")
            mode = row.Item("Mode")
            tem_diff = Math.Abs(tem_dist - tempo)
            pic_diff = Math.Abs(pic_dist - pitch)
            oct_diff = Math.Abs(oct_dist - octav)
            root_diff = Math.Abs(root_dist - root)
            mod_diff = Math.Abs(mod_dist - mode)

            total_diff = tem_diff + pic_diff + oct_diff + root_diff + mod_diff

            conn = New SqlConnection(cs)
            conn.Open()
            da = New SqlDataAdapter
            da.SelectCommand = New SqlCommand
            da.SelectCommand.Connection = conn
            da.SelectCommand.CommandText = "update Songs set diff = " & total_diff & " where song_id = " & song_id & ""
            da.SelectCommand.CommandType = Data.CommandType.Text
            da.SelectCommand.ExecuteNonQuery()
        Next

        SqlDataSource1.SelectCommand = ""
        SqlDataSource1.SelectCommand = "SELECT [song_id], [Artist], [Title], [Category], [Tempo], [Pitch], [Octav], [Root], [Mode], [UserCount], [Rating], [song_path],[diff] FROM [Songs] order by  [diff] "
        SqlDataSource1.DataBind()
        GridView1.DataBind()

        '----------------------------------------- New Formula  ----------------------------------------

        conn = New SqlConnection(cs)
        conn.Open()
        da = New SqlDataAdapter
        da.SelectCommand = New SqlCommand
        da.SelectCommand.Connection = conn
        da.SelectCommand.CommandText = "truncate table song_temp"
        da.SelectCommand.CommandType = Data.CommandType.Text
        da.SelectCommand.ExecuteNonQuery()

        conn = New SqlConnection(cs)
        conn.Open()
        da = New SqlDataAdapter
        da.SelectCommand = New SqlCommand
        da.SelectCommand.Connection = conn
        da.SelectCommand.CommandText = "insert into song_temp select * from Songs"
        da.SelectCommand.CommandType = Data.CommandType.Text
        da.SelectCommand.ExecuteNonQuery()

        conn = New SqlConnection(cs)
        conn.Open()
        da = New SqlDataAdapter
        da.SelectCommand = New SqlCommand
        da.SelectCommand.Connection = conn
        If CheckBox1.Checked Then
            da.SelectCommand.CommandText = "Select song_id,category,Tempo,Pitch,Octav,Root,Mode from Song_temp where category='" & ddlcategory.SelectedValue & "'"
        Else
            da.SelectCommand.CommandText = "Select song_id,category,Tempo,Pitch,Octav,Root,Mode from Song_temp"
        End If
        da.SelectCommand.CommandType = Data.CommandType.Text
        ds = New Data.DataSet
        da.Fill(ds, "songs_master_new")
        For Each row As Data.DataRow In ds.Tables("songs_master_new").Rows
            song_id = row.Item("song_id")
            tempo = row.Item("Tempo")
            pitch = row.Item("Pitch")
            octav = row.Item("Octav")
            root = row.Item("Root")
            mode = row.Item("Mode")
            tem_diff = Math.Abs(tem_dist3 - tempo)
            pic_diff = Math.Abs(pic_dist3 - pitch)
            oct_diff = Math.Abs(oct_dist3 - octav)
            root_diff = Math.Abs(root_dist3 - root)
            mod_diff = Math.Abs(mod_dist3 - mode)

            total_diff1 = tem_diff + pic_diff + oct_diff + root_diff + mod_diff

            conn = New SqlConnection(cs)
            conn.Open()
            da = New SqlDataAdapter
            da.SelectCommand = New SqlCommand
            da.SelectCommand.Connection = conn
            da.SelectCommand.CommandText = "update Songs set diff = " & total_diff1 & " where song_id = " & song_id & ""
            da.SelectCommand.CommandType = Data.CommandType.Text
            da.SelectCommand.ExecuteNonQuery()
        Next

        SqlDataSource1.SelectCommand = ""
        SqlDataSource1.SelectCommand = "SELECT [song_id], [Artist], [Title], [Category], [Tempo], [Pitch], [Octav], [Root], [Mode], [UserCount], [Rating], [song_path],[diff] FROM [Song_temp] order by  [diff] "
        SqlDataSource1.DataBind()
        GridView1.DataBind()



        '---------------------------------------------------------------------------------------------------------------
        If CheckBox1.Checked Then
            Response.Redirect("recommend.aspx?cat=" & ddlcategory.SelectedValue & "&flag=" & CheckBox1.Checked)
        Else
            Response.Redirect("recommend.aspx?cat=" & ddlcategory.SelectedValue & "&flag=" & CheckBox1.Checked)
        End If
    End Sub

    Protected Sub GridView1_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowCreated
        If (e.Row.RowType = DataControlRowType.DataRow) Then

            e.Row.Attributes.Add("onmouseover", "this.className='OnOver'")
            e.Row.Attributes.Add("onmouseout", "this.className='OnOut'")

        End If
    End Sub
    Public Shared Function ManhattanDistance(newX As Double, newY As Double) As Double
        Dim X As Double() = New Double() {newX}
        Dim Y As Double() = New Double() {newY}
        Dim count As Integer = 0
        Dim distance As Double = 0.0
        Dim sum As Double = 0.0
        If X.GetUpperBound(0) <> Y.GetUpperBound(0) Then
            Throw New System.ArgumentException("the number of elements" + " in X must match the number of elements in Y")
        Else
            count = X.Length
        End If
        For i As Integer = 0 To count - 1
            sum = sum + Math.Abs(X(i) - Y(i))
        Next
        distance = sum
        Return distance
    End Function

   

End Class
