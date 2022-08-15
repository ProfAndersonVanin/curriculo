<?php
    session_start();
    if((!isset($_SESSION['id_user']) == true) and (!isset($_SESSION['nome_user']) == true) and (!isset($_SESSION['tipo_user']) == true) and (!isset($_SESSION['email_user']) == true)){
        unset($_SESSION['id_user']);
        unset($_SESSION['nome_user']);
        unset($_SESSION['email_user']);
        unset($_SESSION['tipo_user']);
        header('Location: login.php');
    }
    include 'conecta.php';

    
    
    $id_curriculo = $_POST['id_curriculo'];
    $habilidade = $_POST['habilidade'];
    

    echo "id => $id_curriculo <br>";
    echo "habilidade => $habilidade <br>";
    

    $consulta = "INSERT INTO habilidades (habilidade,id_curr) VALUES ('$habilidade','$id_curriculo')";

    $conexao->query($consulta);

    ?>

    <script type="text/javascript">
        alert("Habilidade cadastrada.");
        window.location.href = "index.php";
        
    </script> 
<?php

    //com os dados inseridos levar o usuário para cadastrar Habilidades, Competências, Escolaridade e Experiência Profissional



?>