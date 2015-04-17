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
//= require underscore
//= require backbone
//= require adventure
//= require_tree ../templates
//= require_tree ./models
//= require_tree ./collections
//= require_tree ./views
//= require_tree ./routers
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

  $('#menu-notifications').on('ajax:success', function(event, data) {
    $('#notifications-block').toggleClass("toggle-hide");
    $('#menu-notifications').html("0");
  });

  $('#random-question-popup').on('ajax:success', function(event, data) {
    $('#modal-container').html(data);
    window.modal.show();
  });

  $('#modal-container').on('ajax:send', '#answer-question-form', function(e) {
    $('#answer-question-form').html('Submitting!');
  });

  $('#modal-container').on('ajax:success', function(event, data) {
    if ($(event.target).is('form#answer-question-form')) {
      $('#modal-container').html("Question submitted!");
      setTimeout(
        function()
        {
          $('#modal-container').html(data);
        }, 1500);
    }
  });

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

$(document).ready(function() {

  $('#demo-acct').on('click', function(e) {
    $('#login-username').val('demo');
    $('#login-password').val('password');

    setTimeout(function() {
      $('.signup').submit();
    }, 2000);
  });

  $('.enlargement-links').on('click', '.enlarge-photo', function(e) {
    e.preventDefault();

    console.log("Hello moto");
    var src = $(this).attr("data-url")
    $('.featured-photo > img').attr("src",src);
  });
});

$(document).ready(function() {
  $('#post-status-form').on('ajax:success', function(e,d) {
    var newStatusFn = _.template($('#new-status-wrapper').html());

    $('.objects-list').prepend(newStatusFn({status: d}));
    $('.update-status-message textarea').val('');
  });

  $('button.change-settings').click(function(e) {
    e.preventDefault();
    $('#modal-container').html($('#change-settings-template').html());
    window.modal.show();
  });

  $('#modal-container').on('ajax:error', function(e,d) {
    alert("There is error");
  });

  $('#modal-container').on('ajax:success', function(e,d) {
    if ($(e.target).is('form.change-settings')) {
      window.modal.hide();
    };
  });

  $('#modal-container').on('ajax:error', function(e,d) {
    alert("There is error");
  });

  $('#modal-container').on('ajax:send', '.send-message', function(e) {
    $('.send-message').html('Sending!!');
  });

  $('#modal-container').on('ajax:success', function(e,d) {
    if ($(e.target).is('form.send-message')) {
      $('#modal-container').html("Sent");
      setTimeout(
        function()
        {
          window.modal.hide();
        }, 2000);
      };
  });

  $('.toggle-view-menu').on('click', function(e) {
    $(this).toggleClass('toggle-hide');
    $('.profile-view').toggleClass('show-questions');
  });

  $('#modal-container').on('click', '.match-send-message', function(e) {
    e.preventDefault();
    displayComposeMessage();
  });

  $( ".message" ).click(function(event) {
    event.preventDefault();
    displayComposeMessage();
  });

  $('.response-edit').on('ajax:success', function(e,d) {
    $(this).html(d);
  });
});
