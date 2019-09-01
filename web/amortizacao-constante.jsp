<%-- 
    Document   : amortizacao-constante
    Created on : 30/08/2019, 01:13:57
    Author     : T-Gamer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização Constante</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/cabecalho.jspf" %>
        <h1>Amortização Constante</h1>
        
        <form action="amortizacao-constante.jsp">
            
            Valor do empréstimo: <input type="text" name="sald"/><br><br>
            Número de parcelas mensais: <input type="text" name="n"/><br><br>
            taxa mensal: <input type="text" name="i"/><br><br>
            <input type="submit" name="form" value="gerar"/><br><br>
        </form>
        <table border="1">
<tr>
<td>número de parcelas</td>
<td>valor da parcela</td>
<td>amortização</td>
<td>juros</td>
<td>saldo devedor</td>
</tr>
</table>
        <%double am = 0;
        double j = 0;
        double pv = 0;
        double pmt = 0;
        
            try{
        double sald = Integer.parseInt(request.getParameter("sald"));;
        int n = Integer.parseInt(request.getParameter("n"));; 
        double i = Integer.parseInt(request.getParameter("i"));
        
        i = i/100;
        am = sald / n;
        %>
<table border="1">
<tr>
<td> 0 </td>
<td> - </td>
<td> - </td>
<td> - </td>
<td> <%=sald%> </td>
</tr>
</table>
        <%
            for(int a = 1; a <= n; a++){%>
          <%
          
          j = sald * i ;
          pmt = j + am;
          sald = sald - am;
          %>
<table border="1">
<tr>
<td> <%=a%> </td>
<td><%=pmt%></td>
<td><%=am%></td>
<td><%=j%></td>
<td><%=sald%></td>
</tr>
</table>
        <%
          
            }
          %>

        <%}catch(Exception ex){%>
        
        <%}%>
        
        
        
        <%@include file="WEB-INF/jspf/rodape.jspf" %>
    </body>
</html>
