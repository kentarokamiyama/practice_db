/*******************************************
 * 端末データ
 *******************************************/
-- キャリアマスタ
CREATE TABLE telecom_carrier_master (
    carrier_id INT NOT NULL AUTO_INCREMENT
    ,carrier_name VARCHAR(128) NOT NULL
    ,created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    ,updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    ,PRIMARY KEY (carrier_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- OSマスタ
CREATE TABLE os_master (
    os_id INT NOT NULL AUTO_INCREMENT
    ,os_name VARCHAR(128) NOT NULL
    ,created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    ,updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    ,PRIMARY KEY (os_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 端末データ
CREATE TABLE device (
    device_id INT NOT NULL AUTO_INCREMENT
    ,model_name VARCHAR(255) NOT NULL
    ,os_id INT NOT NULL
    ,os_version VARCHAR(128) NOT NULL
    ,carrier_id INT NOT NULL DEFAULT 0
    ,created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    ,updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    ,PRIMARY KEY (device_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 端末貸出状況データ
CREATE TABLE device_lend_status (
    device_id INT NOT NULL
    ,lended TINYINT NOT NULL DEFAULT 0
    ,created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    ,updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    ,PRIMARY KEY (device_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*******************************************
 * 利用者データ
 *******************************************/
-- 事業部マスタ
CREATE TABLE division_master (
    division_id INT NOT NULL AUTO_INCREMENT
    ,division_name VARCHAR(255) NOT NULL
    ,created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    ,updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    ,PRIMARY KEY (division_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 利用者データ
CREATE TABLE user (
    user_id INT NOT NULL AUTO_INCREMENT
    ,last_name VARCHAR(128) NOT NULL
    ,first_name VARCHAR(128) NOT NULL
    ,email_address VARCHAR(255) NOT NULL
    ,division_id INT NOT NULL
    ,created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    ,updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    ,PRIMARY KEY (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*******************************************
 * 貸出データ
 *******************************************/
-- 貸出データ
CREATE TABLE lend (
    lend_id INT NOT NULL AUTO_INCREMENT
    ,device_id INT NOT NULL
    ,user_id INT NOT NULL
    ,lend_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP 
    ,return_due_date DATE NOT NULL
    ,return_datetime DATETIME NOT NULL DEFAULT '1900-01-01'
    ,return_flag TINYINT NOT NULL DEFAULT 0
    ,PRIMARY KEY (lend_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
