# Siscori_Bike_Eletrica
 Siscori para Importação de Bicicleta Elétrica

 **Como usar**
 Na pasta "juntar" encontram-se arquivo xlsx da série história e os arquivos mensais ainda não analisados.

 Crie uma pasta de trabalho com uma subpasta "juntar" e rode o código.
 
 **Formato**
 
 Os dados da SISCORI usam como separadores o @, e devem ser importados no Excel. Por isso, estão sendo disponibilizados os dados já organizados.

 Estão disponíveis as bases xlsx a partir de 2020. 

  
 **Conteúdo**
 Contém dados de comércio exterior do Ministério da Economia. A base da dados SISCORI  é o sistema de apoio da Receita Federal do Brasil - RFB que disponibiliza um determinado conjunto de informações a respeito das importações e exportações brasileiras, e oferece apoio a diferentes sistemas e análises estatísticas em geral. Por motivos de sigilo, a base disponível traz apenas informações cujos códigos na NCM (Nomenclatura Comum do Mercosul) estejam relacionados a operações promovidas por pelo menos quatro operadores no período considerado (mês). Sendo assim, o total das importações apresentado pelo sistema seria menor que o número real de importações caso não houvessem importadores suficientes. Mas, no caso, a categoria na qual a bicicleta elétrica é alocada, só não há dados em abril de 2017. A base SISCORI disponibiliza dados a partir de janeiro de 2016.

O Capítulo 87 da NCM é destinado à importação de ‘Veículos automóveis, tratores, motocicletas e ciclomotores’. Até 2016 o código que acolhia as bicicletas elétricas era 87.11.9000 - Outras motocicletas/ciclos, com motor auxiliar com ou sem carros laterais. A partir de 2017, foi criado o código 87.11.6000 que exclui motocicletas mas ainda leva em consideração veículos elétricos em geral. A saber, os dados de 2017 ainda contém alguns códigos 87.11.9000. 

Nesta base, a descrição do produto é feita pelo próprio importador. Assim, para selecionar os registros pertinentes foram extraídos da descrição termos que identificam bicicletas elétricas, como “bicicleta”, “e-bike”, “bike eletrica”, “electric bike” e “pedal”. A figura a seguir ilustra um trecho da base de dados com uma ocorrência de “bicicleta”. É preciso salientar que este método não é totalmente preciso, e pode subestimar a quantidade de bicicletas elétricas importadas, principalmente por aspectos como erros de digitação e abreviações. A contagem de bicicletas elétricas importadas foi totalizada pelo campo “quantidade comercializada”. 

