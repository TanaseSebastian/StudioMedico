<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@include file="header.jsp" %>
                
					 <!-- Begin Page Content -->
                    <div class="container-fluid">
                    
                    
                    
                   			 <%=messaggio%>
							<%request.getSession().setAttribute("MESSAGGIO", ""); %>

                        <!-- 404 Error Text -->
                        <div class="text-center">
                            <div class="error mx-auto" data-text="404">404</div>
                            <p class="lead text-gray-800 mb-5">Pagina non trovata</p>
                            <p class="text-gray-500 mb-0">Sembra ci sia stato qualche problema durante l'esecuzione dell'applicazione...</p>
                            <p class="text-gray-500 mb-0">Se dovesse persistere questo problema la preghiamo di contattare il servizio tecnico.</p>
                            <a href="dashboard.jsp">&larr; Torna alla Dashboard</a>
                        </div>
                        
                       
							
						

                    </div>
                    <!-- /.container-fluid -->

 <%@include file="footer.jsp" %>      