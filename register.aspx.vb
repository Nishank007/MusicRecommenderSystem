Imports System.Data.SqlClient
Partial Class register
    Inherits System.Web.UI.Page
    Dim conn As SqlConnection
    Dim comm As SqlCommand
    Public da As SqlDataAdapter
    Public ds As Data.DataSet
    Public dr As SqlDataReader
    Public cs As String = System.Configuration.ConfigurationSettings.AppSettings.Item("connection_string")
    Public msg As String

    Protected Sub btnreg_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnreg.Click
        conn = New SqlConnection(cs)
        conn.Open()
        da = New SqlDataAdapter
        da.SelectCommand = New SqlCommand
        da.SelectCommand.Connection = conn
        da.SelectCommand.CommandText = "Select * from MUser where username = '" & txtemail.Text & "'"
        da.SelectCommand.CommandType = Data.CommandType.Text
        ds = New Data.DataSet
        da.Fill(ds, "MUser")
        If ds.Tables("MUser").Rows.Count > 0 Then
            lblshow.Text = "There is Already registration done with this Email ID..Kindly Try with another one."
        Else
            conn = New SqlConnection(cs)
            conn.Open()
            da = New SqlDataAdapter
            da.SelectCommand = New SqlCommand
            da.SelectCommand.Connection = conn
            da.SelectCommand.CommandText = "user_insert"
            da.SelectCommand.CommandType = Data.CommandType.StoredProcedure
            da.SelectCommand.Parameters.AddWithValue("@username", Trim(txtemail.Text))
            da.SelectCommand.Parameters.AddWithValue("@password", txtpass.Text)
            da.SelectCommand.Parameters.AddWithValue("@first_name", Trim(txtfirstname.Text))
            da.SelectCommand.Parameters.AddWithValue("@middle_name", Trim(txtmiddlename.Text))
            da.SelectCommand.Parameters.AddWithValue("@last_name", Trim(txtlastname.Text))
            da.SelectCommand.Parameters.AddWithValue("@address", txtaddress.Text)
            da.SelectCommand.Parameters.AddWithValue("@state", txtstate.Text)
            da.SelectCommand.Parameters.AddWithValue("@country", txtcountry.Text)
            da.SelectCommand.Parameters.AddWithValue("@zipcode", txtzip.Text)
            da.SelectCommand.Parameters.AddWithValue("@mobile_no", txtmob.Text)
            da.SelectCommand.Parameters.AddWithValue("@contact_no", Trim(txtcontact1.Text))
            da.SelectCommand.ExecuteNonQuery()
            'ds = New Data.DataSet
            'da.Fill(ds, "student_insert")
            Response.Redirect("Login.aspx?msg=register")
        End If




        


    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
End Class
    

