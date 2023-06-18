<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Authentication.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="KpopZtations.View.Authentication.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="flex flex-col justify-center items-center gap-[20px]">
        <div class="text-dBlue font-bold text-xl">Welcome Back!</div>
        <div class="text-sm font-normal">Login to continue</div>
    </div>

    <div class="flex flex-col w-1/2 justify-center items-center gap-[30px]">
        <div class="w-full">
            <div class="text-base font-medium"><label>Email</label></div>
            <div class="mt-2"><asp:TextBox class="px-3 py-2 w-full rounded[5px]" ID="tbEmail" runat="server"></asp:TextBox></div>
        </div>

        <div class="w-full">
            <div class="text-base font-medium"><label>Password</label></div>
            <div class="mt-2"><asp:TextBox class="px-3 py-2 w-full rounded[5px]" ID="tbPassword" runat="server" TextMode="Password"></asp:TextBox></div>
        </div>

        <div class="w-full">
            <asp:Label class="text-center" ID="lbError" ForeColor="Red" runat="server" Text=""></asp:Label>
        </div>

        <div class="flex items-center justify-center w-full">
            <asp:CheckBox ID="cbRemember" runat="server" />
            <asp:Label ID="lbRemember" runat="server" Text="Remember Me"></asp:Label>
        </div>
    </div>

    <div class="flex items-center justify-center w-1/3"><asp:Button class="w-full bg-dBlue hover:scale-105 text-white font-bold py-2 px-4 rounded" ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" /></div>

    <div class="mt-10">
        <asp:Label class="text-sm font-normal" ID="lbRegister" runat="server" Text="Don't have an account? "></asp:Label>
        <a class="text-dPink font-semibold text-base" href="register.aspx">Register</a>
    </div>



</asp:Content>
