-- 問1
-- 国名を全て抽出してください。
SELECT 
    name 
FROM 
    countries
;

-- 問2
-- ヨーロッパに属する国をすべて抽出してください。
SELECT 
    * 
FROM 
    countries 
WHERE 
    continent = 'Europe'
;

-- 問3
-- ヨーロッパ以外に属する国をすべて抽出してください。
SELECT
    * 
FROM 
    countries 
WHERE 
    continent != 'Europe'
;

-- 問4
-- 人口が10万人以上の国をすべて抽出してください。
SELECT 
    * 
FROM 
    countries 
WHERE 
    population <= 100000
;

-- 問5
-- 平均寿命が56歳から76歳の国をすべて抽出してください。
SELECT 
    *  
FROM 
    countries 
WHERE 
    life_expectancy >= 56 
    AND  76 >= life_expectancy
;

-- 問6
-- 国コードがNLB,ALB,DZAのもの市区町村をすべて抽出してください。
SELECT 
    * 
FROM 
    cities 
WHERE 
    country_code = 'NLB' 
    OR country_code = 'ALB' OR country_code = 'DZA'
;

-- 問7
-- 独立独立記念日がない国をすべて抽出してください。
 SELECT 
    * 
FROM 
    countries 
WHERE 
    indep_year IS NULL
;

-- 問8
-- 独立独立記念日がある国をすべて抽出してください。
SELECT 
    * 
FROM 
    countries 
WHERE 
    indep_year IS NOT NULL
;

-- 問9
-- 名前の末尾が「ia」で終わる国を抽出してください。
SELECT 
    * 
FROM 
    countries 
WHERE 
    RIGHT(name,2) IN ('ia')
;

-- 問10
-- 名前の中に「st」が含まれる国を抽出してください。
SELECT 
    * 
FROM 
    countries 
WHERE 
    name LIKE '%st%'
;

-- 問11
-- 名前が「an」で始まる国を抽出してください。
SELECT 
    * 
FROM 
    countries 
WHERE 
    LEFT(name,2) IN ('an')
;

-- 問12
-- 全国の中から独立記念日が1990年より前または人口が10万人より多い国を全て抽出してください。
SELECT 
    * 
FROM 
    countries 
WHERE 
    indep_year < '1990' 
    OR population > '100000'
;

-- 問13
-- コードがDZAもしくはALBかつ独立記念日が1990年より前の国を全て抽出してください。
 SELECT 
    * 
FROM 
    countries 
WHERE 
    indep_year < '1990' 
    AND (code = 'DZA' OR code = 'ALB')
;

-- 問14
-- 全ての地方をグループ化せずに表示してください。
SELECT 
    region 
FROM 
    countries
;

-- 問15
-- 国名と人口を以下のように表示させてください。シングルクォートに注意してください。
-- 「Arubaの人口は1RIGHT人です」
SELECT 
    CONCAT(name,'の人口は',population,'人です') 
FROM 
    countries 
AS 
    population;

-- 問16
-- 平均寿命が短い順に国名を表示してださいNULLは表示させないでください。
SELECT 
    name,life_expectancy 
FROM    
    countries 
WHERE 
    life_expectancy IS NOT NULL 
ORDER BY 
    life_expectancy asc
;

-- 問17
-- 平均寿命が長い順に国名を表示させてください。ただしNULLは表示させないでください。
SELECT 
    name,life_expectancy 
FROM 
    countries 
WHERE 
    life_expectancy IS NOT NULL
ORDER BY 
    life_expectancy desc
;

-- 問18
-- 平均寿命が長い順、独立記念日が新し順に国名を表示させてください。
SELECT 
    name,life_expectancy,indep_year 
FROM 
    countries 
WHERE 
    life_expectancy IS NOT NULL 
ORDER BY 
    life_expectancy desc
;

-- 問19
-- 全ての国の国コードの一文字目と国名を表示させてください。
SELECT 
    substring(code,1,1),name 
FROM 
    cRIGHTies
;

-- 問20
-- 国名が長いものから順に国名と国名の長さを出力してください。
SELECT 
    name,LENGTH(name) 
FROM 
    countries 
ORDER BY 
    LENGTH(name) desc
;

-- 問21
-- 全ての地方の平均寿命、平均人口を表示してください。
SELECT 
    region,AVG(life_expectancy),AVG(population) 
FROM 
    countries 
GROUP BY 
    region 
ORDER BY 
    region ASC
;

-- 問22
-- 全ての地方の最長寿命、最大人口を表示してください。
SELECT 
    region,MAX(life_expectancy),MAX(population) 
FROM 
    countries 
GROUP BY 
    region 
ORDER BY 
    region ASC
;

-- 問23
-- アジア大陸の中で最小の表面積を表示してさい。
SELECT 
    Min(surface_area) 
FROM 
    countries 
WHERE 
    continent = 'Asia'
;

-- 問24
-- アジア大陸の表面積の合計を表示してください。
SELECT 
    SUM(surface_area) 
FROM 
    countries 
WHERE 
    continent = 'Asia'
;

-- 問25
-- 全ての国と言語を表示してください。一つの国に複数言語があると思いますので同じ国名を言語数だけ出力してください。
SELECT 
    countries.name,countrylanguages.language 
FROM 
    countries 
JOIN 
    countrylanguages 
ON 
    countries.code = countrylanguages.country_code;

-- 問26
-- 全ての国と言語と市区町村を表示してください。
SELECT 
    countries.name,cities.name,countrylanguages.language 
FROM 
    countries
JOIN 
    countrylanguages
ON 
    countries.code = countrylanguages.country_code 
JOIN 
    cities 
ON 
    countries.code = cities.country_code;

-- 問27
-- 全ての有名人を出力してください。左側外部結合を使用して国名なし（country_codeがNULL）も表示してください。
SELECT 
    celebrities.name,countries.name 
FROM 
    celebrities 
LEFT JOIN 
    countries 
ON 
    celebrities.country_code = countries.code
;

-- 問28
-- 全ての有名人の名前,国名、第一言語を出力してださい
SELECT 
    ce.name,co.name,col.language 
FROM 
    celebrities ce 
JOIN 
    countries co 
ON 
    ce.country_code = co.code
JOIN 
    countrylanguages col 
ON 
    ce.country_code = col.country_code
JOIN 
    (
        SELECT 
            country_code,MAX(percentage) AS max_value 
        FROM 
            countrylanguages GROUP BY country_code
    ) colm 
ON 
    col.country_code = colm.country_code 
    AND col.percentage = colm.max_value
;

-- 問29
-- 全ての有名人の名前と国名をに出力してください。 ただしテーブル結合せずサブクエリを使用してください。
SELECT 
    c.name, 
    (
        SELECT 
            co.name 
        FROM 
            countries co 
        WHERE 
            c.country_code = co.code
    )
FROM 
    celebrities c
;

-- 問30
-- 最年長が50歳以上かつ最年少が30歳以下の国を表示させてください。
SELECT 
    country_code,MAX(age),MIN(age) 
FROM 
    celebrities 
GROUP BY 
    country_code 
HAVING 
    MAX(age) >50 AND MIN(age) < 30
;

-- 問31
-- 1991年生まれと、1981年生まれの有名人が何人いるか調べてください。ただし、日付関数は使用せず、UNION句を使用してください。
SELECT 
    YEAR(birth),COUNT(*) 
FROM 
    celebrities 
WHERE 
    YEAR(birth) = 1980 
GROUP BY YEAR(birth) 
UNION 
SELECT 
    YEAR(birth),COUNT(*) 
FROM 
    celebrities 
WHERE 
    YEAR(birth) = 1981 
GROUP BY 
    YEAR(birth)
; 

-- 問32
-- 有名人の出身国の平均年齢を高い方から順に表示してください。ただし FROM句はcountriesテーブルとしてください。
SELECT 
    c.name,AVG(ce.age) 
FROM 
    countries c 
JOIN 
    celebrities ce 
ON 
    c.code = ce.country_code 
GROUP BY 
    ce.country_code 
ORDER BY 
    AVG(ce.age) DESC
;





