<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Main.Master" AutoEventWireup="true" CodeBehind="UpdateProfilePage.aspx.cs" Inherits="KpopZtations.View.Main.UpdateProfilePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AuthForm" runat="server">
    <div class="flex flex-col justify-center items-center gap-[20px]">
        <div class="mt-10 text-dBlue font-bold text-xl">Hello</div>
        <div class="text-sm font-normal">Create a new account</div>
    </div>

    <div class="mx-auto flex flex-col w-1/2 justify-center items-start gap-[30px]">
        <div class="flex flex-col gap-3 w-full">
            <div class="text-base font-medium"><label>Name</label></div>
            <div class="mt-2 w-full"><asp:TextBox ID="tbName" class="px-3 py-2 w-full rounded[5px] border-2 bg-lPink opacity-[80%]" runat="server"></asp:TextBox></div>
        </div>

        <div class="flex flex-col gap-3 w-full">
            <div class="text-base font-medium"><label>Email</label></div>
            <div class="mt-2"><asp:TextBox class="px-3 py-2 w-full rounded[5px] border-2 bg-lPink opacity-[80%]" ID="tbEmail" runat="server"></asp:TextBox></div>
        </div>

        <div>
            <div><label>Gender</label></div>
            <div>
                    <asp:RadioButton ID="rbMale" runat="server" GroupName="radioGender"/>
                    <asp:Label ID="lbMale" runat="server" Text="Male"></asp:Label>

                    <asp:RadioButton ID="rbFemale" runat="server" GroupName="radioGender"/>
                    <asp:Label ID="lbFemale" runat="server" Text="Female"></asp:Label>
            </div>
        </div>

        <div class="flex flex-col gap-3 w-full">
            <div class="text-base font-medium"><label>Address</label></div>
            <div class="mt-2"><asp:TextBox class="px-3 py-2 w-full rounded[5px] border-2 bg-lPink opacity-[80%]" ID="tbAddress" runat="server"></asp:TextBox></div>
        </div>

        <div class="flex flex-col gap-3 w-full">
            <div class="text-base font-medium"><label>Password</label></div>
            <div class="mt-2"><asp:TextBox class="px-3 py-2 w-full rounded[5px] border-2 bg-lPink opacity-[80%]" ID="tbPassword" runat="server" TextMode="Password"></asp:TextBox></div>
        </div>

        <asp:Label class="text-center" ID="lbError" ForeColor="Red" runat="server" Text=""></asp:Label>

        <div><asp:Button ID="btnUpdate" runat="server" Text="Update Profile" OnClick="btnUpdate_Click"/></div>

        <div><asp:Button  class="text-dPink font-medium border-2 border-dPink px-6 py-2 rounded-full hover:bg-dPink hover:text-white" ID="btnDelete" runat="server" Text="Delete Account" OnClick="btnDelete_Click" BackColor="Red"/></div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
</asp:Content>
