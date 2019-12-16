document.addEventListener 'turbolinks:load', ->
  $('.filter-datatable-tabs').on 'click', ->
    filter = $(this).data('id')
    table = $(this).closest('.datatable-container').find('.datatable_table')
    if table.find('.status_cell').length > 0
      position = table.find('.status_cell').prop('cellIndex')
      #table.DataTable().ajax.reload
      table.DataTable().column( position ).search( filter ).draw()
    if table.find('.fee_status').length > 0
      #table.DataTable().ajax.reload
      table.DataTable().column(0).search( filter ).draw()
  if $('.datatable_table').length > 0
    $('.datatable_table').each () ->
      if !$.fn.DataTable.isDataTable( "#"+$(this).prop("id") )
        set_datatable($(this))
set_datatable = (data)->
  if !$.fn.DataTable.isDataTable( "#"+data.prop("id") )
    table = $("#"+data.prop("id"))
    datatable_table = table.DataTable({
      pagingType: "full_numbers"
      processing: true
      stateSave: true
      serverSide: true
      responsive: true
      ajax:
        url: table.data('source')
        type: 'GET'
      language:
        'sProcessing': 'Procesando...'
        'sLengthMenu': 'Mostrar _MENU_ registros'
        'sZeroRecords': 'No se encontraron resultados'
        'sEmptyTable': 'Ningún dato disponible en esta tabla'
        'sInfo': 'Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros'
        'sInfoEmpty': 'Mostrando registros del 0 al 0 de un total de 0 registros'
        'sInfoFiltered': ''
        'sInfoPostFix': ''
        'sSearch': 'Buscar:'
        'sUrl': ''
        'sInfoThousands': ','
        'sLoadingRecords': 'Cargando...'
        'oPaginate':
          'sFirst': 'Primero'
          'sLast': 'Último'
          'sNext': 'Siguiente'
          'sPrevious': 'Anterior'
        'oAria':
          'sSortAscending': ': Activar para ordenar la columna de manera ascendente'
          'sSortDescending': ': Activar para ordenar la columna de manera descendente'
    })
    switch(data.prop("id"))
      when "customer_datatable"
        yadcf.init(datatable_table, [
          { 
            column_number: 0
            filter_type: "text"
            filter_default_label: "Escribir Nombre"
            filter_container_id: "filter_1"
          }
          {
            column_number: 1
            filter_type: "text"
            filter_default_label: "Escribir RUT"
            filter_container_id: "filter_2"
          }
          {
            column_number: 2
            filter_type: "none"
            filter_container_id: "filter_3"
          }
        ])
    filter = table.closest('.datatable-container').find('.filter-datatable-tabs').first().data('id')
    position = table.find('.status_cell').prop('cellIndex')
    if filter
      datatable_table.column( position ).search( filter ).draw()
document.addEventListener "turbolinks:before-cache", ->
  if $('.datatable_table').length > 0
    $('.datatable_table').each () ->
      datatable = $("#"+$(this).prop("id")).DataTable()
      datatable.destroy()