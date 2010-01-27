// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


jQuery.ajaxSetup({
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

jQuery.fn.submitWithAjax = function() {
  this.submit(function() {
    $.post(this.action, $(this).serialize(), null, "script");
    return false;
  })
  return this;
};


$(document).ready(function() {
  $("#new_comment").submitWithAjax();
})



$(function() {
  $('form a.add_child').live('click', function() {
    // Setup
    var assoc   = $(this).attr('data-association');           // Name of child
    var content = $('#' + assoc + '_fields_template').html(); // Fields template

    // Make the context correct by replacing new_<parents> with the generated ID
    // of each of the parent objects
    // var context = ($(this).parents('.fields').children('input:first').attr('name') || '').replace(new RegExp('\[[a-z]+\]$'), '');

    //1 var context = ($(this).parents('#children_fields').children('input:first').attr('name') || '').replace(new RegExp('\[[a-z]+\]$'), '')
    //2 var context = ($(this).siblings('input:last').attr('name') || '').replace(new RegExp('\[[a-z]+\]$'), '');

    // This had to be changed because I use formtastic which puts the inputs under a 'li' tag
    var context = ($(this).parents('.fields').children('li:first').children('input').attr('name') || '').replace(new RegExp('\[[a-z]+\]$'), '')

    // context will be something like this for a brand new form:
    // project[tasks_attributes][1255929127459][assignments_attributes][1255929128105]
    // or for an edit form:
    // project[tasks_attributes][0][assignments_attributes][1]
    // or for a new child on an existing parent
    // project[tasks_attributes][0][assignments_attributes][1255929128105]
    if(context) {
      var parent_names = context.match(/[a-z]+_attributes/g) || []
      var parent_ids   = context.match(/[0-9]+/g)

      for(i = 0; i < parent_names.length; i++) {
        if(parent_ids[i]) {
          content = content.replace(
            new RegExp('(\\[' + parent_names[i] + '\\])\\[.+?\\]', 'g'),
            '$1[' + parent_ids[i] + ']'
          )
        }
      }
    }

    // Make a unique ID for the new child
    var regexp  = new RegExp('new_' + assoc, 'g');
    var new_id  = new Date().getTime();
    content     = content.replace(regexp, new_id)

    if(assoc == "schedulings") {
      $(this).parent().before(content);
    } else {
      $(this).before(content);
    }

// I don't know why I have to work with the children diffentlly
//    $(this).parent().before(content);

    return false;
  });


  $('form a.remove_child').live('click', function() {
    var hidden_field = $(this).prev('input[type=hidden]')[0];
    if(hidden_field) {
      hidden_field.value = '1';
    }
    $(this).parent('.fields').hide();
    return false;
  });
});

