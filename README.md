# TEMA 1 - MN

## Anomaly Detection

### estimate_gaussian.m

La început am scris manual algoritmul după formulă, însă după niște documentație am ales să folosesc funcția mean, iar matricea de varianță o pot calcula cu funcția cov(), fiincă fiecare X(i) este considerat ca o variabilă diferită.

Aceasta era versiunea originală:
```matlab
[m, n] = size(X);

    mean_values = zeros(1,n);

    for i = 1 : n
        s = 0;
        for k = 1 : m
        s += X(k,i);
        endfor
        mean_values(i) = s / m;
    endfor

    variances = (X(1:m,:) - mean_values)' * (X(1:m,:) -mean_values);
    variances /= m;
```
, funcționa perfect, însă pentru un cod mai simplu am ales să folosesc funcțiile directe.

### multivariate_gaussian.m

Nu e mare lucru, am reprodus formula care este dată și în condiția temei, singurul lucru puțin dubios e fișierul gaussian_distribution.m, care într-un fel nu este necesar, formula o puteam fa cedirect în multivariate_gaussian.m

M-am gândit că poate trebuia formula de la distribuția normală a lui Gauss de scris acolo, însă până la urma am împărțit multivariate_gaussian.m în cele două fișiere.

### optimal_threshold.m

Din nou, am făcut totul după cei trei pași dați în condiția temei, nimic special, am calculat minimul și maximul dintre probabilități, am iterat un epsilon între aceste două extreme, calculând la fiecare pas precizia fiecăruia prin numărul de false_positives, false_negatives, true_positives, care influențau variabilele precision, recall, F1. La final este salvat valoarea lui epsilon care a avut un F1 maximal.

#### check_predictions.m

Am folosit sum() să calculez fiecare variabilă, am încercat la început cu for însă viteza era deplorabilă:
```matlab
    true_positives = 0;
    false_negatives = 0;
    false_positives = 0;

    for i = 1 : length(predictions)
        if (predictions(i) == 1 && truths(i) == 1) true_positives++; endif
        if (predictions(i) == 1 && truths(i) == 0) false_positives++; endif
        if (predictions(i) == 0 && truths(i) == 1) false_negatives++; endif
    endfor
```

#### metrics.m

Calculează literalmente după formulele din temă precizia, recall-ul și F1.

### identify_outliers.m

Era deja completată, se folosește de funcțiile menționate anterior pentru a extrage anomaliile din dataset.

## Kernel Regression

Ăsta mi s-a părut cel mai complicat task dintre toate, probabil pentru că a fost cel mai lung de scris, dar și pentru că a trebuit să învăț temele de la MN (asta primesc dacă nu merg la curs •ᴗ•).

### linear_kernel.m / polynomial_kernel_m / gaussian_kernel.m

Am scris formulele pentru fiecare, sunt în temă.

### split_dataset.m

Împarte dataset-ul în training data și testing data după linia de separate, formula este în temă.

### build_kernel.m

De asemenea am scris formula din temă, nimic special.

### cholesky.m

Am folosit funcția din librărie, pentru că funcția din materia era foarte lentă.

### get_lower_inverse.m

Am învățat (serios) primele metode de la eliminarea gaussiană, și am ales să mă bazez pe algoritmul GPP pentru a calcula inversa unei matrici fiindcă e mai stabil ca algoritmul G. Am făcut modificările necesare ca să lucrez nu cu un vector b, ci cu matricea unitate, în plus pentru a nu face două loop-uri pentru sub și deasupra diagonalei, am făcut unul în care scad direct liniile pentru ca la final să am la stâng amatricea unitate și la ddreapta inversa lui L.

### get_prediction_params.m

Este efectiv formla din temă, doar că folosește și factorizarea Cholesky

### conjugate_gradient.m

Mi-a luat ceva până să îmi dau seama cu indecșii din pseudocodul din temă, iar după ce o făcusem să meargă era atât de urât codul, că am șters toți indecșii și am făcut o variabilă tmp să păstrez r-ul vechi pentru a calcula s_k.

###  get_prediction_params_iterative.m

Am căutat niște valori la toleranță și numărul de iterații să dea un răspuns cât mai precis, însă și să fie destul de rapid, și așa programul aici deja mergea ceva mai greu.

### eval_value.m

Din nou, formula pentru y_pred este în temă, singura modificare este că nu am împărțit suma la 1/lambda, fiindcă la calcularea vectorului a deja fac această împărțire (mi-a luat ceva până mi-am dat seama de ce îmi dădeau probabilitățile prea mici).

## Stochastic Text Gen

Taskul acest mi-a plăcut cel mai mult pentru că a fost un concept interesant, și nu am avut mult de scris

### k_secv.m / k_secv_idx.m / distinct_k_secv.m / distinct_words.m / word_idx.m

Fiecare funcție are efectiv o linie de cod în care sortez și elimin duplicate, sau creez Map-up pentru secvențe / cuvinte (îmi plac one-linerele).

### stochastic_matrix.m

Cred că funția asta mi-a luat ccel mai mult decât tot restul temei, și nu pentru că e complicată, doar că ultimul test mergea jumătate de oră pe versiunea originală cu 3 for-uri imbricate.

Fun fact: numel() este exponențial mai rapid ca lenght() pe array-uri mari

La început am încercat să iterez prin k_secv_set, să caut ocurențele pentru fiecare secvență în corpus, după să caut indexul cuvântului următor din corpus în lista sortată, și clar că asta lua foarte mult timp să ruleze.

Am încercat să folosesc dicționarele din funcțiile anterioare, însă tot nu era suficientă viteză.

Am găsit funcția ismember() care spre deosebire de containers.Map nu ține cont de cheie și îmi poate returna direct un array de indecși care fac legătura dintre secvența / cuvânt din lista originală cu poziția lor în matricea stochastică.

secv_idx reprezintă direct indexul secvenței i din corpus în k_secv_set, acelaș lucru este și la words_set_idx.

De exemplu secv_idx(7) este indexul secvenței nr. 7 din lista necurățată în lista k_secv_set, ceea ce corespunde cu rândul din matricea stochastică.

words_set_idx(4) este indexul al 4-lea cuvânt din corpus în word_set, ceea ce corespunde cu coloana din matricea stochastică.

Combinând aceste două liste, am găsit o soluție care nu îmi lua 5 minute să dea WA.

### sample_next_word.m / sample_n_words.m

Am încercat să fac o logică simplă, până la urmă mi-a mers și mi-a generat un text random cu cuvinte din fișierul cu Shakespeare care chiar erau legate token cu toke, am verificat.