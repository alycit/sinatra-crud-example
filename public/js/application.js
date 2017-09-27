$(document).ready(function() {

  // need an event handler for your activity
    // figure out the selector for the thing we need to bind to or add an id to something
    // decide what event you are handling, mouseover, blur, submit, click
    // decide if you need event delegation, is the thing there when the page loads?
    // decide if we need to prevent default behavior
    // make sure your event is bound (console.log something)
  // make the ajax call
    //  set up our ajax function call
    //  decide what our http method is (method)
    //  decide what route we are hitting (url)
    //  decide if we need to data to the route (data)
    //  decide what type of data you are receiving (dataType)
    //  p in your controller method to verify you hit it
  // decide what to do when the call come back from the server
    // set up a done with an anonymous function
    // console.log to see what's coming back
  // go to my controller and adjust what's coming back in the case of an ajax call.
    // decide what to send back (partial, json)
    // send it back
  // back the .done
    // verify that the right thing came back (console.log)
    // decide where to update the page
    // decide what to clean up (show/hide)



  $("#create-game").on("click", function(){
    event.preventDefault();

    var $link = $(this);
    var url = $link.attr("href");

    var request = $.ajax({
      url: url
    });

    request.done(function(response) {
      $link.hide();
      $(".main").append(response);
    });

  });

  $(".main").on("submit", "form", function(){
    event.preventDefault();

    var $form = $(this);
    var url = $form.attr("action");
    var method = $form.attr("method");
    var data = $form.serialize();

    var request = $.ajax({
      url: url,
      method: method,
      data: data
    });

    request.done(function(response) {
      $form.remove();
      $("#create-game").show();
      $(".main ul").append(response);
    });

    request.fail(function(response){
      console.log(response)
    });
  });


});
