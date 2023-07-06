<%@ Page Title="" Language="C#" MasterPageFile="~/OnlyAdmin/Admin.Master" AutoEventWireup="true" CodeBehind="ReportInventoryBalance.aspx.cs" Inherits="HNEnterpreneur.OnlyAdmin.ReportInventoryBalance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Custom styles for this template-->
    <link href="../css/sb-admin.css" rel="stylesheet" />
    
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.bootstrap4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.colVis.min.js"></script>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.bootstrap4.min.css" rel="stylesheet">
    
    <script>
        $(document).ready(function () {
            var table = $('#dataTable').DataTable({
                lengthChange: false,
                fixedHeader: true,
                buttons: ['pageLength', 'copy', 'excel', 'pdf', 'print', 'colvis']
            });

            table.buttons().container()
                .appendTo('#dataTable_wrapper .col-md-6:eq(0)');
        });
    </script>
    <style>
        #dataTable{
            font-size: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHeadTitle" runat="server">
    Summary Report
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
<h2>Ingredient Stock In & Out Report on <asp:Label ID="lblDate" runat="server" Text=""></asp:Label></h2>
    <div class="card mb-3">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Ingredient</th>
                            <th>Unit Label</th>
                            <th>Stock In</th>
                            <th>Stock Out</th>
                            <th>Delivering</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>ID</th>
                            <th>Ingredient</th>
                            <th>Unit Label</th>
                            <th>Stock In</th>
                            <th>Stock Out</th>
                            <th>Delivering</th>
                        </tr>
                    </tfoot>
                    <tbody>
                        <asp:DataList ID="dlReport" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("ingID") %></td>
                                    <td><%# Eval("name") %></td>
                                    <td><%# Eval("balanceType") %></td>
                                    <td><%# Eval("stockIn") %></td>
                                    <td><%# Eval("stockOut") %></td>
                                    <td><%# Eval("qtyDelivering") %></td>
                                </tr>
                            </ItemTemplate>
                        </asp:DataList>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
