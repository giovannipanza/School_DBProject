-- prima soluzione
DROP DATABASE IF EXISTS prova;

create DATABASE prova;

CREATE table prova.tab1 (
  campo1 int
);

-- seconda soluzione
DROP DATABASE IF EXISTS prova;

create DATABASE prova;

use prova;

CREATE table tab1 (
  campo1 int
);