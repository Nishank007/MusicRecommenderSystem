
Partial Class header
    Inherits System.Web.UI.UserControl
    Public userid As Integer
    Public name As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        userid = CType(Session("uid"), Integer)
        name = CType(Session("name"), String)
    End Sub
End Class
