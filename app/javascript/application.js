// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require jquery.ui.datepicker-en
//= require jquery.ui.datepicker-es
//= require jquery.ui.datepicker-fr
//= require bootstrap-datepicker

$("input.datepicker").each(function(input) {
    $(this).datepicker({
        dateFormat: "yy-mm-dd",
        altField: $(this).next()
    })

    // If you use i18n-js you can set the locale like that
    $(this).datepicker("option", $.datepicker.regional[I18n.currentLocale()]);
})