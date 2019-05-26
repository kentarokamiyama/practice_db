INSERT INTO device(model_name, os_id, os_version, carrier_id)
VALUES
    ('Galaxy Note9', 1, '8.1', 2)
    ,('Xperia XZ3', 1, '8.0', 2)
    ,('iPhone 8', 2, '12.1', 2)
;

INSERT INTO device_lend_status (device_id)
SELECT
    device_id
FROM device
;
