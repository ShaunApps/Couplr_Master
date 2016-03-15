
 $(document).ready(function ()
 {

    $("#btnShowModal").click(function (e)
    {
       ShowDialog(true);
       e.preventDefault();
    });

    $("#btnClose").click(function (e)
    {
       HideDialog();
       e.preventDefault();
    });

    $("#btnSubmit").click(function (e)
    {
      //  var brand = $("#brands input:radio:checked").val();
      //  $("#output").html("<b>Your favorite mobile brand: </b>" + brand);
      //  HideDialog();
      //  e.preventDefault();
      //  $.get('/conversations/create');
      //  HideDialog();
    });

});


 function ShowDialog(modal)
 {
    $("#overlay").show();
    $("#dialog").fadeIn(300);

    if (modal)
    {
       $("#overlay").unbind("click");
    }
    else
    {
       $("#overlay").click(function (e)
       {
          HideDialog();
       });
    }
 }

 function HideDialog()
 {
    $("#overlay").hide();
    $("#dialog").fadeOut(300);
 }

 /* Float Label Pattern Plugin for Bootstrap 3.1.0 by Travis Wilson
 **************************************************/

 (function ($) {
     $.fn.floatLabels = function (options) {

         // Settings
         var self = this;
         var settings = $.extend({}, options);


         // Event Handlers
         function registerEventHandlers() {
             self.on('input keyup change', 'input, textarea', function () {
                 actions.swapLabels(this);
             });
         }


         // Actions
         var actions = {
             initialize: function() {
                 self.each(function () {
                     var $this = $(this);
                     var $label = $this.children('label');
                     var $field = $this.find('input,textarea').first();

                     if ($this.children().first().is('label')) {
                         $this.children().first().remove();
                         $this.append($label);
                     }

                     var placeholderText = ($field.attr('placeholder') && $field.attr('placeholder') != $label.text()) ? $field.attr('placeholder') : $label.text();

                     $label.data('placeholder-text', placeholderText);
                     $label.data('original-text', $label.text());

                     if ($field.val() == '') {
                         $field.addClass('empty')
                     }
                 });
             },
             swapLabels: function (field) {
                 var $field = $(field);
                 var $label = $(field).siblings('label').first();
                 var isEmpty = Boolean($field.val());

                 if (isEmpty) {
                     $field.removeClass('empty');
                     $label.text($label.data('original-text'));
                 }
                 else {
                     $field.addClass('empty');
                     $label.text($label.data('placeholder-text'));
                 }
             }
         }


         // Initialization
         function init() {
             registerEventHandlers();

             actions.initialize();
             self.each(function () {
                 actions.swapLabels($(this).find('input,textarea').first());
             });
         }
         init();


         return this;
     };

     $(function () {
         $('.float-label-control').floatLabels();
     });
 })(jQuery);
 $(document).ready(function () {
  $('.accordion-tabs-minimal').each(function(index) {
    $(this).children('li').first().children('a').addClass('is-active').next().addClass('is-open').show();
  });
  $('.accordion-tabs-minimal').on('click', 'li > a.tab-link', function(event) {
    if (!$(this).hasClass('is-active')) {
      event.preventDefault();
      var accordionTabs = $(this).closest('.accordion-tabs-minimal');
      accordionTabs.find('.is-open').removeClass('is-open').hide();

      $(this).next().toggleClass('is-open').toggle();
      accordionTabs.find('.is-active').removeClass('is-active');
      $(this).addClass('is-active');
    } else {
      event.preventDefault();
    }
  });
});
