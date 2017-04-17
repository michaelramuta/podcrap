// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require_tree .

$(document).on('turbolinks:load', function() {
  $(function(){ $(document).foundation(); });

  $("#js-archive-populate").submit(function(event) {
    var episodeLink = $("input[name='js-archive-link']").val();
    if (episodeLink.indexOf("archive.org/details/") >= 0) {
      var archive_identifier = episodeLink.replace(/^.+\/details\//g,'');
      var archive_link = "http://archive.org/metadata/" + archive_identifier;
      $.get(archive_link, function(data) {
        try {
          var archive_file = data['files'].find(isOriginal);
          var archive_size = archive_file['size'];
          var archive_name = archive_file['name'];
          var archive_link = 'http://archive.org/download/' + archive_identifier + '/' + archive_name;
          var length_raw = data['files'].find(hasLength)['length'];
          var length = convertDuration(length_raw);
          $("input[id='episode_audio_link']").val(archive_link);
          $("input[id='episode_length']").val(archive_size);
          $("input[id='episode_duration']").val(length);
        } catch(error) {
          $("#js-archive-warning").html('<b>Sorry buddy, that link was no good</b>');
        }
      });
    } else {
      $("#js-archive-warning").html('<b>Sorry buddy, that link was no good</b>');
    }
    event.preventDefault();
  });
});

function isOriginal(element) {
  return element['source'] === 'original';
}

function hasLength(element) {
  return 'length' in element && element['length'].indexOf(':') == -1;
}

function convertDuration(length_raw) {
  var seconds = Number(length_raw);
  var h = Math.floor(seconds / 3600);
  var m = Math.floor(seconds % 3600 / 60);
  var s = Math.floor(seconds % 3600 % 60);
  return ((h > 0 ? h + ":" + (m < 10 ? "0" : "") : "") + m + ":" + (s < 10 ? "0" : "") + s);
}
