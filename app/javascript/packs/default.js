
$(document).on('turbolinks:load', function() {
  console.log("turbolinks:load")
  $('#loading').hide();
  // var elem = $("img");

  // if (!elem.prop('complete')) {
  //   console.log("Waiting to be loaded!");
  //   elem.on('load', function() {
  //     console.log("Loaded!");
  //     console.log(this.complete);
  //   });
  // } else {
  //   console.log("Already loaded!");
  // }
});


$(document).on('turbolinks:before-visit', function() {
  // your code
  console.log("turbolinks:before-visit")
});

$(document).on('turbolinks:render', function() {
  // your code
  console.log("turbolinks:render")
});

$(document).on('turbolinks:before-render', function() {
  // your code
  console.log("turbolinks:before-render")
});

$(document).on('turbolinks:request-end', function() {
  // your code

  console.log("turbolinks:request-end")
});

$(document).on('turbolinks:request-start', function() {
  // your code
  console.log("turbolinks:request-start")
});



$(document).on('turbolinks:visit', function() {
  // your code
  console.log("turbolinks:visit")
});
$(document).on('before-visit', function() {
  // your code
  console.log("before-visit")
});
$(document).on('turbolinks:click', function() {
  // your code

  $('#loading').show();
  console.log("turbolinks:click")
});

