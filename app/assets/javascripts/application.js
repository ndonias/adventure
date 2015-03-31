// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require underscore
//= require jquery-fileupload
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .

$(document).ready(function() {
  window.modal = {
    show: function(){
      $("body").addClass("has-active-modal");
    },
    hide: function(){
      $("body").removeClass("has-active-modal");
    }
  };

  $(".modal").on("click", function(event){
    $target = $(event.target);

    if($target.is(".modal") || $target.is(".modal-close-button")){
      event.preventDefault();
      window.modal.hide();
    }
  });
});

$('document').ready(function() {
  $(window).bind('scroll', function () {
    if ($(window).scrollTop() > 60) {
      $('.sec-header').addClass('fixed-at-top');
    } else {
      $('.sec-header').removeClass('fixed-at-top');
    }
  });

  $('.create-pm').on('ajax:success', function(e,d) {
    var newMsgFn = _.template($('#new-message-wrapper').html());

    $('.objects-list').append(newMsgFn({message: d}));
    $('.create-pm textarea').val('');
  });
});

function displayComposeMessage() {
  var msgTemplateFn = _.template($('#send-message-template').html());
  var msgForm = msgTemplateFn();

  $('#modal-container').html(msgForm);
  window.modal.show();
};

  $( ".message" ).click(function(event) {
    event.preventDefault();
    displayComposeMessage();
  });