<div class="card card-outline rounded-0 card-navy">
    <div class="card-header">
        <h3 class="card-title">Inventory List</h3>
        <div class="card-tools">
            <a href="javascript:void(0)" id="create_new" class="btn btn-flat btn-primary"><span class="fas fa-plus"></span>  Add New Inventory</a>
        </div>
    </div>
    <div class="card-body">
        <div class="container-fluid">
            <table class="table table-hover table-striped table-bordered" id="list">
                <colgroup>
                    <col width="5%">
                    <col width="20%">
                    <col width="20%">
                    <col width="20%">
                    <col width="20%">
                    <col width="15%">
                </colgroup>
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Date Created</th>
                        <th>Name</th>
                        <th>Quantity</th>
                        <th>Date Range</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php 
                    $i = 1;
                        $qry = $conn->query("SELECT * from `inventory_list` where delete_flag = 0 order by `name` asc ");
                        while($row = $qry->fetch_assoc()):
                    ?>
                        <tr>
                            <td class="text-center"><?php echo $i++; ?></td>
                            <td><?php echo date("Y-m-d H:i",strtotime($row['date_created'])) ?></td>
                            <td><?php echo $row['name'] ?></td>
                            <td class="text-right"><?php echo $row['quantity'] ?></td>
                            <td><?php echo $row['date_range'] ?></td>
                            <td align="center">
                                 <button type="button" class="btn btn-flat p-1 btn-default btn-sm dropdown-toggle dropdown-icon" data-toggle="dropdown">
                                     Action
                                 <span class="sr-only">Toggle Dropdown</span>
                               </button>
                               <div class="dropdown-menu" role="menu">
                                 <a class="dropdown-item view_data" href="javascript:void(0)" data-id="<?php echo $row['id'] ?>"><span class="fa fa-eye text-dark"></span> View</a>
                                 <div class="dropdown-divider"></div>
                                 <a class="dropdown-item edit_data" href="javascript:void(0)" data-id="<?php echo $row['id'] ?>"><span class="fa fa-edit text-primary"></span> Edit</a>
                                 <div class="dropdown-divider"></div>
                                 <a class="dropdown-item delete_data" href="javascript:void(0)" data-id="<?php echo $row['id'] ?>"><span class="fa fa-trash text-danger"></span> Delete</a>
                               </div>
                            </td>
                        </tr>
                    <?php endwhile; ?>
                </tbody>
            </table>
        </div>
    </div>
</div>


<script>
    $(document).ready(function(){
        $('.delete_data').click(function(){
            _conf("Are you sure to delete this Inventory permanently?","delete_inventory",[$(this).attr('data-id')])
        })
        $('#create_new').click(function(){
            uni_modal("<i class='fa fa-plus'></i> Add New Inventory","inventory/manage_inventory.php")
        })
        $('.view_data').click(function(){
            uni_modal("<i class='fa fa-bars'></i> Inventory Details","inventory/view_inventory.php?id="+$(this).attr('data-id'))
        })
        $('.edit_data').click(function(){
            uni_modal("<i class='fa fa-edit'></i> Update Inventory Details","inventory/manage_inventory.php?id="+$(this).attr('data-id'))
        })
        $('.table').dataTable({
            columnDefs: [
                    { orderable: false, targets: [4] }
            ],
            order:[0,'asc']
        });
        $('.dataTable td,.dataTable th').addClass('py-1 px-2 align-middle')
    })
    function delete_inventory($id){
        start_loader();
        $.ajax({
            url:_base_url_+"classes/Master.php?f=delete_inventory",
            method:"POST",
            data:{id: $id},
            dataType:"json",
            error:err=>{
                console.log(err)
                alert_toast("An error occurred.",'error');
                end_loader();
            },
            success:function(resp){
                if(typeof resp== 'object' && resp.status == 'success'){
                    location.reload();
                }else{
                    alert_toast("An error occurred.",'error');
                    end_loader();
                }
            }
        })
    }
</script>
