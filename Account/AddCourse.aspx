<%@ Page Title="Upload a Syllabus" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AddCourse.aspx.cs" Inherits="Account_Manage" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>

    <div>
        <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
            <p class="text-success"><%: SuccessMessage %></p>
        </asp:PlaceHolder>

    </div>

    <div class="row">
        <div class="col-md-12">
            <section id="passwordForm">
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:Panel ID="Panel2" runat="server">
                    <asp:Label ID="Label6" runat="server" Font-Size="Large" Text="State: "></asp:Label>
                    <asp:DropDownList ID="DropDownList2" runat="server" Font-Size="Medium" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" DataSourceID="StateCode" DataTextField="stateCode" DataValueField="stateCode">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="StateCode" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [stateCode] FROM [state] ORDER BY [stateCode]"></asp:SqlDataSource>
                </asp:Panel>
                <asp:Panel ID="Panel1" runat="server">
                    <asp:Label ID="Label1" runat="server" Font-Size="Large" Text="School: " Visible="False"></asp:Label>
                    <asp:DropDownList ID="schoolDropDownList" runat="server" Font-Size="Medium" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Visible="False" DataSourceID="SchoolName" DataTextField="Institution_Name" DataValueField="Institution_Name">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SchoolName" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Institution_Name] FROM [school] WHERE ([Institution_State] = @Institution_State) ORDER BY [Institution_Name]">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList2" Name="Institution_State" PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </asp:Panel>
                <asp:Panel ID="Panel3" runat="server">
                    <asp:Label ID="Label7" runat="server" Font-Size="Large" Text="Course: " Visible="False"></asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
                    <asp:Label ID="Label11" runat="server" ForeColor="Red" Text="Cannot be empty!" Visible="False"></asp:Label>
                </asp:Panel>
                <asp:Panel ID="Panel4" runat="server">
                    <asp:Panel ID="Panel6" runat="server">
                        <asp:Label ID="Label10" runat="server" Font-Size="Large" Text="Professor: " Visible="False"></asp:Label>
                        <asp:TextBox ID="facultyTextBox" runat="server" Visible="False"></asp:TextBox>
                        <asp:Label ID="Label12" runat="server" ForeColor="Red" Text="Cannot be empty!" Visible="False"></asp:Label>
                    </asp:Panel>
                    <asp:Label ID="Label8" runat="server" Font-Size="Large" Text="Year: " Visible="False"></asp:Label>
                    <asp:DropDownList ID="DropDownList5" runat="server" Font-Size="Medium" DataSourceID="YearDataSource" DataTextField="Year" DataValueField="Year" Visible="False">
                        <asp:ListItem Value="2008">2008</asp:ListItem>
                        <asp:ListItem Value="2009">2009</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="YearDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Year] FROM [year] ORDER BY [Year] DESC"></asp:SqlDataSource>
                </asp:Panel>
                <asp:Panel ID="Panel5" runat="server">
                    <asp:Label ID="Label9" runat="server" Font-Size="Large" Text="Semester: " Visible="False"></asp:Label>
                    <asp:DropDownList ID="DropDownList6" runat="server" Font-Size="Medium" Visible="False">
                        <asp:ListItem Value="Spring">Spring</asp:ListItem>
                        <asp:ListItem>Summer</asp:ListItem>
                        <asp:ListItem Value="Fall">Fall</asp:ListItem>
                    </asp:DropDownList>
                </asp:Panel>
                <asp:Button ID="Button1" runat="server" Font-Size="Medium" Text="Submit" OnClick="Button1_Click" Visible="False" />
                <br />

            </section>

        </div>
    </div>

</asp:Content>
