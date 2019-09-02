<%-- 
    Document   : amortizacao-constante
    Created on : 30/08/2019, 01:13:57
    Author     : T-Gamer
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização Constante</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" 
              crossorigin="anonymous">
    </head>
    <body>
        <%@include file="WEB-INF/jspf/cabecalho.jspf" %>
        <div align ="center">
        <h1>Amortização Constante</h1>
        
    <form action="amortizacao-constante.jsp">
            
            Valor do empréstimo: <input type="text" name="sald"/><br><br>
            Número de parcelas mensais: <input type="text" name="n"/><br><br>
            taxa mensal(%): <input type="text" name="i"/><br><br>
            <input type="submit" name="form" value="Gerar"/><br><br>
            
    </form>
   
        <%DecimalFormat df = new DecimalFormat("R$0.00");
            double am = 0;
        double j = 0;
        double pv = 0;
        double pmt = 0;%>
             <table border ="1">
    <tr>
        <td>número de parcelas</td>
        <td>valor da parcela</td>
        <td>amortização</td>
        <td>juros</td>
        <td>saldo devedor</td>
    </tr>

        <%
            try{
        double sald = Double.parseDouble(request.getParameter("sald"));;
        int n = Integer.parseInt(request.getParameter("n"));; 
        double i = Double.parseDouble(request.getParameter("i"));
        
        i = i/100;
        am = sald / n;
        %>

    <tr>
        <td> 0 </td>
        <td> - </td>
        <td> - </td>
        <td> - </td>
        <td> <%=df.format(sald)%> </td>
    </tr>

        <%
            for(int a = 1; a <= n; a++){%>
          <%
          
          j = sald * i ;
          pmt = j + am;
          sald = sald - am;
          %>

    <tr>
        <td> <%=a%> </td>
        <td><%=df.format(pmt)%></td>
        <td><%=df.format(am)%></td>
        <td><%=df.format(j)%></td>
        <td><%=df.format(sald)%></td>
    </tr>
    

        <%} 
        }catch(Exception ex){%>
        
        <%}%>
        </table>
        </div>
        
        
        <%@include file="WEB-INF/jspf/rodape.jspf" %>
    </body>
</html>
