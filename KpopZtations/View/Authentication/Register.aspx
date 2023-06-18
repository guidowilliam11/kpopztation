<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Authentication.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="KpopZtations.View.Authentication.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="flex flex-col justify-center items-center gap-[20px]">
        <div class="text-dBlue font-bold text-xl">Hello</div>
        <div class="text-sm font-normal">Create a new account</div>
    </div>

    <div class="flex flex-col w-1/2 justify-center items-center gap-[30px]">

        <div class="w-full">
            <div class="text-base font-medium"><label>Name</label></div>
            <div class="mt-2"><asp:TextBox class="px-3 py-2 w-full rounded[5px]" ID="tbName" runat="server"></asp:TextBox></div>
        </div>

        <div class="w-full">
            <div class="text-base font-medium"><label>Email</label></div>
            <div class="mt-2"><asp:TextBox class="px-3 py-2 w-full rounded[5px]" ID="tbEmail" runat="server"></asp:TextBox></div>
        </div>

        <div class="w-full">
            <div class="text-base font-medium"><label>Gender</label></div>
            <div class="flex gap-5 mt-2">
                <div>
                    <asp:RadioButton ID="rbMale" runat="server" GroupName="radioGender" />
                    <asp:Label ID="lbMale" runat="server" Text="Male"></asp:Label>
                </div>

                <div>
                    <asp:RadioButton ID="rbFemale" runat="server" GroupName="radioGender" />
                    <asp:Label ID="lbFemale" runat="server" Text="Female"></asp:Label>
                </div>
            </div>
        </div>

        <div class="w-full">
            <div class="text-base font-medium"><label>Address</label></div>
            <div class="mt-2"><asp:TextBox class="px-3 py-2 w-full rounded[5px]" ID="tbAddress" runat="server"></asp:TextBox></div>
        </div>

        <div class="w-full">
            <div class="text-base font-medium"><label>Password</label></div>
            <div class="mt-2"><asp:TextBox class="px-3 py-2 w-full rounded[5px]" ID="tbPassword" runat="server" TextMode="Password"></asp:TextBox></div>
        </div>

        <div class="w-full">
            <asp:Label class="text-center" ID="lbError" ForeColor="Red" runat="server" Text=""></asp:Label>
        </div>
    </div>

    <div class="flex items-center justify-center w-1/3"><asp:Button class="w-full bg-dBlue hover:scale-105 text-white font-bold py-2 px-4 rounded" ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" /></div>

    <div class="mt-10">
        <asp:Label class="text-sm font-normal" ID="lbLogin" runat="server" Text="Have an account? "></asp:Label>
        <a class="text-dPink font-semibold text-base" href="login.aspx">Login</a>
    </div>

</asp:Content>
