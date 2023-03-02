<?php
	
	require "/opt/lampp/htdocs/reps/config.php";
	 if(empty($_settings->userdata('id'))){
		 echo "<script>alert('plz login');</script>";
		 echo "<script>document.location='admin/login.php'</script>";
	}
	$user_id = $_settings->userdata('id');
	
	$DB_HOST = "127.0.0.1";
	$DB_USER = "root";
	$DB_PASS = "";
	$DB_NAME = "reps_db";

	$conn = mysqli_connect($DB_HOST, $DB_USER, $DB_PASS, $DB_NAME);
	
			
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  	<title>helll</title>
     
    <!-- Theme style -->
    <link rel="stylesheet" href="http://20.70.171.130/reps/dist/css/adminlte.css">
    <link rel="stylesheet" href="http://20.70.171.130/reps/dist/css/custom.css">
    

</head>




<body>
    <section class="content  text-dark">
        <div class="container-fluid">
          <div class="card card-outline rounded-0 card-primary">
  <div class="card-header">
      <h3 class="card-title">List of Requests</h3>
  </div>
  <div class="card-body">
      <div class="container-fluid">
          <table class="table table-hover table-striped" id="list">
              <colgroup>
                  <col width="5%">
                  <col width="15%">
                  <col width="35%">
                  <col width="20%">
                  <col width="10%">
                  <col width="15%">
              </colgroup>
              <thead>
                  <tr>
                      <th>#</th>
                      <th>Phone Number</th>
                      <th>Name</th>
                      <th>Email</th>
                      <th>Status</th>
                      <th>view</th>
                  </tr>
              </thead>
              <tbody>
				  <?php
						$i = 1;
						$q = "SELECT * FROM `docs` WHERE `user_id` = '$user_id'";
						$res = mysqli_query($conn,$q);
						
							//echo "<script>alert('Success')</script>";
							while ($ros = mysqli_fetch_array($res)):
							/*
							$name = $ros['fname'];
							$name .= " " . $ros['lname'];
							echo $name;
							$email = $ros['email'];
							$phone = $ros['phone'];
							$doc = $ros['pdf'];
							*/
							
						
				  
				   ?>
				  
                          <tr>
                          <td class="text-center"><?php echo $i++; ?></td>
                          <td><?php echo $ros['phone'];?></td>
                          <td><?php echo $ros['fname'] . " " . $ros['lname'];?></td>
                          <td><?php echo $ros['addrs'];?></td>
                          <td class="text-center">
                              <span class="badge badge-success px-3 rounded-pill"><?php echo $ros['status'];?></span>
                          </td>
                          <td align="center">
                               <a href="<?php echo $ros['f_doc']; ?>" class="btn btn-flat p-1 btn-default btn-sm dropdown-toggle dropdown-icon" data-toggle="dropdown">
                                        view
                                  <span class="sr-only">Toggle Dropdown</span>
                                </a>
                                <a href="<?php echo $ros['na_id_ph']; ?>" class="btn btn-flat p-1 btn-default btn-sm dropdown-toggle dropdown-icon" data-toggle="dropdown">
                                        view2
                                  <span class="sr-only">Toggle Dropdown</span>
                                </a>
                                <a href="<?php echo $ros['s_doc']; ?>" class="btn btn-flat p-1 btn-default btn-sm dropdown-toggle dropdown-icon" data-toggle="dropdown">
                                        view3
                                  <span class="sr-only">Toggle Dropdown</span>
                                </a>
                                <a href="<?php echo $ros['t_doc']; ?>" class="btn btn-flat p-1 btn-default btn-sm dropdown-toggle dropdown-icon" data-toggle="dropdown">
                                        view4
                                  <span class="sr-only">Toggle Dropdown</span>
                                </a>
                                <div class="dropdown-menu" role="menu">
                                  <a class="dropdown-item edit_data" href="./?page=agents/manage_agent&id=1" ><span class="fa fa-edit text-primary"></span> Edit</a>
                                  <div class="dropdown-divider"></div>
                                  <a class="dropdown-item delete_data" href="javascript:void(0)" data-id="1"><span class="fa fa-trash text-danger"></span> Delete</a>
                                </div>
                          </td>
                      </tr>
                      <?php endwhile; ?>
                                          
                                  </tbody>
          </table>
      </div>
  </div>
</div>
<!-- <script>
  $(document).ready(function(){
      $('.delete_data').click(function(){
          _conf("Are you sure to delete this agent permanently?","delete_agent",[$(this).attr('data-id')])
      })
      $('.edit_data').click(function(){
          uni_modal("<i class='fa fa-edit'></i> Update agent Details","agents/manage_agent.php?id="+$(this).attr('data-id'))
      })
      $('.table').dataTable({
          columnDefs: [
                  { orderable: false, targets: [4,5] }
          ],
          order:[0,'asc']
      });
      $('.dataTable td,.dataTable th').addClass('py-1 px-2 align-middle')
  })
  function delete_agent($id){
      start_loader();
      $.ajax({
          url:_base_url_+"classes/Users.php?f=delete_agent",
          method:"POST",
          data:{id: $id},
          dataType:"json",
          error:err=>{
              console.log(err)
              alert_toast("An error occured.",'error');
              end_loader();
          },
          success:function(resp){
              if(typeof resp== 'object' && resp.status == 'success'){
                  location.reload();
              }else{
                  alert_toast("An error occured.",'error');
                  end_loader();
              }
          }
      })
  }
</script>       -->
   </div> 
      </section>
</body>
</html>
