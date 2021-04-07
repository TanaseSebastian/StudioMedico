<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
</div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Team di Tanase VBI 2021</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Sicuro di voler uscire?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Seleziona "Logout" se sei sicuro di voler terminare la sessione.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Annulla</button>
                    <a class="btn btn-primary" href="logout">Logout</a>
                </div>
            </div>
        </div>
    </div>
    <!-- modulo per scelta del dipartimento-->
 <div class="modal" id="chooseDepartment"" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4>
                Seleziona il dipartimento interessato.
              </h4>
          </div>
          <div class="modal-body">
          <form action="gestprenotazioni?cmd=getoptions2" method="post" id="chooseDepartmentForm" name="chooseDepartmentForm" role="form" >
            <div class="col-md-12 form-group">
				<center>
				<select id="select-dipartimenti" name="select-dipartimenti" class="col-md-6 " required>
				 <option value="" disabled selected hidden>Seleziona dipartimento</option>
					<option value="1">Cardiologia</option>
					<option value="2">Neurologia</option>
					<option value="3">Gastroenterologia</option>
					<option value="4">Pediatria</option>
					<option value="5">Oculistica</option>
				</select>
				</center>
            </div>
          <div class="text-center" style="margin-top: 30px;">
           <button type="button" class="btn btn-danger" data-dismiss="modal">Annulla</button>
          <button type="submit" class="btn btn-primary">Prosegui <i class="fa fa-arrow-right" aria-hidden="true"></i></button>
          </div>
        </form>
          </div>
      </div>
  </div>
  </div>

    <!-- Bootstrap core JavaScript-->
    <script src="app/vendor/jquery/jquery.min.js"></script>
    <script src="app/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="app/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="app/js/sb-admin-2.min.js"></script>
    
        <!-- Page level plugins -->
    <script src="app/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="app/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="app/js/demo/datatables-demo.js"></script>
    
    <script type="text/javascript">
	$(document).ready(function(){
		$("#checkboxAll").click(function(){
			$(".check").prop("checked",$ (this).prop("checked"));
		});
	});
    </script>
    <script>
    function submitForm(action)
    {
        document.getElementById('formPrenotazioni').action = action;
        document.getElementById('formPrenotazioni').submit();
    }
</script>
	<!--  Flatpickr  -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/flatpickr.js"></script>
</body>
<script>
  
  $("#date").flatpickr({
		minDate: "today",
	    dateFormat: "Y-m-d",
	    "disable": [
	        function(date) {
	           return (date.getDay() === 0 || date.getDay() === 6);  // disable weekends
	        }
	    ],
	    "locale": {
	        "firstDayOfWeek": 1 // set start day of week to Monday
	    }
	});
  </script>

</body>

</html>