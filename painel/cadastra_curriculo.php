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

    $nome_aluno = $_POST['nome'];
    $email = $_POST['email'];
    $telefone = $_POST['telefone'];
    $curso = $_POST['curso'];

    // echo "Nome => $nome_aluno <br>";
    // echo "Email => $email <br>";
    // echo "Telefone => $telefone <br>";
    // echo "Curso => $curso <br>";

    $consulta = "INSERT INTO curriculo (nome, email, telefone,curso) VALUES ('$nome_aluno','$email','$telefone','$curso')";

    $conexao->query($consulta);

    ?>

    <script type="text/javascript">
        alert("Curriculo cadastrado. Cadastre suas habilidades");
        window.location.href = "index.php";
        
    </script> 

    
    

    //com os dados inseridos levar o usuário para cadastrar Habilidades, Competências, Escolaridade e Experiência Profissional



?>