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
    <form class="was-validated" action="connect.php" method="post">
        <div class="container p-3 bg-info bg-opacity-10 border border-info border-start-0 rounded-end">
  
            <div class="form-row col-md-4">
                <label> Płeć:</label>
                <select class="form-select" name="plec" aria-label="WyborPlci" required>
                    <option selected>Wybierz płeć pacjenta</option>
                    <option value="1">Kobieta</option>
                    <option value="2">Mężczyzna</option>
                    <option value="3">Inne</option>
                </select>
            </div> 
            <br>
            <div class="row">
                <div class="col-md-4 mb-3 ">
                    <label for="imie" class="form-label">Imię:</label>
                    <input type="text" class="form-control" id="imie" name="imie" placeholder="Imię" value="" required>
                    <div class="valid-feedback"></div>
                    <div class="invalid-feedback">Proszę wprowadzić imię pacjenta.</div>
                </div>
    
                <div class="col-md-4 mb-3 ">
                    <label for="drugie_imie" class="form-label">Drugie imię:</label>
                    <input type="text" class="form-control" name="drugie_imie" placeholder="Drugie imię" value="" >
                </div>
            </div>
            
            <div class="col-md-4 mb-3 ">
                <label for="nazwisko" class="form-label">Nazwisko:</label>
                <input type="text" class="form-control" id="nazwisko" name="nazwisko" placeholder="Nazwisko" value="" required>
                <div class="valid-feedback"></div>
                <div class="invalid-feedback">Proszę wprowadzić nazwisko pacjenta.</div>
            </div>


            <div class="col-md-4 mb-3 ">
                <label for="nrPESEL" class="form-label">PESEL:</label>
                <input type="text" minlenght='11' maxlength="11" class="form-control" id="nrPESEL" name="nrPESEL" placeholder="PESEL" value="" required>
                <div class="valid-feedback"></div>
                <div class="invalid-feedback">Proszę wprowadzić numer PESEL pacjenta.</div>
            </div>
  
            <div class="conatainer col-md-4">
                <label for="startDate">Data urodzenia:</label>
                <input id="startDate" class="form-control" name="startDate" type="date" required/>
                <div class="valid-feedback"></div>
                <div class="invalid-feedback">Proszę wprowadzić datę urodzenia pacjenta.</div>
            </div>
        </div>

        <br>

        <div class="container p-2 mb-2 bg-info bg-opacity-10 border border-info border-start-0 rounded-end">
            
            <div class="col-md-3 mb-3 ">
                <label for="nrTelefonu">Numer telefonu:</label>
                <input type="text" maxlength="9" class="form-control" id="nrTelefonu" name="nrTelefonu" placeholder="Numer telefonu" required>
                <div class="valid-feedback"></div>
                <div class="invalid-feedback">Proszę wprowadzić numer telefonu.</div>
            </div>

            <div class="col-md-3 mb-3 ">
                <label for="adresEmail">Andres e-mail:</label>
                <input type="email" class="form-control" id="AdresEmail" name="AdresEmail" placeholder="Adres e-mail">
            </div>
        </div>  
        
        <br>

        <div class="container p-2 mb-2 bg-info bg-opacity-10 border border-info border-start-0 rounded-end">

            <div class="col-md-6 mb-3">
                <label for="miejscowosc">Miejscowość:</label>
                <input type="text" class="form-control" id="miejscowosc" name="miejscowosc" placeholder="Miejscowość" required>
                <div class="valid-feedback"></div>
                <div class="invalid-feedback">Proszę wprowadzić prawidłową nazwę miejscowości.</div> 
            </div>

            <div class="col-md-6 mb-3">
                <label for="adres">Ulica:</label>
                <input type="text" class="form-control" id="adres" name="ulica" placeholder="Nazwa ulicy" required>
                <div class="valid-feedback"></div>
                <div class="invalid-feedback">Proszę wprowadzić prawidłowy adres.</div>
            </div>
            
            <div class="row">
                <div class="col-md-3 mb-3 ">
                    <label for="adres">Numer domu:</label>
                    <input type="text" class="form-control" id="adres" name="nrDomu" placeholder="Numer domu" required>
                    <div class="valid-feedback"></div>
                    <div class="invalid-feedback">Proszę wprowadzić numer domu.</div>
                </div>
                <div class="col-md-3 mb-3 ">
                    <label for="adres">Numer mieszkania:</label>
                    <input type="text" class="form-control" id="adres" name="nrMieszkania" placeholder="Numer mieszkania">
                </div>
                <div class="col-md-3 mb-3">
                    <label for="KodPocztowy">Kod pocztowy:</label>
                    <input type="text" class="form-control" id="KodPocztowy" name="KodPocztowy" placeholder="Kod pocztowy" required>
                    <div class="valid-feedback"></div>
                    <div class="invalid-feedback">Proszę wprowadzić prawidłowy kod pocztowy.</div>
                </div>
            </div>
            
            <div class="form-row col-md-6">
                <label> Wielkość miejsca zamieszkania:</label>
                <select class="form-select" name="wielkoscMiejscowosci" aria-label="Default select example">
                <option selected>Wybierz wielkość miejsca zamieszkania</option>
                <option value="1">< 20 tys.</option>
                <option value="2">20 tys. - 100 tys.</option>
                <option value="3">> 100 tys.</option>
                </select>
            </div>
        
            <br>

            <div class="form-group">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="invalidCheck3" required>
                    <label class="form-check-label" for="invalidCheck3">
                    Zgoda na warunki korzystania
                    </label>
                    <div class="valid-feedback"></div>
                    <div class="invalid-feedback">Musisz wyrazić zgodę na warunki korzystania przed zatwierdzeniem.</div>
                </div>
            </div>

            <br>
            <a href="http://127.0.0.1:3000/kafelki.html" class="submit btn btn-primary">Powrót do strony głównej</a>
            <button class="btn btn-primary" type="submit" name="submit">Zatwierdź formluarz</button>
            
        </div>
    </form>

</body>
</html>