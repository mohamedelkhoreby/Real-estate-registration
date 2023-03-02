<?php

	/**


		* DataBase


	*/

	// DataBase Configuration
	ini_set('error_reporting', E_ALL);
	ini_set( 'display_errors', 1 );

	require "/opt/lampp/htdocs/reps/config.php";


	 if(empty($_settings->userdata('id'))){


		 echo "<script>alert('plz login');</script>";


		 echo "<script>document.location='agent/login.php'</script>";


	}

	$DB_HOST = "127.0.0.1";


	$DB_USER = "root";


	$DB_PASS = "";


	$DB_NAME = "reps_db";





	$conn = mysqli_connect($DB_HOST, $DB_USER, $DB_PASS, $DB_NAME);





	//End Configuration


	


	if(isset($_POST['save'])){


		$fname = $_POST['fname'];


		$lname = $_POST['lname'];


		$phone = $_POST['phone'];


		$addrs = $_POST['addrs'];


		$na_id = $_POST['na_id'];


		//upload


		$errors= array();


        $file_name = $_FILES['imgs']['name'];
        $file_tmp =$_FILES['imgs']['tmp_name']; 
		@$file_ext = strtolower(end(explode('.',$_FILES['imgs']['name'])));
		/*********************************************************************/
		$file_name2 = $_FILES['imgs2']['name'];
        $file_tmp2 =$_FILES['imgs2']['tmp_name']; 
		@$file_ext2 = strtolower(end(explode('.',$_FILES['imgs2']['name'])));
		/*********************************************************************/
		$file_name3 = $_FILES['imgs3']['name'];
        $file_tmp3 =$_FILES['imgs3']['tmp_name']; 
		@$file_ext3 = strtolower(end(explode('.',$_FILES['imgs3']['name'])));
		/*********************************************************************/
		$file_name4 = $_FILES['imgs4']['name'];
        $file_tmp4 =$_FILES['imgs4']['tmp_name']; 
		@$file_ext4 = strtolower(end(explode('.',$_FILES['imgs4']['name'])));
		$extensions= array("jpg", "jpeg", "png");

        if(in_array($file_ext,$extensions)=== false){
			echo "<script>alert('extension not allowed, please choose a JPEG or PNG file.')</script>";

        } else if(in_array($file_ext2,$extensions)=== false){
			echo "<script>alert('extension not allowed2, please choose a JPEG or PNG file.')</script>";

        } else if(in_array($file_ext3,$extensions)=== false){
			echo "<script>alert('extension not allowed3, please choose a JPEG or PNG file.')</script>";

        } else if(in_array($file_ext4,$extensions)=== false){
			echo "<script>alert('extension not allowed4, please choose a JPEG or PNG file.')</script>";

        }


         //echo $_settings->userdata('id');


        


        if(empty($errors)==true){


			$file_place = "docs/".$file_name;
			$file_place2 = "docs/".$file_name2;
			$file_place3 = "docs/".$file_name3;
			$file_place4 = "docs/".$file_name4;

			$q = "SELECT * FROM `agent_list` WHERE `email`='$addrs'";

			$res = mysqli_query($conn,$q);

			if(mysqli_num_rows($res) > 0){

				//echo "<script>alert('Success')</script>";


				move_uploaded_file($file_tmp,$file_place);
				move_uploaded_file($file_tmp2,$file_place2);
				move_uploaded_file($file_tmp3,$file_place3);
				move_uploaded_file($file_tmp4,$file_place4);

				$user_id = $_settings->userdata('id');

				$query = "INSERT INTO `docs` (`fname`,`lname`,`phone`,`addrs`,`user_id`, `na_id`, `na_id_ph`, `f_doc`, `s_doc`, `t_doc`) VALUES ('$fname','$lname','$phone','$addrs','$user_id','$na_id', '$file_place', '$file_place2', '$file_place3', '$file_place4')";


				if(mysqli_query($conn,$query)){


				  echo "<script>alert('Success')</script>";


				 }


			} else {


				echo "<script>alert('user not found')</script>";


			}


			


			


       }else{


		   print_r($errors);


		}


        


}


      


		


?>


<!DOCTYPE html>


<html lang="en">


<head>


    <meta charset="UTF-8">


    <meta http-equiv="X-UA-Compatible" content="IE=edge">


    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <link rel="stylesheet" href="http://20.70.171.130/reps/dist/css/adminlte.css">


    <link rel="stylesheet" href="http://20.70.171.130/reps/dist/css/custom.css">


    <title>Document</title>


</head>


<body>


    <section class="content  text-dark">


        <div class="container-fluid">


          <style>


  img#cimg{


      max-height: 20vh;


      width: 100%;


      object-fit: scale-down;


      object-position: center center;


  }


</style>


<div class="card card-outline rounded-0 card-info">


  <div class="card-header">


      <h3 class="card-title">Create New Document</h3>


  </div>


  <div class="card-body">


      <form action="" id="estate-form" enctype="multipart/form-data" method="POST">


          


          <div class="row">


              <div class="col-md-6">


                  <div class="form-group">


                      <label for="fname" class="control-label">First Name</label>


                      <input type="text" name="fname" id="name" class="form-control form-control-sm rounded-0" required value="" />


                  </div>


              </div>


              <div class="col-md-6">


                  <div class="form-group">


                      <label for="lname" class="control-label">Last Name</label>


                      <input type="text" name="lname" id="lname" class="form-control form-control-sm rounded-0" required value="" />


                  </div>


              </div>


          </div>


          <div class="row">


              <div class="col-md-6">


                  <div class="form-group">


                      <label for="Phone" class="control-label">Phone</label>


                      <input type="text" name="phone" id="Phone" class="form-control form-control-sm rounded-0" required value="" />


                  </div>


              </div>


              


              <div class="col-md-6">


                  <div class="form-group">


                      <label for="coordinates" class="control-label">Address</label>


                      <input type="text" name="addrs" id="coordinates" class="form-control form-control-sm rounded-0" required value="" />


                  </div>


              </div>


          </div>


          <div class="col-md-6">


                  <div class="form-group">


                      <label for="coordinates" class="control-label">National ID</label>


                      <input type="text" name="na_id" id="coordinates" class="form-control form-control-sm rounded-0" required value="" />


                  </div>


         


              <div class="col-md-6">


                  <div class="form-group">


                      <label for="" class="control-label">National ID  Photo</label>


                      <div class="custom-file">


                      <input type="file" name="imgs" class="custom-file-input rounded-circle" id="customFile" multiple accept="image/png, image/jpeg" onchange="displayImg2(this,$(this))">


                      <label class="custom-file-label" for="customFile">Choose file</label>
                      
                      <label for="" class="control-label">Frist Document</label>


                      <div class="custom-file">


                      <input type="file" name="imgs2" class="custom-file-input rounded-circle" id="customFile" multiple accept="image/png, image/jpeg" onchange="displayImg2(this,$(this))">


                      <label class="custom-file-label" for="customFile">Choose file</label>
                      <label for="" class="control-label">Second Document</label>


                      <div class="custom-file">


                      <input type="file" name="imgs3" class="custom-file-input rounded-circle" id="customFile" multiple accept="image/png, image/jpeg" onchange="displayImg2(this,$(this))">


                      <label class="custom-file-label" for="customFile">Choose file</label>
                      <label for="" class="control-label">Thired Document</label>


                      <div class="custom-file">


                      <input type="file" name="imgs4" class="custom-file-input rounded-circle" id="customFile" multiple accept="image/png, image/jpeg" onchange="displayImg2(this,$(this))">


                      <label class="custom-file-label" for="customFile">Choose file</label>



                      </div>


                  </div>
					


                  </div>

                  <div class="row my-3">


                                      </div>


                  


              </div>


          </div>


              </div>


          </div>


          <!-- <div class="row">


              <div class="col-md-6">


                  <div class="form-group">


                      <label for="status" class="control-label">Status</label>


                      <select name="status" id="status" class="custom-select custom-select-sm rounded-0 selevt">


                          <option value="1" >Active</option>


                          <option value="0" >Inactive</option>


                      </select>


                  </div>


              </div>


          </div> -->


          


      </form>


  </div>


  <div class="card-footer">


      <input name="save" type="submit" value="Save" class="btn btn-flat btn-primary" form="estate-form">


      <a class="btn btn-flat btn-default" href="?page=estate">Cancel</a>


  </div>


</div>


</div>


      </section>


</body>


</html>


