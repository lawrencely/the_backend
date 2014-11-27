// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(function() {

  jQuery(function() {
    return Morris.Line({
      element: 'orders_chart',
      data: $('#orders_chart').data('orders'),
      xkey: 'created_at',
      ykeys: ['id'],
      labels: ['Ordered Id']
    });
  });
    jQuery(function() {
    return Morris.Line({
      element: 'customers_chart',
      data: $('#customers_chart').data('customers'),
      xkey: 'created_at',
      ykeys: ['id'],
      labels: ['Customer Database']
    });
  });
    jQuery(function() {
    return Morris.Line({
      element: 'products_chart',
      data: $('#products_chart').data('products'),
      xkey: 'created_at',
      ykeys: ['id'],
      labels: ['Product Database']
    });
  });
});