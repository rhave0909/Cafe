<?php
require_once('../../config.php');
if(isset($_GET['id']) && $_GET['id'] > 0){
    $qry = $conn->query("SELECT * from `inventory_list` where id = '{$_GET['id']}' ");
    if($qry->num_rows > 0){
        foreach($qry->fetch_assoc() as $k => $v){
            $$k=$v;
        }
    }
}
?>
<div class="container-fluid">
    <form action="" id="inventory-form">
        <input type="hidden" name ="id" value="<?php echo isset($id) ? $id : '' ?>">
        <div class="form-group">
            <label for="name" class="control-label">Name</label>
            <input type="text" name="name" id="name" class="form-control form-control-sm rounded-0" value="<?php echo isset($name) ? $name : ''; ?>"  required/>
        </div>
        <div class="form-group">
            <label for="quantity" class="control-label">Quantity</label>
            <input type="number" name="quantity" id="quantity" class="form-control form-control-sm rounded-0" value="<?php echo isset($quantity) ? $quantity : ''; ?>"  required/>
        </div>
        <div class="form-group">
            <label for="date_range" class="control-label">Date Range</label>
            <input type="text" name="date_range" id="date_range" class="form-control form-control-sm rounded-0" value="<?php echo isset($date_range) ? $date_range : ''; ?>"  required/>
        </div>
    </form>
</div>
<script>
    $(document).ready(function(){
        $('#inventory-form').submit(function(e){
    e.preventDefault();
    var _this = $(this);
    $('.err-msg').remove();
    start_loader();
    $.ajax({
        url: _base_url_+"classes/Master.php?f=save_inventory",
        data: new FormData($(this)[0]),
        cache: false,
        contentType: false,
        processData: false,
        method: 'POST',
        type: 'POST',
        dataType: 'json',
        error: err => {
            console.log(err);
            alert_toast("An error occurred. Please check the console for details.", 'error');
            end_loader();
        },
        success: function(resp) {
            if (typeof resp == 'object' && resp.status == 'success') {
                location.reload();
            } else if (resp.status == 'failed' && !!resp.msg) {
                var el = $('<div>').addClass("alert alert-danger err-msg").text(resp.msg);
                _this.prepend(el);
                el.show('slow');
                $("html, body,.modal").scrollTop(0);
            } else {
                alert_toast("An error occurred: " + resp.msg, 'error');
            }
            end_loader();
        }
    })
});


    })
</script>
