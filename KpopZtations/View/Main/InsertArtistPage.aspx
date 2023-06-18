<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Main.Master" AutoEventWireup="true" CodeBehind="InsertArtistPage.aspx.cs" Inherits="KpopZtations.View.Main.InsertArtistPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Style/Home.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AuthForm" runat="server">
    <div class="flex flex-col gap-5 p-24 w-2/3 shadow my-5 mx-auto">
        <h1 class="text-4xl font-bold text-dBlue text-center">Insert Artist</h1>
        <div class="flex flex-col gap-3">
            <h2 class="font-semibold">Artist Name</h2>
            <asp:TextBox ID="artistNameTb" CssClass="px-3 py-2 bg-lPink opacity-[80%] w-full rounded-[5px] border-2 border-dPink" runat="server"></asp:TextBox>
        </div>
        <div class="flex flex-col gap-3">
            <h2 class="font-semibold" >Artist Picture: </h2>
            <div class="flex items-center justify-center w-full">
                <label for="dropzone-file" class="flex flex-col items-center justify-center w-full h-64 border-2 border-dPink border-dashed rounded-lg cursor-pointer bg-lPink opacity-[80%] hover:opacity-[100%]">
                    <div class="flex flex-col items-center justify-center pt-5 pb-6">
                        <svg aria-hidden="true" class="w-10 h-10 mb-3 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 16a4 4 0 01-.88-7.903A5 5 0 1115.9 6L16 6a5 5 0 011 9.9M15 13l-3-3m0 0l-3 3m3-3v12"></path></svg>
                        <p id="click-to-upload" class="mb-2 text-sm text-dDPink dark:text-dPink"><span class="font-semibold">Click to upload</span></p>
                        <p class="text-xs text-dDPink dark:text-dPink">.png, .jpg, .jpeg, or .jfif (MAX 2MB)</p>
                    </div>
                    <input id="dropzone-file" type="file" class="hidden" onchange="handleFileSelection()"/>
                </label>
            </div> 
            <asp:FileUpload ID="artistImageFile" CssClass="hidden" runat="server" />
        </div>
        <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
        <div class="flex flex-col gap-3">
            <asp:Button ID="submitBtn" runat="server" Text="Insert Artist" class="text-dPink font-medium border-2 border-dPink px-6 py-2 rounded-full hover:bg-dPink hover:text-white"  OnClick="submitBtn_Click" />
        </div>
    </div>
    
    <script>
        function handleFileSelection() {
        var fileInput = document.getElementById('dropzone-file');
        var click = document.getElementById('click-to-upload');
        var file = fileInput.files[0];
        var artistImageFile = document.getElementById('<%= artistImageFile.ClientID %>');
        artistImageFile.files = fileInput.files;
        click.textContent = file.name;
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
</asp:Content>
