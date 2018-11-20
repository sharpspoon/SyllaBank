<%@ Page Title="Upload a Syllabus" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AddFaculty.aspx.cs" Inherits="Account_Manage" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Add a Professor</h2>

    <div>
        <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
            <p class="text-success"><%: SuccessMessage %></p>
        </asp:PlaceHolder>

    </div>

    <div class="row">
        <div class="col-md-12">
            <section id="passwordForm">
                <asp:Panel ID="Panel2" runat="server">
                    <asp:Label ID="Label15" runat="server" Font-Size="Large" Text="Prefix:"></asp:Label>
                    <asp:DropDownList ID="prefixDropDownList" runat="server" Font-Size="Medium">
                        <asp:ListItem Value="Mr.">Mr.</asp:ListItem>
                        <asp:ListItem>Ms.</asp:ListItem>
                        <asp:ListItem Value="Mrs.">Mrs.</asp:ListItem>
                        <asp:ListItem>Dr.</asp:ListItem>
                        <asp:ListItem Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <asp:Label ID="Label10" runat="server" Font-Size="Large" Text="First Name:"></asp:Label>
                    <asp:TextBox ID="facultyFirstNameTextBox" runat="server"></asp:TextBox>
                    <asp:Label ID="Label12" runat="server" ForeColor="Red" Text="Cannot be empty!" Visible="False"></asp:Label>
                    <br />
                    <asp:Label ID="Label13" runat="server" Font-Size="Large" Text="Last Name:"></asp:Label>
                    <asp:TextBox ID="facultyLastNameTextBox" runat="server"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label14" runat="server" Font-Size="Large" Text="Gender:"></asp:Label>
                    <asp:DropDownList ID="genderDropDownList" runat="server" Font-Size="Medium">
                        <asp:ListItem Value="Male">Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                        <asp:ListItem Value="Not Sure">Not Sure</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <asp:Label ID="Label6" runat="server" Font-Size="Large" Text="School State: "></asp:Label>
                    <asp:DropDownList ID="DropDownList2" runat="server" Font-Size="Medium" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" DataSourceID="StateCode" DataTextField="stateCode" DataValueField="stateCode">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="StateCode" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [stateCode] FROM [state] ORDER BY [stateCode]"></asp:SqlDataSource>
                    <br />
                    <asp:Label ID="Label1" runat="server" Font-Size="Large" Text="School: " Visible="False"></asp:Label>
                    <asp:DropDownList ID="schoolDropDownList" runat="server" DataSourceID="SchoolName" DataTextField="Institution_Name" DataValueField="Institution_Name" Font-Size="Medium" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Visible="False">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SchoolName" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Institution_Name] FROM [school] WHERE ([Institution_State] = @Institution_State) ORDER BY [Institution_Name]">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList2" Name="Institution_State" PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </asp:Panel>
                <asp:Button ID="Button1" runat="server" Font-Size="Medium" Text="Submit" OnClick="Button1_Click" Visible="False" />
                <br />

            </section>

        </div>
    </div>

</asp:Content>
