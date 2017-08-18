
#GIS APIs - Automation Functional Tests

### 1) Instalar as gems

            $ bundle install

### 2) Executar os cenários

Default:

            $ cucumber

Especificando o ambiente: QA (default) ou STG

            $ cucumber ENV=stg


Especificando uma tag

            $ cucumber ENV=stg --tags @stg
