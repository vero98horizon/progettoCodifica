$(document).ready(function () {
  var clicks = [0, 0, 0, 0, 0, 0];
  var tr = 0;

  $("abbr").mouseover(function() {
    $(this).next().show("slow");
    $(this).hide("10000");
  });

  $(".expan").mouseover(function() {
    $(this).prev().show("slow");
    $(this).hide("10000");
  });

  $("sic").mouseover(function() {
    $(this).next().show("slow");
    $(this).hide("10000");
  });

  $(".corr").mouseover(function() {
    $(this).prev().show("slow");
    $(this).hide("10000");
  });
  
  

  $("#parKey").click(function() {
    clicks[0] += 1;
    if(clicks[0] % 2 == 1) {
      $(this).addClass("btnOn");
      $(".park").addClass("keyOn");
    } else {
      $(this).removeClass("btnOn");
      $(".park").removeClass("keyOn");
    }
  });

  $("#luoghi").click(function() {
    clicks[1] += 1;
    if(clicks[1] % 2 == 1) {
      $(this).addClass("btnOn");
      $(".placeName").addClass("placeOn");
    } else {
      $(this).removeClass("btnOn");
      $(".placeName").removeClass("placeOn");
    }
  });

  $(".parKey, .luoghi").on('mouseover mouseout', function() {
    $(".parKey .luoghi .lineNumber").css({
      "cursor": "default",
      "text-decoration": "none"
    });
  });

  $(".placeDesc, .keyDesc").mouseover(function() {
    $(this).next().show("slow");
  })
  .mouseout(function() {
    $(this).next().hide("slow");
  });
$("#Gap").click(function() {
    clicks[2] += 1;
    if(clicks[2] % 2 == 1) {
      $(this).addClass("btnOn");
      $(".gap").show("slow");
      
    } else {
      $(this).removeClass("btnOn");
      $(".gap").hide("slow");
    }
  });

  $("#agg").click(function() {
    clicks[3] += 1;
    if(clicks[3] % 2 == 1) {
      $(this).addClass("btnOn");
      $("ins").css({
        "background-color": "lightgreen",
        "font-weight": "bold",
        "padding": "2px"
      });
    } else {
      $(this).removeClass("btnOn");
      $("ins").css({
        "background-color": "",
        "font-weight": "inherit",
        "padding": ""
      });
    }
  });

  $("#canc").click(function() {
    clicks[4] += 1;
    if(clicks[4] % 2 == 1) {
      $(this).addClass("btnOn");
      $("del").css({"display": "inline"});
    } else {
      $(this).removeClass("btnOn");
      $("del").hide("slow");
    }
  });
  
  $("#trslBtn").click(function() {
    tr += 1;
    var index = 1;
    $(".slider input[type=range]").val(index);

    if(tr % 2 == 1) {
      $(this).addClass("btnOn");
      $("#trslWrapper").show("slow");
      $(".slider input[type=range]").val(index);
      $("#tr_Par_006_pr".concat(index)).show();
      $(".pr_p".concat(index)).addClass("orAreaHlight");

      $(".slider input[type=range]").on('input', function() {
        var index = $(this).val();
        $(".trslText").hide();
        $("#tr_Par_006_pr".concat(index)).show();
        $(".textContainer > span").removeClass("orAreaHlight");
        $(".pr_p".concat(index)).addClass("orAreaHlight");
      });

    } else {
      $(this).removeClass("btnOn");
      $("#trslWrapper").hide("slow");
      $(".trslText").hide();
      $(".textContainer > span").removeClass("orAreaHlight");
    }
  });

  $("#vers6").change(function() {
      if(!$(this).is(':checked')) {
        $("#P2_06").show("slow");
        $("#P2_061").hide("slow");
      } else {
        $("#P2_061").show("slow");
        $("#P2_06").hide("slow");
      }
    });

    $("#vers7").change(function() {
      if(!$(this).is(':checked')) {
        $("#P2_07").show("slow");
        $("#P2_071").hide("slow");
      } else {
        $("#P2_071").show("slow");
        $("#P2_07").hide("slow");
      }
  });
});

