<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/style.css">
    <title>Document</title>
</head>
<body>
    <div class='bento1'>
    <div class='main_wrapper blackbg'>
        <h1>Conoce al equipo</h1>
        <div class='team_wrapper'>
            <div class='card_wrapper blackbg'>
                <img src='./SUCKERR.jpg' alt='vanessa-foto'>
                <h2 class='member_name'>Vanessa Reteguín</h2>
                <h4 class='member_role'>Project Manager & Lead Developer</h4>
                <a href='./vanessa.jsp'>Info ></a>
            </div>
            <div class='card_wrapper blackbg'>
                <img src='./alan.png' alt='alan-foto'>
                <h2 class='member_name'>Alan Torres Ruiz</h2>
                <h4 class='member_role'>Frontend Developer</h4>
                <a href='./alan.jsp'>Info ></a>
            </div>
            <div class='card_wrapper blackbg'>
                <img src='./SUCKERR.jpg' alt='alexis-foto'>
                <h2 class='member_name'>Alexis Alberto Zúñiga Alonso</h2>
                <h4 class='member_role'>Backend Developer</h4>
                <a href='./alexis.jsp'>Info ></a>
            </div>
        </div>
        <h3>Nuestro objetivo</h3>
        <p class='content'>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras maximus felis ut quam malesuada, congue condimentum quam hendrerit.
            Cras iaculis, magna eget volutpat consequat, lectus purus tempus turpis, ac consequat risus tortor at nunc.
            Curabitur quis mi dictum velit vehicula auctor. Quisque hendrerit consequat ex. Nunc varius, eros ac sodales rhoncus, tortor libero lobortis metus, ut bibendum mauris dui sed purus.
            In condimentum, lacus a hendrerit eleifend, neque tellus posuere ante, et egestas magna lacus eu dolor.
            Nullam dui diam, bibendum sit amet velit sit amet, gravida cursus ex. Ut nec sollicitudin dolor, quis volutpat odio.
            Nulla euismod bibendum tellus, ut ultrices felis tristique eget.
        </p>
    </div>
    <div class='datetime_wrapper blackbg'>
            <div class='date'>
                <span id='dayname'>Díasem</span>,
                <span id='day'>00</span> de
                <span id='month'>Mes</span> de
                <span id='year'>Año</span>
            </div>
            <div class='time'>
                <span id='hour'>00</span>:
                <span id='minutes'>00</span>:
                <span id='seconds'>00</span>
                <span id='period'>AM</span>
            </div>
    </div>
    <div class='login_wrapper blackbg'>
        <h2>Iniciar sesión</h2>
            <form id='login_form'>
                <label for='email_input'>Correo electrónico</label>
                <input id='email_input' type='email'>
                <label for='password_input'>Contraseña</label>
                <input id='password_input' type='password'>
                <input id='login_btn' type='submit' value='Login'>
            </form>
    </div>
    </div>
</body>
<footer>
    <hr>
    <p>Proyecto de Lenguajes de Computación IV</p>
</footer>
</html>