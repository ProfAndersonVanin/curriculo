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
    // Dados de quem está logado
    $id_user = $_SESSION['id_user'];
    $email_logado = $_SESSION['email_user'];

    // Dados novos para atualizar
    $nome_novo = $_POST['nome'];
    $email_novo = $_POST['email'];
    $cpf_novo = $_POST['cpf'];
    
    //echo "Nome Novo => $nome_novo <br>";
    //echo "Email Novo => $email_novo <br>";
    //echo "Cpf Novo => $cpf_novo <br>";
    //echo "************************* <br>";
    // Lembre-se de que o Nome e Email, se alterados, devem ser refletidos em
    // duas tabelas: usuarios e curriculo. Necessário fazer o UPDATE nas duas 
    // tabelas

    // Função para retornar o número do id do curriculo de quem está logado!
    function pega_id_curr($email_logado){
        include 'conecta.php';
        $sql_2 = "SELECT * FROM curriculo WHERE email='$email_logado'";
        // armazena o resultado da consulta
        $resultado = mysqli_query($conexao, $sql_2);
        $id_curriculo = "";
        if (mysqli_num_rows($resultado) > 0) {            
            while($linha = mysqli_fetch_assoc($resultado)) {
                $id_curriculo = $linha["id_curr"];                
            }
        }
        else{
            echo "Nenhum dado encontrado!";
        }
        return $id_curriculo;
    }

    // Função para recuperar o id do usuario que está logado
    function id_do_usuario($email_logado){
        include 'conecta.php';
        $sql_2 = "SELECT * FROM usuarios WHERE email='$email_logado'";
        // armazena o resultado da consulta
        $resultado = mysqli_query($conexao, $sql_2);
        $id_usuario = "";
        if (mysqli_num_rows($resultado) > 0) {            
            while($linha = mysqli_fetch_assoc($resultado)) {
                $id_usuario = $linha["id"];                
            }
        }
        else{
            echo "Nenhum dado encontrado!";
        }
        return $id_usuario;
    }

    $id_do_curriculo = pega_id_curr($email_logado);
    $id_do_usuario = id_do_usuario($email_logado);

    //echo "Número do Currículo ==> $id_do_curriculo <br>"; 
    //echo "Número ID do Usuário ==> $id_do_usuario <br>";

    // Função para alterar as tabelas Usuarios e Curriculo 
    // dados para serem alterados em Usuários: nome, email e cpf ==> chave: id
    // dados para serem alterados em Curriculo: nome, email ==> chave: id_curr

    function altera_dados($id_do_curriculo,$id_do_usuario,$nome_novo,$email_novo,$cpf_novo){
        include 'conecta.php';
        $altera_usuarios = "UPDATE usuarios SET nome='$nome_novo',email='$email_novo',cpf='$cpf_novo' WHERE id='$id_do_usuario'";
        $altera_curriculo = "UPDATE curriculo SET nome='$nome_novo',email='$email_novo' WHERE id_curr='$id_do_curriculo'";
        if ((mysqli_query($conexao, $altera_usuarios))&&(mysqli_query($conexao, $altera_curriculo))) {
            ?>
            <script type="text/javascript">
                alert("Dados Alterados. Faça Login novamente!");                
                window.location.href = "logout.php";                
            </script>
            <?php
        } 
        else {
            echo "Erro na atualização do registro: " . mysqli_error($conexao);
        }
    }

    altera_dados($id_do_curriculo,$id_do_usuario,$nome_novo,$email_novo,$cpf_novo);
?>