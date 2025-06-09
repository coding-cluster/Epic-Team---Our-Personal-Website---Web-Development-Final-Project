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
    <div class='bento2'>
        <div class='card_wrapper blackbg'>
            <img src='./alan.png' alt='alan-foto'>
            <h2 class='member_name'>Alan Torres Ruiz</h2>
            <h4 class='member_role'>Frontend Developer</h4>
            <a href='./index.html'>< Volver</a>
        </div>
        <div class='interests_list_wrapper blackbg'>
            <h2>Intereses</h2>
            <ul>
                <li>Dibujar</li>
                <li>Videojuegos</li>
                <li>Mitología</li>
                <li>Escribir</li>
                <li>Escuchar música</li>
            </ul>
        </div>
        <div class='links_wrapper blackbg'>
            <h2>Enlaces externos</h2>
            <ul>
                <li><a href='https://line-of-action.com/' target='_blank'>Ejercicios de dibujo</a></li>
                <li><a href='https://store.steampowered.com/app/2134320/ENA_Dream_BBQ/' target='_blank'>Dream BBQ</a></li>
                <li><a href='https://www.culturagenial.com/es/la-iliada/' target='_blank'>La Iliada</a></li>
                <li><a href='https://www.youtube.com/watch?v=arE2yyQe1PY' target='_blank'>Como escribir poesía</a></li>
                <li><a href='https://www.youtube.com/watch?v=4QikhoXJkqE&ab_channel=MagdalenaBay' target='_blank'>The Beggining Music Video</a></li>
            </ul>
        </div>
        <div class='info_form_wrapper blackbg'>
            <h2>Envíanos tu info</h2>
            <form>
                <label for='input_name'>Nombre</label>
                <input id='input_name' type='text'>
                <label for='input_surname1'>Apellido Paterno</label>
                <input id='input_surname1' type='text'>
                <label for='input_surname2'>Apellido Materno</label>
                <input id='input_surmane2' type='text'>
                <label for='input_age'>Edad</label>
                <input id='input_age' type='text'>
                <label for='input_birthday'>Fecha de cumpleaños</label>
                <input id='input_birthday' type='date'>
                <input id='submit_btn' type='submit' value='Enviar'>
            </form>
        </div>
        <div class='gallery_wrapper blackbg'>
            <h2>Galería</h2>
            <hr>
            <div class='gallery_roll'>
                <img src='./1.jpg' alt='img'>
                <img src='./2.jpg' alt='img'>
                <img src='./3.jpg' alt='img'>
                <img src='./4.jpg' alt='img'>
            </div>
        </div>
    </div>
    <footer>
        <hr>
        <p>Proyecto de Lenguajes de Computación IV</p>
    </footer>
</body>
</html>