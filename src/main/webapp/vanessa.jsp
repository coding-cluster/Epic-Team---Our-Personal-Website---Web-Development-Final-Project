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
            <img src='./SUCKERR.jpg' alt='alan-foto'>
            <h2 class='member_name'>Vanessa Reteguín</h2>
            <h4 class='member_role'>Project Manager & Lead Developer</h4>
            <a href='./index.jsp'>< Volver</a>
        </div>
        <div class='interests_list_wrapper blackbg'>
            <h2>Intereses</h2>
            <ul>
                <li>Ejemplo</li>
                <li>Llenar</li>
                <li>Con</li>
                <li>Archivo</li>
                <li>XML</li>
            </ul>
        </div>
        <div class='links_wrapper blackbg'>
            <h2>Enlaces externos</h2>
            <ul>
                <li><a href='https://www.youtube.com/watch?v=ZXL_4Lv38nY&list=RDEMoIP1pjRl8uhuPxzyYMRD8w&index=3&ab_channel=CarolinePolachek-Topic'>Link</a></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
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
                <img src='./2.jpg' alt='img'>
                <img src='./2.jpg' alt='img'>
            </div>
        </div>
    </div>
    <footer>
        <hr>
        <p>Proyecto de Lenguajes de Computación IV</p>
    </footer>
</body>
</html>