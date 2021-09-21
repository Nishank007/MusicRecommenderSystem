
Partial Class Share
    Inherits System.Web.UI.Page
    Public user_id As Integer
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        user_id = CType(Session("uid"), Integer)

        SqlDataSource1.SelectCommand = "SELECT s.[Song_id],s.Title,s.song_path ,sha.[From_user], sha.[To_user],(m.first_name+' '+m.last_name)as name FROM [songs] s join share sha on (s.song_id=sha.song_id) join MUser m on(sha.from_user=m.user_id) and sha.To_user=" & user_id & ""
        SqlDataSource1.DataBind()
    End Sub
End Class
