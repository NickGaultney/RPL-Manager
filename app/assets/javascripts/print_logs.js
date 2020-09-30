$(document).ready(function(){
    var counter = 0;
    $(".log-table th").each(function(){
        var width = $('.log-table tr:last td:eq(' + counter + ')').width();
        $(".NewHeader tr").append(this);
        this.width = width;
        counter++;
    });
});