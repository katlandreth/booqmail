$ ->
  $(document).on 'change', '#os_select', (evt) ->
    $.ajax 'update_os_versions',
      type: 'GET'
      dataType: 'script'
      data: {
        operating_system_id: $("#os_select option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic os select OK!")
