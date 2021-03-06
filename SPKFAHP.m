namaMahasiswa = {'Agung' 'Friska' 'Hanan' 'Ayak' 'Ivan' 'Riris' 'Eva' 'Rifqi'};

data = [ 90 80 70
         70 60 89
         90 65 55
         80 70 60
         80 80 70
         70 90 89
         88 76 90
         87 97 80];

nilaiMatematika = 100;
nilaiBahasaIndonesia = 100;
nilaiBahasaInggris = 100;

data(:,1) = data(:,1) / nilaiMatematika;
data(:,2) = data(:,2) / nilaiBahasaIndonesia;
data(:,3) = data(:,3) / nilaiBahasaInggris;

relasiAntarKriteria = [ 1     2     2
                        0     1     4
                        0     0     1];
 
TFN = {[-100/3 0     100/3]     [3/100  0     -3/100]
       [0      100/3 200/3]     [3/200  3/100 0     ]
       [100/3  200/3 300/3]     [3/300  3/200 3/100 ]
       [200/3  300/3 400/3]     [3/400  3/300 3/200 ]};                    
                    
[RasioKonsistensi] = HitungKonsistensiAHP(relasiAntarKriteria)
if RasioKonsistensi < 0.10
    % Metode Fuzzy AHP
    [bobotAntarKriteria, relasiAntarKriteria] = FuzzyAHP(relasiAntarKriteria, TFN);    

    % Hitung nilai skor akhir 
    ahp = data * bobotAntarKriteria';
    
    disp('Hasil Perhitungan dengan metode Fuzzy AHP')
    disp('Nama Mahasiswa, Skor Akhir, Kesimpulan')
end

    for i = 1:size(ahp, 1)
        if ahp(i) < 0.5
            status = 'Kurang';
        elseif ahp(i) < 0.75
            status = 'Cukup';
        elseif ahp(i) >= 0.75
            status = 'Baik';
        end
        
        disp([char(namaMahasiswa(i)), blanks(13 - cellfun('length',namaMahasiswa(i))), ', ', ... 
             num2str(ahp(i)), blanks(10 - length(num2str(ahp(i)))), ', ', ...
             char(status)])
    end



