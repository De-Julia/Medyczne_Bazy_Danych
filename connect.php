<!doctype html>
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
    <a href="http://127.0.0.1:3000/kafelki.html" class="submit btn btn-primary">Powrót do strony głównej</a>
        <button class="btn btn-primary" type="submit">Zatwierdź formluarz</button>
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
</body>
</html>
