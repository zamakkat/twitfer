window.Twitfer.home =
  init_index: ->
    console.log($('#dashboard-chart').data('points'))
    new (Morris.Line) (
      element: 'dashboard-chart'
      data: $('#dashboard-chart').data('points')
      xkey: 'date'
      ykeys: [ 'tweets' ]
      labels: [ 'Tweets' ]
      xLabels: 'day'
    )
