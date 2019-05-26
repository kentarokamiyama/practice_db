/* テーブル１個からデータを取得する */
-- 端末データを全部取得
SELECT
    *
FROM device
;
-- ＜モデル名＞だけ取得
SELECT
    model_name
FROM device
;
-- iOS端末だけ取得
SELECT
    *
FROM device
WHERE
    os_id = 2
;
-- モデル名に'xperia'が含まれる端末を取得
SELECT
    *
FROM device
WHERE
    model_name LIKE '%xperia%'
;
-- 返却されていない貸出データ
SELECT
    *
FROM lend
WHERE
    return_flag = 0
;
-- 端末ごとの貸出回数
SELECT
    device_id
    ,COUNT(*)
FROM lend
GROUP BY
    device_id
;
-- 当日もしくは翌日に返却された貸出
SELECT
    *
FROM lend
WHERE
    return_flag = 1
    AND (
        DATEDIFF(return_datetime, lend_datetime) <= 1
    )
;

/* 複数のテーブルからデータを取得する */
-- 端末のモデル名、OS名、通信キャリア名を取得
SELECT
    D.device_id
    ,D.model_name
    ,OM.os_name
    ,CM.carrier_name
FROM device AS D
INNER JOIN os_master AS OM
    ON D.os_id = OM.os_id
INNER JOIN telecom_carrier_master AS CM
    ON D.carrier_id = CM.carrier_id
;
-- 貸出中の端末
SELECT
    D.device_id
    ,D.model_name
FROM device_lend_status AS S
INNER JOIN device AS D
    ON S.device_id = D.device_id
WHERE
    S.lended = 0
;

-- 返却していない端末をもっている利用者
SELECT
    CONCAT(U.last_name, ' ', U.first_name) AS user_name
FROM user AS U
WHERE
    EXISTS (
        SELECT
            *
        FROM lend
        WHERE
            return_flag = 0
            AND user_id = U.user_id
    )
;
-- 返却していない端末をもっている利用者と、その利用者がもっている端末数
SELECT
    L.user_id
    ,L.device_count
    ,CONCAT(U.last_name, ' ', U.first_name) AS user_name
FROM (
    SELECT
        user_id
        ,COUNT(device_id) AS device_count
    FROM lend
    WHERE
        return_flag = 0
    GROUP BY
        user_id
) AS L
INNER JOIN user AS U
    ON L.user_id = U.user_id
;

