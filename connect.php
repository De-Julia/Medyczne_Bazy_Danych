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
    echo "Rejestracja przebiegła pomyślnie :)";
?>
