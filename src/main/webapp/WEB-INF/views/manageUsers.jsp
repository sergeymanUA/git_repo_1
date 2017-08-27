<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page isELIgnored="false"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!-- Datatables -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.0/css/jquery.dataTables.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.0/js/jquery.dataTables.js"></script>


<script type="text/javascript">
    //Plug-in to fetch page data
    jQuery.fn.dataTableExt.oApi.fnPagingInfo = function (oSettings) {
        return {
            "iStart": oSettings._iDisplayStart,
            "iEnd": oSettings.fnDisplayEnd(),
            "iLength": oSettings._iDisplayLength,
            "iTotal": oSettings.fnRecordsTotal(),
            "iFilteredTotal": oSettings.fnRecordsDisplay(),
            "iPage": oSettings._iDisplayLength === -1 ?
                0 : Math.ceil(oSettings._iDisplayStart / oSettings._iDisplayLength),
            "iTotalPages": oSettings._iDisplayLength === -1 ?
                0 : Math.ceil(oSettings.fnRecordsDisplay() / oSettings._iDisplayLength)
        };
    };

    $(document).ready(function () {
        $("#example").dataTable({
            "bProcessing": true,
            "bServerSide": true,
            "sort": "position",
            //bStateSave variable you can use to save state on client cookies: set value "true"
            "bStateSave": false,
            //Default: Page display length
            "iDisplayLength": 10,
            //We will use below variable to track page number on server side(For more information visit: http://legacy.datatables.net/usage/options#iDisplayStart)
            "iDisplayStart": 0,
            "fnDrawCallback": function () {
                //Get page numer on client. Please note: number start from 0 So
                //for the first page you will see 0 second page 1 third page 2...
                //Un-comment below alert to see page number
                //alert("Current page number: "+this.fnPagingInfo().iPage);
            },
            "sAjaxSource": "springPaginationDataTables.web",
            "aoColumns": [
                {"mData": "name"},
                {"mData": "position"},
                {"mData": "office"},
                {"mData": "phone"},
                {"mData": "start_date"},
                {"mData": "salary"},
            ]
        });
    });
</script>

<script type="text/javascript">
    $(function(){
        $('#birthDate').datepicker({
            dateFormat: 'yy-mm-dd',
            changeYear: true
        });

        $("#contactDescription").ckeditor(
            {
                toolbar : 'Basic',
                uiColor : '#CCCCCC'
            }
        );
    });
</script>

<h3 align="center"> List of all users </h3>
<c:if test="${!empty listUsers}">
    <div class="form-group ${status.error ? 'has-error' : ''}" align="center">
        <input type="text" id="userInput" onkeyup="tableSearch()" placeholder="Search for names..">
    </div>
    <table style="border: 1px solid black; border-collapse: collapse;" align="center" id="tableUser">
        <tr style="border: 1px solid black;">
            <th width="30" style="border: 1px solid black; text-align: center" onclick="tableSort(0)">Id</th>
            <th width="120" style="border: 1px solid black; text-align: center" onclick="tableSort(1)">Name</th>
            <th width="120" style="border: 1px solid black; text-align: center" onclick="tableSort(2)">Email</th>
            <th width="100" style="border: 1px solid black; text-align: center">Edit</th>
            <th width="100" style="border: 1px solid black; text-align: center">Remove</th>
        </tr>
        <c:forEach items="${listUsers}" var="user">
            <tr>
                <td style="border: 1px solid black; text-align: center">${user.id}</td>
                <td style="border: 1px solid black; text-align: center">${user.username}</td>
                <td style="border: 1px solid black; text-align: center">${user.email}</td>
                <td style="border: 1px solid black; text-align: center"><a href=${contextPath}/editUser/${user.id}>Edit user</a></td>
                <td style="border: 1px solid black; text-align: center"><a href=${contextPath}/removeUser/${user.id}>Remove user</a></td>
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

<h3 id="operationLabel" align="center"></h3>

<c:url var="addAction" value="/users/add"/>


<form:form method="POST" action="${addAction}" modelAttribute="user">
    <spring:bind path="id">
        <div class="form-group ${status.error ? 'has-error' : ''}" align="center">

            <label for="userId" style="align: left;">Id:</label>
            <form:input type="text" id="userId" path="id" class="form-control" placeholder="Id"
                         disabled="true" maxlength="11" size="11" style="width: 250px;"></form:input>
            <form:errors path="id"></form:errors>
        </div>
    </spring:bind>

    <spring:bind path="username">
        <div class="form-group ${status.error ? 'has-error' : ''}" align="center">

            <label for="userName" style="align: left;">Username:</label>
            <form:input type="text" id="userName" path="username" class="form-control"
                        placeholder="Username" autofocus="true" maxlength="32" size="32" style="width: 250px;"></form:input>
            <form:errors path="username"></form:errors>
        </div>
    </spring:bind>

    <spring:bind path="password">
        <div class="form-group ${status.error ? 'has-error' : ''}" align="center">

            <label for="userPassword" style="align: left;">Password:</label>
            <form:input type="password" id="userPassword" path="password" class="form-control"
                        placeholder="Password" maxlength="32" size="32" style="width: 250px;"></form:input>
            <form:errors path="password"></form:errors>
        </div>
    </spring:bind>

    <spring:bind path="email">
        <div class="form-group ${status.error ? 'has-error' : ''}" align="center">

            <label for="userEmail" style="align: left;">Email:</label>
            <form:input type="email" id="userEmail" path="email" class="form-control"
                        placeholder="Email" maxlength="32" size="32" style="width: 250px;"></form:input>
            <form:errors path="email"></form:errors>
        </div>
    </spring:bind>

    <c:if test="${!empty user.id}">
        <input type='hidden' id='userId' name='userId' value='${user.id}'/>
        <div align="center">
            <input type="submit" value="<spring:message text="Edit user"/>"/>
        </div>

        <script>
            document.getElementById("operationLabel").innerHTML = "Edit user";
        </script>
    </c:if>

    <c:if test="${empty user.id}">
        <input type='hidden' id='userId' name='userId' value='-1'/>
        <div align="center">
            <input type="submit"
                   class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only"
                   value="<spring:message text="Add user"/>"/>

            <button type="submit" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">
                <span class="ui-button-text">Save</span>
            </button>
        </div>

        <script>
            document.getElementById("operationLabel").innerHTML = "Add user";
        </script>
    </c:if>

</form:form>

<hr />
<form:form action="" method="GET">
    <h2 >Spring MVC pagination using data tables<br><br></h2>
    <table width="70%" style="border: 3px;background: rgb(243, 244, 248);"><tr><td>
        <table id="example" class="display" cellspacing="0" width="100%">
            <thead>
            <tr>
                <th>Name</th>
                <th>Position</th>
                <th>Office</th>
                <th>Phone</th>
                <th>Start Date</th>
                <th>Salary</th>
            </tr>
            </thead>
        </table>
    </td></tr></table>
</form:form>

</br>

<script type="text/javascript">
    function tableSort(n) {
        var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
        table = document.getElementById("tableUser");
        switching = true;
        //Set the sorting direction to ascending:
        dir = "asc";
        /*Make a loop that will continue until
         no switching has been done:*/
        while (switching) {
            //start by saying: no switching is done:
            switching = false;
            rows = table.getElementsByTagName("TR");
            /*Loop through all table rows (except the
             first, which contains table headers):*/
            for (i = 1; i < (rows.length - 1); i++) {
                //start by saying there should be no switching:
                shouldSwitch = false;
                /*Get the two elements you want to compare,
                 one from current row and one from the next:*/
                x = rows[i].getElementsByTagName("TD")[n];
                y = rows[i + 1].getElementsByTagName("TD")[n];
                /*check if the two rows should switch place,
                 based on the direction, asc or desc:*/
                if (dir == "asc") {
                    if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                        //if so, mark as a switch and break the loop:
                        shouldSwitch= true;
                        break;
                    }
                } else if (dir == "desc") {
                    if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                        //if so, mark as a switch and break the loop:
                        shouldSwitch= true;
                        break;
                    }
                }
            }
            if (shouldSwitch) {
                /*If a switch has been marked, make the switch
                 and mark that a switch has been done:*/
                rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                switching = true;
                //Each time a switch is done, increase this count by 1:
                switchcount ++;
            } else {
                /*If no switching has been done AND the direction is "asc",
                 set the direction to "desc" and run the while loop again.*/
                if (switchcount == 0 && dir == "asc") {
                    dir = "desc";
                    switching = true;
                }
            }
        }
    }

    //Sorting (Filtering) table
    function tableSearch() {
        // Declare variables
        var input, filter, table, tr, td, i;
        input = document.getElementById("userInput");
        filter = input.value.toUpperCase();
        table = document.getElementById('tableUser');
        tr = table.getElementsByTagName("tr");

        // Loop through all table rows, and hide those who don't match the search query
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[1];
            if (td) {
                if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }
</script>