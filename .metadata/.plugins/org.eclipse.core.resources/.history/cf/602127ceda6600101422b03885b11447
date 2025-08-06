<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>

<html>
<head>
  <title>Add Procedure Test</title>

  <!-- still disable caching so browser doesn’t hold onto old HTML -->
  <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
  <meta http-equiv="Pragma"        content="no-cache" />
  <meta http-equiv="Expires"       content="0" />

  <script type="text/javascript">
    window.addEventListener('pageshow', function(event) {
      // if this page was restored from bfcache or via back/forward
      var navEntries = performance.getEntriesByType &&
                       performance.getEntriesByType("navigation");
      var navType = navEntries && navEntries.length
                    ? navEntries[0].type
                    : "";
      if (event.persisted || navType === "back_forward") {
        // clear out all validation-message spans
        document.querySelectorAll('.error-message').forEach(function(el) {
          el.textContent = '';
        });
      }
    });
  </script>

  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(to right, #fce4ec, #e1f5fe);
      margin: 0; padding: 0;
    }
    .container {
      max-width: 850px;
      margin: 40px auto;
      background-color: #fff;
      border-radius: 10px;
      box-shadow: 0 4px 16px rgba(0,0,0,0.08);
      padding: 25px 30px;
    }
    h2 {
      text-align: center;
      color: #00796b;
      font-size: 22px;
      margin-bottom: 20px;
    }
    .form-group {
      margin-bottom: 18px;
    }
    label, h\:outputLabel {
      font-weight: 600;
      color: #2c3e50;
      font-size: 14px;
      display: block;
      margin-bottom: 5px;
    }
    input[type="text"], textarea {
      padding: 8px 10px;
      font-size: 13px;
      border: 1px solid #ccc;
      border-radius: 6px;
      width: 100%;
      box-sizing: border-box;
    }
    .error-message {
      display: block;
      color: #f44336 !important;
      font-size: 14px;
      font-weight: 600;
      padding: 4px 8px;
      border-radius: 4px;
      margin-top: 6px;
    }
    .button-group {
      display: flex;
      justify-content: center;
      gap: 20px;
      margin-top: 25px;
    }
    .custom-button {
      background-color: #00796b;
      color: white;
      padding: 10px 20px;
      font-size: 13px;
      font-weight: bold;
      border: none;
      border-radius: 6px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }
    .custom-button:hover {
      background-color: #004d40;
    }
    .blue-button {
      background-color: #0288d1;
    }
    .blue-button:hover {
      background-color: #0277bd;
    }
  </style>
</head>

<body>
  <f:view>
    <div class="container">
      <h:form prependId="false">
        <h2>Add Procedure Test</h2>

        <!-- Prescription ID (readonly) -->
        <div class="form-group">
          <h:outputLabel for="prescriptionId" value="Prescription ID:" />
          <h:inputText id="prescriptionId"
                       value="#{procedureController.prescription.prescriptionId}"
                       readonly="true" />
        </div>

        <!-- Test ID -->
        <div class="form-group">
          <h:outputLabel for="testId" value="Test ID:" />
          <h:inputText  id="testId"
                        value="#{procedureController.procedureTest.testId}"
                        readonly="true" />
          <h:message for="testId" styleClass="error-message" />
        </div>

        <!-- Test Name -->
        <div class="form-group">
          <h:outputLabel for="testName">
            Test Name: <span style="color:red">*</span>
          </h:outputLabel>
          <h:inputText id="testName"
                       value="#{procedureController.procedureTest.testName}" />
          <h:message for="testName" styleClass="error-message" />
        </div>

        <!-- Test Date -->
        <div class="form-group">
          <h:outputLabel for="testDate">
            Test Date (yyyy-MM-dd): <span style="color:red">*</span>
          </h:outputLabel>
          <h:inputText id="testDate"
                       value="#{procedureController.procedureTest.testDate}">
            <f:convertDateTime pattern="yyyy-MM-dd"/>
          </h:inputText>
          <h:message for="testDate" styleClass="error-message"/>
          <script type="text/javascript">
            var cal = document.querySelector("#testDate");
            if (cal) { cal.setAttribute("type","date"); }
          </script>
        </div>

        <!-- Result Summary -->
        <div class="form-group">
          <h:outputLabel for="resultSummary">
            Result Summary: <span style="color:red">*</span>
          </h:outputLabel>
          <h:inputTextarea id="resultSummary"
                          value="#{procedureController.procedureTest.resultSummary}"
                          rows="4" cols="50"/>
          <h:message for="resultSummary" styleClass="error-message"/>
        </div>

        <!-- Buttons (with POST-REDIRECT-GET in your bean) -->
        <div class="button-group">
          <h:commandButton value="Save Test"
                           styleClass="custom-button"
                           action="#{procedureController.addTestController(
                                      procedureController.procedureTest)}" />

          <h:commandButton value="Reset Form"
                           styleClass="custom-button blue-button"
                           action="#{procedureController.createNewProcedureTest()}"
                           immediate="true"/>
        </div>
      </h:form>
    </div>
  </f:view>
</body>
</html>