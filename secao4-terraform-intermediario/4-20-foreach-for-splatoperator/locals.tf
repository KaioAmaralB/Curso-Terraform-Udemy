locals {

    # Arquivos de exemplos
  files = ["ips.json", "report.csv", "sitemap.xml"]

    # Variável com a função de de mostrar qual a extensão do arquivo
  file_extensions = [for file in local.files : regex("\\.[0-9a-z]+$", file)]

    # Não mostra as extensões .json e nos mostra as extensões em uppercase
  file_extensions_upper = { for f in local.file_extensions : f => upper(f) if f != ".json" }

    # Para exemplos de for e splat
  ips = [

      
    {

      public : "123.123.123.22",

      private : "123.123.123.23",

    },
    {

      public : "122.123.123.22"

      private : "122.123.123.23",

    }

  ]

}