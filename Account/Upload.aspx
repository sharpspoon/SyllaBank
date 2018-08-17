<%@ Page Title="Upload a Syllabus" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Upload.aspx.cs" Inherits="Account_Manage" %>

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
                <asp:PlaceHolder runat="server" ID="setPassword" Visible="false">
                    <p>
                        You do not have a local password for this site. Add a local
                        password so you can log in without an external login.
                    </p>
                    <div class="form-horizontal">
                        <h4>Set Password Form</h4>
                        <hr />
                        <asp:ValidationSummary runat="server" ShowModelStateErrors="true" CssClass="text-danger" />
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="password" CssClass="col-md-2 control-label">Password</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="password" TextMode="Password"  CssClass="form-control"  />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="password"
                                    CssClass="text-danger" ErrorMessage="The password field is required."
                                    Display="Dynamic" ValidationGroup="SetPassword" />
                                <asp:ModelErrorMessage runat="server" ModelStateKey="NewPassword" AssociatedControlID="password"
                                    CssClass="text-danger" SetFocusOnError="true" />
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="confirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="confirmPassword" TextMode="Password"  CssClass="form-control"  />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="confirmPassword"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required."
                                    ValidationGroup="SetPassword" />
                                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="confirmPassword"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match."
                                    ValidationGroup="SetPassword" />
                            </div>
                        </div>
                    </div>
                </asp:PlaceHolder>

                <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="1" Height="509px" Width="1131px">
                    <WizardSteps>
                        <asp:WizardStep runat="server" title="Upload Syllabus">
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                        </asp:WizardStep>
                        <asp:WizardStep runat="server" title="Define Syllabus">
                            <asp:Label ID="Label1" runat="server" Text="School"></asp:Label><asp:Button ID="Button1" runat="server" Text="Button" /><br />
                            
                            <asp:Label ID="Label2" runat="server" Text="Course"></asp:Label><br />
                            <asp:Label ID="Label3" runat="server" Text="Year"></asp:Label><br />
                            <asp:Label ID="Label4" runat="server" Text="Semester"></asp:Label><br />
                            <asp:Label ID="Label5" runat="server" Text="Professor"></asp:Label>
                        </asp:WizardStep>
                    </WizardSteps>
                </asp:Wizard>
                

                

            </section>

        </div>
    </div>

</asp:Content>
