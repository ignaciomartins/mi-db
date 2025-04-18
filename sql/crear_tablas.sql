-- Crear tabla 'items' (tipos de ítems: iPhone, MacBook, etc.)
CREATE TABLE items (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL
);

-- Crear tabla 'especificaciones_iphone' para los iPhones
CREATE TABLE especificaciones_iphone (
  id INT AUTO_INCREMENT PRIMARY KEY,
  modelo VARCHAR(10),            -- '13', '14', '15'
  version VARCHAR(20),           -- 'Base', 'Plus', 'Pro', 'ProMax'
  caja BOOLEAN DEFAULT TRUE,     -- TRUE si tiene caja
  almacenamiento VARCHAR(10),    -- '256GB', '512GB', '1TB'
  region VARCHAR(20),            -- 'Europeo', 'Japonés', 'Latino', 'Otro'
  UNIQUE(modelo, version, caja, almacenamiento, region)
);

-- Crear tabla 'stock' para gestionar la cantidad de cada ítem
CREATE TABLE stock (
  id INT AUTO_INCREMENT PRIMARY KEY,
  item_id INT NOT NULL,          -- Relación con 'items'
  especificacion_id INT NOT NULL, -- Relación con 'especificaciones_iphone'
  cantidad INT NOT NULL DEFAULT 0,
  FOREIGN KEY (item_id) REFERENCES items(id) ON DELETE CASCADE,
  FOREIGN KEY (especificacion_id) REFERENCES especificaciones_iphone(id) ON DELETE CASCADE
);
