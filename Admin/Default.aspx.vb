
Partial Class _Default
    Inherits System.Web.UI.Page
    Public user_id As Integer
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        user_id = CType(Session("aid"), Integer)
        If user_id = 0 Then
            Response.Redirect("Login.aspx")
        End If
    End Sub
End Class
