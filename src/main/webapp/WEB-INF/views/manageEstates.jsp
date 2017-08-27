<%--
  Created by IntelliJ IDEA.
  User: Sergei
  Date: 30.07.2017
  Time: 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page isELIgnored="false"%>

        <c:set var="contextPath" value="${pageContext.request.contextPath}"/>

        <h3 align="center"> List of all Real Estates </h3>
        <c:if test="${!empty listEstates}">
            <table style="border: 1px solid black; border-collapse: collapse;" align="center">
                <tr style="border: 1px solid black;">
                    <th width="30" style="border: 1px solid black; text-align: center">Id</th>
                    <th width="60" style="border: 1px solid black; text-align: center">Area</th>
                    <th width="100" style="border: 1px solid black; text-align: center">Date included</th>
                    <th width="100" style="border: 1px solid black; text-align: center">Init Price</th>
                    <th width="100" style="border: 1px solid black; text-align: center">Rooms number</th>
                    <th width="100" style="border: 1px solid black; text-align: center">Type</th>
                    <th width="150" style="border: 1px solid black; text-align: center">Description</th>
                    <th width="100" style="border: 1px solid black; text-align: center">Photo</th>
                    <th width="150" style="border: 1px solid black; text-align: center">Address</th>
                    <th width="100" style="border: 1px solid black; text-align: center">Owner</th>
                    <th width="100" style="border: 1px solid black; text-align: center">Edit</th>
                    <th width="100" style="border: 1px solid black; text-align: center">Remove</th>
                </tr>
                <c:forEach items="${listEstates}" var="estate">
                    <tr>
                        <td style="border: 1px solid black; text-align: center">${estate.id}</td>
                        <td style="border: 1px solid black; text-align: center">${estate.area}</td>
                        <td style="border: 1px solid black; text-align: center">${estate.dateIn}</td>
                        <td style="border: 1px solid black; text-align: center">${estate.initPrice}</td>
                        <td style="border: 1px solid black; text-align: center">${estate.nrooms}</td>
                        <td style="border: 1px solid black; text-align: center">${estate.type}</td>
                        <td style="border: 1px solid black; text-align: center">${estate.userDescription}</td>
                        <td style="border: 1px solid black; text-align: center">${estate.photoName}</td>
                        <td style="border: 1px solid black; text-align: center">${estate.fullAddress}</td>
                        <td style="border: 1px solid black; text-align: center">${estate.owner}</td>

                        <td style="border: 1px solid black; text-align: center"><a href=${contextPath}/editEstate/${realEstate.id}>Edit estate</a></td>
                        <td style="border: 1px solid black; text-align: center"><a href=${contextPath}/removeEstate/${realEstate.id}>Remove estate</a></td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>

        <table align="right" cellspacing="20" cellpadding="20">
            <tr>
                <td style="padding: 0 15px;"><h3><a onclick="document.forms['logoutForm'].submit()">Logout</a></h3></td>
                <td style="padding: 0 15px;"><h3><a href=${contextPath}/main>Back</a></h3></td>
            </tr>
        </table>

        </br>

        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        </br>

        <h3 id="operationLabel" align="center"></h3>        <!--* ? -->

        <c:url var="addAction" value="/realEstate/add"/>

        <form:form method="POST" action="${addAction}" modelAttribute="realEstate">
            <spring:bind path="id">
                <div class="form-group ${status.error ? 'has-error' : ''}" align="center">

                    <label for="estateId" style="align: left;">Id:</label>
                    <form:input type="text" id="estateId" path="id" class="form-control" placeholder="Id"
                                disabled="true" maxlength="11" size="11" style="width: 250px;"></form:input>
                    <form:errors path="id"></form:errors>
                </div>
            </spring:bind>

            <spring:bind path="area">
                <div class="form-group ${status.error ? 'has-error' : ''}" align="center">

                    <label for="area" style="align: left;">Real Estate area:</label>
                    <form:input type="text" id="area" path="area" class="form-control"
                                placeholder="Area" autofocus="true" maxlength="32" size="32" style="width: 250px;"></form:input>
                    <form:errors path="area"></form:errors>
                </div>
            </spring:bind>

            <spring:bind path="dateIn">
                <div class="form-group ${status.error ? 'has-error' : ''}" align="center">

                    <label for="dateIn" style="align: left;">Real Estate date adding:</label>
                    <form:input type="text" id="dateIn" path="dateIn" class="form-control"
                                placeholder="Date" autofocus="true" maxlength="32" size="32" style="width: 250px;"></form:input>
                    <form:errors path="dateIn"></form:errors>
                </div>
            </spring:bind>

            <spring:bind path="initPrice">
                <div class="form-group ${status.error ? 'has-error' : ''}" align="center">

                    <label for="type" style="align: left;">Real Estate price:</label>
                    <form:input type="text" id="initPrice" path="type" class="form-control"
                                placeholder="Price" autofocus="true" maxlength="32" size="32" style="width: 250px;"></form:input>
                    <form:errors path="initPrice"></form:errors>
                </div>
            </spring:bind>

            <spring:bind path="nrooms">
                <div class="form-group ${status.error ? 'has-error' : ''}" align="center">

                    <label for="nrooms" style="align: left;">Real Estate rooms number:</label>
                    <form:input type="text" id="nrooms" path="nrooms" class="form-control"
                                placeholder="Rooms" autofocus="true" maxlength="32" size="32" style="width: 250px;"></form:input>
                    <form:errors path="nrooms"></form:errors>
                </div>
            </spring:bind>

            <spring:bind path="type">
                <div class="form-group ${status.error ? 'has-error' : ''}" align="center">

                    <label for="type" style="align: left;">Real Estate type:</label>
                    <form:input type="text" id="type" path="type" class="form-control"
                                placeholder="Type" autofocus="true" maxlength="32" size="32" style="width: 250px;"></form:input>
                    <form:errors path="type"></form:errors>
                </div>
            </spring:bind>

            <spring:bind path="userDescription">
                <div class="form-group ${status.error ? 'has-error' : ''}" align="center">

                    <label for="userDescription" style="align: left;">Real Estate description:</label>
                    <form:input type="text" id="userDescription" path="userDescription" class="form-control"
                                placeholder="Type" autofocus="true" maxlength="32" size="32" style="width: 250px;"></form:input>
                    <form:errors path="userDescription"></form:errors>
                </div>
            </spring:bind>

            <spring:bind path="photoName">
                <div class="form-group ${status.error ? 'has-error' : ''}" align="center">

                    <label for="type" style="align: left;">Real Estate photo:</label>
                    <form:input type="text" id="photoName" path="photoName" class="form-control"
                                placeholder="Photo" autofocus="true" maxlength="32" size="32" style="width: 250px;"></form:input>
                    <form:errors path="photoName"></form:errors>
                </div>
            </spring:bind>

            <spring:bind path="fullAddress">
                <div class="form-group ${status.error ? 'has-error' : ''}" align="center">

                    <label for="fullAddress" style="align: left;">Real Estate address:</label>
                    <form:input type="text" id="fullAddress" path="fullAddress" class="form-control"
                                placeholder="Address" autofocus="true" maxlength="32" size="32" style="width: 250px;"></form:input>
                    <form:errors path="fullAddress"></form:errors>
                </div>
            </spring:bind>

            <spring:bind path="owner">
                <div class="form-group ${status.error ? 'has-error' : ''}" align="center">

                    <label for="type" style="align: left;">Real Estate owner:</label>
                    <form:input type="text" id="owner" path="owner" class="form-control"
                                placeholder="Owner" autofocus="true" maxlength="32" size="32" style="width: 250px;"></form:input>
                    <form:errors path="owner"></form:errors>
                </div>
            </spring:bind>

            <c:if test="${!empty realEstate.id}">
                <input type='hidden' id='realEstateId' name='realEstateId' value='${realEstate.id}'/>
                <div align="center">
                    <input type="submit" value="<spring:message text="Edit estate"/>"/>
                </div>

                <script>
                    document.getElementById("operationLabel").innerHTML = "Edit estate";
                </script>
            </c:if>

            <c:if test="${empty realEstate.id}">
                <input type='hidden' id='realEstateId' name='realEstateId' value='-1'/>
                <div align="center">
                    <input type="submit" value="<spring:message text="Add estate"/>"/>
                </div>

                <script>
                    document.getElementById("operationLabel").innerHTML = "Add estate";
                </script>
            </c:if>

        </form:form>

        </br>
