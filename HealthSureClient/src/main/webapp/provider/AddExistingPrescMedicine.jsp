<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>

<f:view>
	<html>
<head>
<title>Add Prescribed Medicine</title>
<style>
html, body {
	margin: 0;
	padding: 0;
	height: 100%;
	font-family: 'Segoe UI', sans-serif;
	background-color: #f4f8fb;
	overflow: hidden;
}

.page-wrapper {
	display: flex;
	flex-direction: column;
	height: 100vh;
}

/* Smaller input field */
.input-small {
	width: 160px;
	margin: 0 auto;
	padding: 6px;
	font-size: 14px;
}

/* Smaller button */
.btn-small {
	width: auto;
	min-width: 100px;
	padding: 6px 12px;
	font-size: 14px;
}

/* Optional: reduce max width of the whole group */
.compact-auth {
	max-width: 350px;
	margin: 0 auto;
	text-align: center;
}

.main-content {
	flex-grow: 1;
	padding: 10px;
	overflow-y: auto;
	display: flex;
	justify-content: center;
	align-items: flex-start;
	margin-top: 90px;
}

.form-container {
	max-width: 600px;
	width: 100%;
	padding: 15px;
	background-color: #ffffff;
	border-radius: 10px;
	box-shadow: 0 0 10px #ccc;
}

.form-title {
	text-align: center;
	font-size: 22px;
	margin-bottom: 12px;
	color: #2a3f54;
}

.form-grid {
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	gap: 8px;
}

.form-group {
	display: flex;
	flex-direction: column;
}

.form-group.full-width {
	grid-column: 1/-1;
}

label {
	font-weight: bold;
	margin-bottom: 4px;
	font-size: 15px;
}

.form-control {
	width: 100%;
	padding: 6px;
	border-radius: 4px;
	border: 1px solid #ccc;
	box-sizing: border-box;
	font-size: 15px;
}

.error {
	display: block;
	color: #f44336 !important;
	font-size: 14px;
	font-weight: 600;
	margin-top: 3px;
}

.button-group {
	display: flex;
	justify-content: center;
	gap: 10px;
	margin-top: 10px;
}

/* Shared button styles */
.btn-add, .btn-reset, .action-button {
	padding: 8px 14px;
	font-size: 14px;
	border: none;
	border-radius: 5px;
	color: white;
	cursor: pointer;
}

.btn-add {
	background-color: #28a745;
}

.btn-add:hover {
	background-color: #218838;
}

.btn-reset {
	background-color: #007bff;
}

.btn-reset:hover {
	background-color: #0056b3;
}

.action-button {
	background-color: #6c757d;
}

.action-button:hover {
	background-color: #5a6268;
}

/* New: Button row for authentication */
.auth-button-row {
	display: flex;
	justify-content: center;
	gap: 10px;
	margin-top: 12px;
}

/* Updated: Authenticate button */
.btn-authenticate {
	background-color: #4CAF50;
	color: white;
	padding: 8px 16px;
	border: none;
	border-radius: 6px;
	font-size: 14px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.btn-authenticate:hover {
	background-color: #388e3c;
}

/* New: Back button */
.btn-back {
	background-color: #343a40;
	color: white;
	padding: 8px 16px;
	border: none;
	border-radius: 6px;
	font-size: 14px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.btn-back:hover {
	background-color: #23272b;
}
</style>
<!-- Prevent HTML caching -->
<meta http-equiv="Cache-Control"
	content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />

<script type="text/javascript">
        window.addEventListener('pageshow', function(event) {
            var navEntries = performance.getEntriesByType?.("navigation");
            var navType = navEntries?.length ? navEntries[0].type : "";
            if (event.persisted || navType === "back_forward") {
                document.querySelectorAll('.error').forEach(el => el.textContent = '');
            }
        });
    </script>
</head>
<body>
	<div class="page-wrapper">
		<jsp:include page="/navbar/NavProvider.jsp" />

		<div class="main-content">
			<div class="form-container">
				<div class="form-title">Add Prescribed Medicine</div>

				<h:form prependId="false">
					<h:messages globalOnly="true" styleClass="error" />
					<h:panelGroup
						rendered="#{procedureController.procedure.type ne 'SINGLE_DAY' and not procedureController.validDoctor}">
						<div class="form-group center-group compact-auth">
							<h:outputLabel for="doctorId" value="Enter Doctor ID:" />

							<h:inputText id="doctorId"
								value="#{procedureController.doctorId}"
								styleClass="form-control input-small" />

							<h:message for="doctorId" styleClass="error" />

							<div class="auth-button-row">
								<h:commandButton value="Authenticate"
									action="#{procedureController.authenticatePrescriptionDoctor(procedureController.doctorId)}"
									styleClass="btn-small btn-authenticate" />

								<h:commandButton value="Back"
									action="ViewMedicines?faces-redirect=true"
									styleClass="btn-small btn-back" />
							</div>
						</div>
					</h:panelGroup>
					<h:panelGroup rendered="#{procedureController.validDoctor}">
						<div class="form-grid">
							<div class="form-group">
								<label for="prescribedId">Prescribed ID</label>
								<h:inputText id="prescribedId"
									value="#{procedureController.prescribedMedicine.prescribedId}"
									readonly="true" styleClass="form-control" />
								<h:message for="prescribedId" styleClass="error" />
							</div>

							<div class="form-group">
								<label for="prescriptionId">Prescription ID</label>
								<h:inputText id="prescriptionId"
									value="#{procedureController.prescription.prescriptionId}"
									readonly="true" styleClass="form-control" />
								<h:message for="prescriptionId" styleClass="error" />
							</div>

							<div class="form-group">
								<label for="medicineName">Medicine Name <span
									style="color: red">*</span></label>
								<h:inputText id="medicineName"
									value="#{procedureController.prescribedMedicine.medicineName}"
									styleClass="form-control" />
								<h:message for="medicineName" styleClass="error" />
							</div>

							<div class="form-group">
								<label for="type">Medicine Type <span style="color: red">*</span></label>
								<h:selectOneMenu id="type"
									value="#{procedureController.prescribedMedicine.type}"
									styleClass="form-control">
									<f:selectItem itemLabel="-- Select Type --" itemValue="" />
									<f:selectItem itemLabel="Tablet" itemValue="TABLET" />
									<f:selectItem itemLabel="Syrup" itemValue="SYRUP" />
									<f:selectItem itemLabel="Injection" itemValue="INJECTION" />
									<f:selectItem itemLabel="Drop" itemValue="DROP" />
								</h:selectOneMenu>
								<h:message for="type" styleClass="error" />
							</div>

							<div class="form-group">
								<label for="dosage">Dosage <span style="color: red">*</span></label>
								<h:inputText id="dosage"
									value="#{procedureController.prescribedMedicine.dosage}"
									styleClass="form-control" />
								<h:message for="dosage" styleClass="error" />
							</div>

							<div class="form-group">
								<label for="duration">Duration (days) <span
									style="color: red">*</span></label>
								<h:inputText id="duration"
									value="#{procedureController.prescribedMedicine.duration}"
									styleClass="form-control" />
								<h:message for="duration" styleClass="error" />
							</div>

							<div class="form-group">
								<label for="startDate">Start Date <span
									style="color: red">*</span></label>
								<h:inputText id="startDate"
									value="#{procedureController.prescribedMedicine.startDate}"
									styleClass="form-control">
									<f:convertDateTime pattern="yyyy-MM-dd" />
								</h:inputText>
								<h:message for="startDate" styleClass="error" />
								<script>
                            const calendarInput = document.querySelector("#startDate");
                            if (calendarInput) {
                                calendarInput.setAttribute("type", "date");
                            }
                        </script>
							</div>

							<div class="form-group full-width">
								<label for="notes">Notes</label>
								<h:inputTextarea id="notes"
									value="#{procedureController.prescribedMedicine.notes}"
									styleClass="form-control" />
								<h:message for="notes" styleClass="error" />
							</div>
						</div>

						<div class="button-group">
							<h:commandButton value="Add Medicine"
								action="#{procedureController.addExistingPrescMedicine(procedureController.prescribedMedicine)}"
								styleClass="btn-add" />
							<h:commandButton value="Reset Form"
								action="#{procedureController.createNewexistingPrescPrescribedMedicine()}"
								immediate="true" styleClass="btn-reset" />
						</div>

						<h:commandButton value="back"
							action="ViewMedicines?faces-redirect=true"
							styleClass="shared-button" />
					</h:panelGroup>
				</h:form>
			</div>
		</div>
	</div>
</body>
	</html>
</f:view>