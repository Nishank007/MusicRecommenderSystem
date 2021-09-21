Imports System.Data.SqlClient
Partial Class profile
    Inherits System.Web.UI.Page
    Dim conn As SqlConnection
    Dim comm As SqlCommand
    Public da As SqlDataAdapter
    Public ds As Data.DataSet
    Public dr As SqlDataReader
    Public cs As String = System.Configuration.ConfigurationSettings.AppSettings.Item("connection_string")
    Public msg As String
    Public user_id As Integer
    Public first_name As String
    Public middle_name As String
    Public last_name As String
    Public address As String
    Public state As String
    Public country As String
    Public zipcode As String
    Public mob_no As String
    Public contact_no As String




    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Me.IsPostBack = False Then
            user_id = CType(Session("uid"), Integer)
            conn = New SqlConnection(cs)
            conn.Open()
            da = New SqlDataAdapter
            da.SelectCommand = New SqlCommand
            da.SelectCommand.Connection = conn
            da.SelectCommand.CommandText = "user_select"
            da.SelectCommand.CommandType = Data.CommandType.StoredProcedure
            da.SelectCommand.Parameters.AddWithValue("@user_id", user_id)
            ds = New Data.DataSet
            da.Fill(ds, "user_select")
            first_name = ds.Tables("user_select").Rows(0).Item("first_name")
            middle_name = ds.Tables("user_select").Rows(0).Item("middle_name")
            last_name = ds.Tables("user_select").Rows(0).Item("last_name")
            address = ds.Tables("user_select").Rows(0).Item("address")
            state = ds.Tables("user_select").Rows(0).Item("state")
            country = ds.Tables("user_select").Rows(0).Item("country")
            zipcode = ds.Tables("user_select").Rows(0).Item("zipcode")
            mob_no = ds.Tables("user_select").Rows(0).Item("mobile_no")
            contact_no = ds.Tables("user_select").Rows(0).Item("contact_no")
            txtfirstname.Text = first_name
            txtmiddlename.Text = middle_name
            txtlastname.Text = last_name
            txtaddress.Text = address
            txtstate.Text = state
            txtcountry.Text = country
            txtzip.Text = zipcode
            txtmob.Text = mob_no
            txtcontact1.Text = contact_no
        End If

    End Sub

    Protected Sub btnreg_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnreg.Click
        user_id = CType(Session("aid"), Integer)
        conn = New SqlConnection(cs)
        conn.Open()
        da = New SqlDataAdapter
        da.SelectCommand = New SqlCommand
        da.SelectCommand.Connection = conn
        da.SelectCommand.CommandText = "user_update"
        da.SelectCommand.CommandType = Data.CommandType.StoredProcedure
        da.SelectCommand.Parameters.AddWithValue("@user_id", user_id)
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
        lblshow.Text = "Information Saved Successfully"
    End Sub
End Class
