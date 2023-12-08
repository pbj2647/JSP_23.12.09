<%@ page language="java" import="java.sql.*,java.io.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,java.text.*"%>

<!DOCTYPE html>
<head>
    <title>JSP 게시판 - 글목록보기</title>
</head>
<body>
    <table border="1" cellspacing="0" width="680" bordercolordark="white" bordercolorlight="#999999">
        <tr>
            <td width="30" bgcolor="#CCCCCC">
                <p align="center">no</p>
            </td>
            <td bgcolor="#CCCCCC" width="490">
                <p align="center">subject</p>
            </td>
            <td width="60" bgcolor="#CCCCCC">
                <p align="center">name</p>
            </td>
            <td width="70" bgcolor="#CCCCCC">
                <p align="center">date</p>
            </td>
            <td width="30" bgcolor="#CCCCCC">
                <p align="center">hit</p>
            </td>
        </tr>
        <tr>
            <td width="30">
                <p align="center">1</p>
            </td>
            <td width="490">
                여기에 제목 들어감
            </td>
            <td width="60">
                <p align="center">손병목</p>
            </td>
            <td width="70">
                <p align="center">2003/03/31</p>
            </td>
            <td width="30">
                <p align="center">5</p>
            </td>
        </tr>
        <tr>
            <td width="100%" colspan="5">
                <p align="center">
                    [처음] [10개 앞] [이전] [1] [2] [3] [4] [5] <b><font color="green">6</font></b> [7] [8] [9] [10] [다음] [10개 뒤] [마지막]
                </p>
            </td>
        </tr>
        <tr>
            <td width="100%" colspan="5">
                <p align="center">
                    <a href="write.html">[글쓰기]</a>
                </p>
            </td>
        </tr>
    </table>
</body>
</html>
