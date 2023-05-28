//= require jquery
//= require jquery_ujs
//= require jquery-fileupload/basic
//= require jquery-fileupload/vendor/tmpl
//= require popper
//= require bootstrap
//= require_tree .

$(document).on('turbolinks:load', function () {
    $('[data-file-upload]').fileupload();
});
