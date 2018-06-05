<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="actionBean" scope="request" type="com.example.gridPuzzleProject.web.action.RandomGridAction"/>

<%@ include file="/pages/layout/taglibs.jsp" %>

<style>
    #topColumnNumber,
    #sideRowTable {
        font-size: 1.2em;
        font-weight: 600;
    }

    #topColumnNumber tbody {
        display: flex;
        flex-direction: row;
    }

    #topColumnNumber tbody tr {
        width: 30px;
        display: flex;
        margin-right: 2px;
        flex-direction: column;
        align-items: center;
        justify-content: flex-end;
    }

    #checkboxTable tbody td {
        width: 30px;
        height: 30px;
    }

    #checkboxTable tbody td input {
        width: 100%;
        height: 100%;
    }

    #sideRowTable {
        float: left;
    }

    #sideRowTable tbody {
        display: flex;
        flex-direction: column;
    }

    #sideRowTable tbody tr {
        width: 100%;
        height: 30px;
        margin-bottom: 2px;
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: flex-end;
    }

    input[type=checkbox] {
        position: absolute;
        top: -9999px;
        left: -9999px;
    }

    label {
        display: block;
        margin-bottom: 0 !important;
        width: 30px;
        height: 30px;
        background: lightgray;
        cursor: pointer;
    }

    input[type=checkbox]:checked + label {
        background: black;
    }
</style>


<s:layout-render name="/pages/layout/layout.jsp">
    <s:layout-component name="mainContent">

        <html>
        <body>

        <form action="/RandomGrid.action?check" id="form" method="post">
            <input type="hidden" name="nr" id="nr"/>
            <table id="topColumnNumber">

                <c:forEach items="${actionBean.topTableGen}" var="entry" varStatus="topTableVar">
                    <tr id="topTableRowVar<c:out value="${topTableVar.index}"/>">
                        <td id="topTableElementId<c:out value="${topTableVar.index}"/>">
                            <c:forEach items="${entry.value}" var="item" varStatus="loop">
                                ${item}${!loop.last ? ',' : ''}
                            </c:forEach>
                        </td>
                    </tr>
                </c:forEach>

            </table>
            <table id="sideRowTable">

                <c:forEach items="${actionBean.sideTableGen}" var="entry" varStatus="sideTableVar">
                    <tr id="sideTableRowVar<c:out value="${sideTableVar.index}"/>">
                        <td id="sideTableElementId<c:out value="${sideTableVar.index}"/>">
                            <c:forEach items="${entry.value}" var="item" varStatus="loop">
                                ${item} ${!loop.last ? ',' : ''}
                            </c:forEach>
                        </td>
                    </tr>
                </c:forEach>

            </table>
            <table id="checkboxTable">

                <c:forEach items="${actionBean.sideTableGen}" var="entry" varStatus="row">
                    <tr>
                        <c:forEach items="${actionBean.sideTableGen}" var="key" varStatus="col">
                            <td>
                                <input type="checkbox" id="chk<c:out value="${row.index}${col.index}"/>">
                                <label for="chk<c:out value="${row.index}${col.index}"/>"></label>
                            </td>
                        </c:forEach>
                    </tr>
                </c:forEach>

            </table>

            <button type="submit" class="btn btn-primary float-right" onclick="check()">Check Solution</button>
            <script type="text/javascript">

                function check() {

                    var mistakeChecked = false;

                    for (var i = 0; i < ${actionBean.gridSize}; i++) {
                        if (mistakeChecked) {
                            var nr = document.getElementById("nr").value = "incorrect";
                        }

                        var checkBoxFinalValue = 0;
                        var sideRowTableFinalValue = 0;

                        for (var j = 0; j < ${actionBean.gridSize}; j++) {
                            if (document.getElementById("chk" + i + j).checked) {
                                checkBoxFinalValue += 1;
                            }
                        }

                        for (var k = 0; k < document.getElementById("sideTableElementId" + i).innerHTML.split(',').length; k++) {

                            var tdElements = document.getElementById("sideTableElementId" + i).innerHTML;
                            var tdElement = tdElements.trim();
                            var tdArray = tdElement.split(',');

                            for (var m = 0; m < tdArray.length; m++) {
                                tdArray[m] = tdArray[m].trim();
                                tdArray[m] = parseInt(tdArray[m]);
                            }

                            var value = tdArray.reduceRight(function (acc, val) {
                                return acc + val
                            });
                            sideRowTableFinalValue = +value;
                        }


                        if (sideRowTableFinalValue == NaN) {
                            sideRowTableFinalValue = 0;
                        }
                        if (checkBoxFinalValue != sideRowTableFinalValue) {
                            mistakeChecked = true;
                        }
                    }

                    for (var i = 0; i < ${actionBean.gridSize}; i++) {

                        if (mistakeChecked) {
                            var nr = document.getElementById("nr").value = "incorrect";
                        }

                        var checkBoxFinalValue = 0;
                        var topColumnTableFinalValue = 0;

                        for (var j = 0; j < ${actionBean.gridSize}; j++) {
                            if (document.getElementById("chk" + j + i).checked) {
                                checkBoxFinalValue += 1;
                            }
                        }
                        for (var k = 0; k < document.getElementById("topTableRowVar" + i).innerHTML.split(',').length; k++) {

                            var tdElements = document.getElementById("topTableElementId" + i).innerHTML;
                            var tdElement = tdElements.trim();
                            var tdArray = tdElement.split(',');

                            for (var m = 0; m < tdArray.length; m++) {
                                tdArray[m] = tdArray[m].trim();
                                tdArray[m] = parseInt(tdArray[m]);
                            }

                            var value = parseInt(tdArray.reduceRight(function (acc, val) {
                                return acc + val
                            }));
                            topColumnTableFinalValue = +value;
                        }
                        if (topColumnTableFinalValue == NaN) {
                            topColumnTableFinalValue = 0;
                        }
                        if (checkBoxFinalValue != topColumnTableFinalValue) {
                            mistakeChecked = true;
                        }
                        if (!mistakeChecked) {
                            var nr = document.getElementById("nr").value = "correct";
                        }
                    }
                }
            </script>
        </form>
        </body>
        </html>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const sideRowTableWidth = document.querySelector('#sideRowTable').getBoundingClientRect().width;
                const checkboxTable = document.querySelector('#checkboxTable');
                const topColumnNumber = document.querySelector('#topColumnNumber');
                const topColumnNumberWidth = document.querySelector('#topColumnNumber').getBoundingClientRect().width;
                topColumnNumber.style.transform = 'translateX(' + (sideRowTableWidth ) + 'px)';
                checkboxTable.style.width = topColumnNumberWidth + 'px';
            })
        </script>
    </s:layout-component>
</s:layout-render>