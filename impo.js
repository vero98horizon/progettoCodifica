$(document).ready(function () {
  var clicks = [0, 0, 0, 0, 0, 0, 0];
  var clicker =[0,0,0,0,0,0,0];

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

  $("#persone").click(function() {
    clicks[1] += 1;
    if(clicks[1] % 2 == 1) {
      $(this).addClass("btnOn");
      $(".persName").addClass("persOn");
    } else {
      $(this).removeClass("btnOn");
      $(".persName").removeClass("persOn");
    }
  });

  $("#luoghi").click(function() {
    clicks[2] += 1;
    if(clicks[2] % 2 == 1) {
      $(this).addClass("btnOn");
      $(".placeName").addClass("placeOn");
    } else {
      $(this).removeClass("btnOn");
      $(".placeName").removeClass("placeOn");
    }
  });

  $(".parKey").on('mouseover mouseout', function() {
    $(".parKey .lineNumber").css({
      "cursor": "default",
      "text-decoration": "none"
    });
  });

  $(".persDesc, .placeDesc, .keyDesc").mouseover(function() {
    $(this).next().show("slow");
  })
  .mouseout(function() {
    $(this).next().hide("slow");
  });
$("#Gap").click(function() {
    clicks[3] += 1;
    if(clicks[3] % 2 == 1) {
      $(this).addClass("btnOn");
      $(".gap").show("slow");
      $("err").css({
        "background-color": "red",
        "font-weight": "bold",
        "padding": "2px"
      });
    } else {
      $(this).removeClass("btnOn");
      $(".gap").hide("slow");
      $("err").css({
        "background-color": "",
        "font-weight": "inherit",
        "padding": ""
      });
    }
  });

  $("#agg").click(function() {
    clicks[4] += 1;
    if(clicks[4] % 2 == 1) {
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
    clicks[5] += 1;
    if(clicks[5] % 2 == 1) {
      $(this).addClass("btnOn");
      $("del").css({"display": "inline"});
    } else {
      $(this).removeClass("btnOn");
      $("del").hide("slow");
    }
  });
  $(".Par1").click(function() {
    clicker[0] += 1;
    if(clicker[0] % 2 == 1) {
      $(this).addClass("btnOn");
      $("#trad_1").show();
      $(".trslText").show();
      $(".txtCont").show();
    }else {
      $(this).removeClass("btnOn");
      $(".trslText").hide();
      $(".txtCont").hide();
    }
  });
  
  $(".Par2").click(function() {
  clicker[1] += 1;
  if(clicker[1] % 2 == 1) {
      $(this).addClass("btnOn");
      $("#trad_2").show();
      $(".txtCont").show();
    }else {
      $(this).removeClass("btnOn");
      $(".trlsText").hide();
      $(".txtCont").hide();
    }
  });
    
  $(".Par3").click(function() {
    clicker[2] += 1;
    if(clicker[2] % 2 == 1) {
      $(this).addClass("btnOn");
      $("#trad_3").show();
      
    }else {
      $(this).removeClass("btnOn");
      $(".trlsText").hide();
      $(".txtCont").hide();
    }
  });

  $(".Par4").click(function() {
    clicker[3] += 1;
    if(clicker[3] % 2 == 1) {
      $(this).addClass("btnOn");
      $("#trad_4").show();
      
    }else {
      $(this).removeClass("btnOn");
      $(".trlsText").hide();
      $(".txtCont").hide();
    }
  });
  $(".Par5").click(function() {
    clicker[4] += 1;
    if(clicker[4] % 2 == 1) {
      $(this).addClass("btnOn");
      $("#trad_5").show();
      
    }else {
      $(this).removeClass("btnOn");
      $(".trlsText").hide();
      $(".txtCont").hide();
    }
  });
  $(".Par6").click(function() {
    clicker[5] += 1;
    if(clicker[5] % 2 == 1) {
      $(this).addClass("btnOn");
      $("#trad_6").show();
      
    }else {
      $(this).removeClass("btnOn");
      $(".trlsText").hide();
      $(".txtCont").hide();
    }
  });

  $(".Par7").click(function() {
    clicker[6] += 1;
    if(clicker[6] % 2 == 1) {
      $(this).addClass("btnOn");
      $("#trad_7").show();

    }else {
      $(this).removeClass("btnOn");
      $(".trlsText").hide();
      $(".txtCont").hide();
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

