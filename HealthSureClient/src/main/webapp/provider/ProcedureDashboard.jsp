<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<f:view>
<html>
<head>
	<meta charset="UTF-8">
	<title>Procedure Navigation Panel</title>
	<link rel="stylesheet" href="css/healthsure-style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/ProcedureDashboard.css" />
</head>
<body>
	<jsp:include page="/navbar/NavProvider.jsp" />

	<div class="nav-container">
		<div class="nav-title">Procedure Navigation Panel</div>

		<h:form prependId="false">

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
						<strong>Procedure Date:</strong>
						<h:outputText value="#{procedureController.procedure.procedureDate}">
							<f:convertDateTime pattern="dd MMM yyyy" />
						</h:outputText>
					</div>
					<div class="summary-item">
						<strong>Procedure Doctor:</strong>
						<h:outputText value="#{procedureController.procedure.doctor.doctorName}" />
					</div>
				</div>
			</h:panelGroup>

			<!-- 🔵 Button Row 1: Add & Review -->
			<div class="button-row">
				<div class="button-group">
					<h:commandButton value="Add Prescription"
						action="#{procedureController.createNewPrescription()}"
						styleClass="action-button first-row" />
				</div>
				<h:panelGroup rendered="#{not empty procedureController.prescriptions}">
					<div class="button-group">
						<h:commandButton value="Review Prescriptions"
							action="#{procedureController.loadViewPrescriptions()}"
							styleClass="action-button first-row" />
					</div>
				</h:panelGroup>
			</div>

			<!-- 🟢 Button Row 2: Submit & Edit -->
			<div class="button-row">
				<div class="button-group">
					<h:commandButton value="Submit Procedure"
						action="#{procedureController.procedureSubmit()}"
						styleClass="action-button second-row" />
				</div>
				<h:panelGroup layout="block" rendered="#{procedureController.isFlag() ne false}">
					<div class="button-group">
						<h:commandButton value="Edit Procedure"
							action="#{procedureController.gotoProcedureForm()}"
							styleClass="action-button second-row" />
					</div>
				</h:panelGroup>
			</div>

		</h:form>
	</div>
</body>
</html>
</f:view>