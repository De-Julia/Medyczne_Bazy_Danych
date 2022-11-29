﻿<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Medyczne_Bazy_Danych</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" 
    rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" 
    crossorigin="anonymous">
  </head>
  <body>
    <div class=""align-items-center>
    <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
        <symbol id="check-circle-fill" viewBox="0 0 16 16">
          <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
        </symbol>
    </svg>
        <div class="alert alert-success d-flex align-items-center" role="alert">
            <svg class="bi flex-shrink-0 me-2" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
            <div>
                Rejestracja przebiegła pomyślnie
            </div>
          </div>
          <div class="container">
    <a href="http://127.0.0.1:3000/kafelki.html" class="submit btn btn-primary">Powrót do strony głównej</a>
    <a href="http://127.0.0.1:3000/lista_pacjentow.html" class="submit btn btn-primary">Przejdź do listy pacjentów</a>
        
    </div>
</body>
<?php
    //Database connection
    $db = mysqli_connect("localhost", "test-user123", "User!234", "klinika_db");
    if (mysqli_connect_errno()){
    echo ("Błąd połączenia z bazą danych");
    exit;
    }
    if(isset($_POST["submit"])){
    $nrPESEL = $_POST['nrPESEL'];
    $Imię = $_POST['imie'];
    $Nazwisko = $_POST['nazwisko'];
    $Płeć = $_POST['plec'];
    $DataUrodzenia = $_POST['startDate'];
    $miejscowosc = $_POST['miejscowosc'];
    $adres = $_POST['adres'];
    $KodPocztowy = $_POST['KodPocztowy'];
    $wielkoscMiejscowosci = $_POST['wielkoscMiejscowosci'];
    }

    //$query1 = "INSERT INTO daneusera VALUES('', 'user4', '123', '$Imię', '$Nazwisko', '$nrPESEL', '', NOW(), NOW())";
    //mysqli_query($db, $query1);
    $query2 = "INSERT INTO pacjenci VALUES('', '$nrPESEL', '$Imię', '$Nazwisko', '$Płeć', '$DataUrodzenia', NOW(), NOW(), '1')";
    mysqli_query($db, $query2);
?>
</html>
