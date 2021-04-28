<%@ page language="java" import="it.meucci.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%DBManager db=new DBManager();%>
<%@include file="header.jsp" %>
                  
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">STATISTICHE COMPLESSIVE:</h1>
                    </div>

                    <!-- <div class="row"> -->

                        <!-- Prenotazioni eseguite -->
                        <div class="col-md-12 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                prenotazioni eseguite:</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800"><%=db.getNumPrenotazioni("Eseguita") %></div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-success"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Prenotazioni in attesa -->
                       <div class="col-md-12 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                               prenotazioni in attesa:</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800"><%=db.getNumPrenotazioni("In attesa") %></div>
                                        </div>
                                        <div class="col-auto">
                                           <i class="fas fa-clipboard-list fa-2x text-primary"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

 						<!-- Prenotazioni non eseguite -->
                       <div class="col-md-12 mb-4">
                            <div class="card border-left-danger shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">
                                               Prenotazioni non eseguite:</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800"><%=db.getNumPrenotazioni("Non eseguita") %></div>
                                        </div>
                                        <div class="col-auto">
                                           <i class="fas fa-clipboard-list fa-2x text-danger"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Numero totale di clienti registrati-->
                        <div class="col-md-12 mb-4">
                            <div class="card border-left-dark shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-dark text-uppercase mb-1">
                                                Numero di clienti:</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800"><%=db.getNumClienti()%></div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-users fa-2x text-dark"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                   <!--  </div> -->

                </div>
                <!-- /.container-fluid -->

 <%@include file="footer.jsp" %>      