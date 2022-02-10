<?php
include 'inc/header.php'; ?>

<div class="card ">
        <div class="card-header">
          <h3><i class="fas fa-users mr-2"></i>Users<span class="float-right">Welcome <strong>
            <span class="badge badge-lg badge-secondary text-white">
            <?php
$username = Session::get('username');
if (isset($username)) {
  echo $username;
}
 ?></span>

          </strong></span></h3>
        </div>

        <div class="card-body">
</div>

<?php include 'inc/footer.php'; ?>