<?php
    session_start();    
    include 'conecta.php';

    
    $email = $conexao->real_escape_string(strtolower($_POST['email'])); 
    $senha = md5($conexao->real_escape_string($_POST['senha']));

    echo "Recebi email => $email <br>";
    echo "Recebi senha => $senha <br>";

    $consulta = "SELECT * FROM usuarios WHERE email = '$email' AND senha = '$senha'";
    $resultado = $conexao->query($consulta);
    $registros = $resultado->num_rows;
    $resultado_usuario = mysqli_fetch_assoc($resultado);

    //echo "Registros encontrados = $registros";

    if($registros<>0){
        $_SESSION['id_user'] = $resultado_usuario['id'];
        $_SESSION['nome_user'] = $resultado_usuario['nome'];
        $_SESSION['email_user'] = $resultado_usuario['email'];
        $_SESSION['cpf_user'] = $resultado_usuario['cpf'];
        $_SESSION['tipo_user'] = $resultado_usuario['tipo'];
        header('Location: index.php');
    }
    else{
        header('Location: login.php');
    }




?>