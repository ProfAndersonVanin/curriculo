<?php
    session_start();
    unset($_SESSION['id_user']);
    unset($_SESSION['nome_user']);
    unset($_SESSION['email_user']);
    unset($_SESSION['tipo_user']);
    unset($_SESSION['cpf_user']);
    header('Location: ../index.php');


?>