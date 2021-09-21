
Partial Class header
    Inherits System.Web.UI.UserControl
    Public user_id As Integer
    Public uname As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        user_id = CType(Session("aid"), Integer)
        uname = CType(Session("uname"), String)

    End Sub
End Class
