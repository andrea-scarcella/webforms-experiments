$(document).ready(function () {
    // Handler for .ready() called.
    //hier moet je optielijst gebruiken om de name attribute goed te wijzigen
    var tt = $("div.optielijst").each(function () {
    //console.log kan problemen met oude IE versies veroorzaken
        //console.log($(this));
        //selecteert de naam van de eerste kind van 'div.optielijst'
        var blockName = $(this).children(":first").attr("name");
        $(this).children().each(function () {
            $(this).attr("name", blockName);
            //console.log($(this).attr("name"));
        });
    });

    //    $("[name$='$RadioButtonGroup']").attr("name", $("[name$='$RadioButtonGroup']").attr("name"));

    //    $("[name$='$RadioButtonGroup']").click(function () {
    //        //set name for all to name of clicked 
    //        $("[name$='$RadioButtonGroup']").attr("name", this.attr("name"));
    //    });

});

