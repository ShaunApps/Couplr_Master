
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


    $("#register-form").validate({
                rules: {
                    birthday_one: "required",
                    birthday_two: "required",
                  }
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
