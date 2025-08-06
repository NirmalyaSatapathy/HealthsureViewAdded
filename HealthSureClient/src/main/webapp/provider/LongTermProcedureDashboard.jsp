<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<f:view>
<html>
<head>
	<meta charset="UTF-8">
	<title>Procedure Action Panel</title>
	<link rel="stylesheet" href="css/healthsure-style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/LongTermProcedureDashboard.css" />
	
</head>
<body>
	<jsp:include page="/navbar/NavProvider.jsp" />

	<div class="nav-container">
		<div class="nav-title">Procedure Action Panel</div>

		<h:form prependId="false">
			<div class="message-container">
				<h:messages globalOnly="true" layout="list" />
			</div>

			<!-- Summary Section -->
			<h:panelGroup rendered="#{not empty procedureController.procedure}">
				<div class="summary-section">
					<div class="summary-item">
						<strong>Recipient Name:</strong>
						<h:outputText value="#{procedureController.procedure.recipient.firstName}" />
					</div>
					<div class="summary-item">
						<strong>Diagnosis:</strong>
						<h:outputText value="#{procedureController.procedure.diagnosis}" />
					</div>
					<div class="summary-item">
						<strong>Procedure Start Date:</strong>
						<h:outputText value="#{procedureController.procedure.fromDate}">
							<f:convertDateTime pattern="dd MMM yyyy" />
						</h:outputText>
					</div>
					<div class="summary-item">
						<strong>Procedure Doctor:</strong>
						<h:outputText value="#{procedureController.procedure.doctor.doctorName}" />
					</div>
				</div>
			</h:panelGroup>

			<!-- Button Row 1: Prescription & Logs -->
			<div class="button-row">
				<div class="button-group">
					<h:commandButton value="Add Prescription"
						action="#{procedureController.createNewPrescription()}"
						styleClass="action-button first-row" />
				</div>
				<div class="button-group">
					<h:commandButton value="Review Prescriptions"
						action="#{procedureController.loadViewPrescriptions()}"
						styleClass="action-button first-row" />
				</div>
				<div class="button-group">
					<h:commandButton value="Add Procedure Logs"
						action="#{procedureController.createNewProcedureLog()}"
						styleClass="action-button first-row" />
				</div>
				<div class="button-group">
					<h:commandButton value="Review Logs"
						action="#{procedureController.loadViewLogs()}"
						styleClass="action-button first-row" />
				</div>
			</div>

			<!-- Button Row 2: Edit & Submit Procedure -->
			<div class="button-row" style="justify-content: center;">
				<h:panelGroup layout="block" rendered="#{procedureController.isFlag() ne false}">
					<div class="button-group">
						<h:commandButton value="Edit Procedure"
							action="#{procedureController.gotoProcedureForm()}"
							styleClass="action-button second-row" />
					</div>
				</h:panelGroup>

				<div class="button-group">
					<h:commandButton value="Submit Procedure"
						action="#{procedureController.procedureSubmit()}"
						styleClass="action-button second-row" />
				</div>
			</div>
		</h:form>
	</div>
</body>
</html>
</f:view>