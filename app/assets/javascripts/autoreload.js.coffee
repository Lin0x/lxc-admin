THRESHOLD = 30

seconds = THRESHOLD
timeout = null

reload = ->
  $('#containers').load('/containers')
  seconds = THRESHOLD

tick = ->
  seconds -= 1
  $('#seconds').html seconds
  if seconds == 0
    reload()
  timeout = window.setTimeout tick, 1000

pause = ->
  window.clearTimeout timeout
  $('#autoreload-pause').replaceWith($('<a href="#" id="autoreload-resume"><span class="glyphicon glyphicon-play"></span></a>'))

resume = ->
  timeout = window.setTimeout tick, 1000
  $('#autoreload-resume').replaceWith($('<a href="#" id="autoreload-pause"><span class="glyphicon glyphicon-pause"></span></a>'))

$ ->
  if $('#containers').length == 1
    $(document).on 'click', '#autoreload-pause', -> pause(); false
    $(document).on 'click', '#autoreload-resume', -> resume(); false
    $(document).on 'click', '#autoreload-trigger', -> reload(); false
    tick()