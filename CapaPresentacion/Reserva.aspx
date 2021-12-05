<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reserva.aspx.cs" Inherits="CapaPresentacion.Reserva" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <!-- Stylesheets here -->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.0/css/bootstrap.min.css" />
    <style type="text/css">
      .bs-docs-example {
        position: relative;
        margin: 15px 0;
        padding: 39px 19px 14px;
        background-color: #fff;
        border: 1px solid #ddd;
        -webkit-border-radius: 4px;
        -moz-border-radius: 4px;
        border-radius: 4px;
      }

      .bs-docs-example:after {
        content: 'Example';
        position: absolute;
        top: -1px;
        left: -1px;
        padding: 3px 7px;
        font-size: 12px;
        font-weight: bold;
        background-color: #f5f5f5;
        border: 1px solid #ddd;
        color: #9da0a4;
        -webkit-border-radius: 4px 0 4px 0;
        -moz-border-radius: 4px 0 4px 0;
        border-radius: 4px 0 4px 0;
      }

      .cascading-dropdown-loading {
        cursor: wait;
        background: url('javascript/jcd/res/ajax-loader.gif') 85% center no-repeat transparent;
      }
    </style>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/SyntaxHighlighter/3.0.83/styles/shCore.css" />
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/SyntaxHighlighter/3.0.83/styles/shThemeDefault.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                      <h3 class="card-title">Listado de Pacientes</h3>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                      <table id="pacientesList" class="table table-bordered table-hover table-striped">
                        <thead>
                        <tr>
                          <th>IdPaciente</th>
                          <th>Nombres</th>
                          <th>Apellido</th>
                          <th>Edad</th>
                          <th>Sexo</th>
                          <th>DNI</th>
                          <th>Direccion</th>                          
                          <th>Telefono</th>
                          <th>Acciones</th>
                          
                        </tr>
                        </thead>
                        
                        <td> <%: pacienterese.IdPaciente %> </td>
                        <td> <%: pacienterese.Nombres %> </td>
                        <td> <%: pacienterese.Apellido %> </td>
                        <td> <%: pacienterese.Edad %> </td>
                        <td> <%: pacienterese.Sexo %> </td>
                        <td> <%: pacienterese.NroDocumento%> </td>
                        <td> <%: pacienterese.Direccion%> </td>
                        <td> <%: pacienterese.Telefono %> </td>



                        <tfoot>
                        <tr>                          
                          <th>IdPaciente</th>
                          <th>Nombres</th>
                          <th>Apellido</th>
                          <th>Edad</th>
                          <th>Sexo</th>
                          <th>DNI</th>
                          <th>Direccion</th>                          
                          <th>Telefono</th>
                          <th>Acciones</th>
                          
                        </tr>
                        </tfoot>
                      </table>                      
                    </div>
                    <!-- /.card-body -->
                  </div>
                  
                  <!-- /.card -->
             </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
  </section>


  <section>
   <%-- <form id="myForm">  
        <label for="departmentsDropdown"><b>Departments</b></label>  
        <select class="form-control" id="departmentsDropdown" name="departmentsDropdown"></select>  
    </form>--%>
    <div id="example2" class="bs-docs-example">
        <h4>Phone finder</h4>

        <select class="step1" name="screen">
          <option value="">Screen size</option>
        </select>
        <select class="step2" name="resolution">
          <option value="">Screen resolution</option>
        </select>
        <select class="step3" name="storage">
          <option value="">Storage size</option>
        </select>

        <h4>
          Matches <img src="javascript/jcd/res/ajax-loader.gif" data-bind="visible: loading" />
        </h4>
        <ul data-bind="foreach: phones, visible: phones().length > 0">
          <li>
            <span data-bind="text: maker"></span>
            <span data-bind="text: model"></span>
          </li>
        </ul>
        <p data-bind="visible: phones().length == 0">No matches</p>
      </div>


  </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
  <script src="javascript/Reserva.js" type="text/javascript"></script>

  <!-- Scripts here -->
    <script type="a6016c815b9ee7e458bf455a-text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.2/jquery.js"></script>
    <script type="a6016c815b9ee7e458bf455a-text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/knockout/2.3.0/knockout-min.js"></script>
    <script type="a6016c815b9ee7e458bf455a-text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-mockjax/1.6.1/jquery.mockjax.min.js"></script>
    <script type="a6016c815b9ee7e458bf455a-text/javascript" src="javascript/jcd/res/ajax-mocks.js"></script>
    <script type="a6016c815b9ee7e458bf455a-text/javascript" src="javascript/jcd/dist/jquery.cascadingdropdown.min.js"></script>
    <script type="a6016c815b9ee7e458bf455a-text/javascript">
      function viewmodel() {
        this.phones = ko.observableArray([]);
        this.loading = ko.observable(false);
      }
      
      var example2 = new viewmodel()
      
      ko.applyBindings(example2, document.getElementById('example2'));     
      

      // Example 2
      $('#example2').cascadingDropdown({
        selectBoxes: [
          {
            selector: '.step1',
            source: [
              { label: '4.0"', value: 4 },
              { label: '4.3"', value: 4.3 },
              { label: '4.7"', value: 4.7 },
              { label: '5.0"', value: 5 }
            ]
          },
          {
            selector: '.step2',
            requires: ['.step1'],
            source: function(request, response) {
              $.getJSON('/api/resolutions', request, function(data) {
                var selectOnlyOption = data.length <= 1;
                response(
                  $.map(data, function(item, index) {
                    return {
                      label: item + 'p',
                      value: item,
                      selected: selectOnlyOption
                    };
                  })
                );
              });
            }
          },
          {
            selector: '.step3',
            requires: ['.step1', '.step2'],
            requireAll: true,
            source: function(request, response) {
              $.getJSON('/api/storages', request, function(data) {
                response(
                  $.map(data, function(item, index) {
                    return {
                      label: item + ' GB',
                      value: item,
                      selected: index == 0
                    };
                  })
                );
              });
            },
            onChange: function(event, value, requiredValues, requirementsMet) {
              if (!requirementsMet) return;

              example2.loading(true);

              var ajaxData = requiredValues;
              ajaxData[this.el.attr('name')] = value;
              $.getJSON('/api/phones', ajaxData, function(data) {
                example2.phones(data);
                example2.loading(false);
              });
            }
          }
        ]
      });
      
    </script>
    <script type="a6016c815b9ee7e458bf455a-text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/SyntaxHighlighter/3.0.83/scripts/shCore.js"></script>
    <script type="a6016c815b9ee7e458bf455a-text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/SyntaxHighlighter/3.0.83/scripts/shBrushJScript.js"></script>
    <script type="a6016c815b9ee7e458bf455a-text/javascript">
      SyntaxHighlighter.all();
    </script>
  <script src="javascript/jcd/res/rocket-loader.min.js" data-cf-settings="a6016c815b9ee7e458bf455a-|49" defer=""></script>
  <script src="javascript/jcd/res/rocket-loader.min.js" data-cf-settings="a6016c815b9ee7e458bf455a-|49" defer=""></script>

</asp:Content>
