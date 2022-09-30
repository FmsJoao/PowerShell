# Função  para  obtermos o hash do arquivo localizado em $filePath.
function Get-FileSHA1 {
   # Bloco de parâmetros. Aqui utilizamos o atributo Parameter
   # para adornar características ao argumento $filePath.
   param(
       [Parameter(
          
           ValueFromPipeline = $true,
         
           ValueFromPipelineByPropertyName = "FullName",
          
           Mandatory = $true
       )]
       [String] $filePath
   )


   begin {
       $sha1 = New-Object System.Security.Cryptography.SHA1Managed
       $prettyHashSB = New-Object System.Text.StringBuilder
   }

   process {
       $fileContent = Get-Content $filePath
       $fileBytes = [System.Text.Encoding]::UTF8.GetBytes($fileContent)

       $hash = $sha1.ComputeHash($fileBytes)

       foreach ($byte in $hash) {
           $hexaNotation = $byte.ToString("X2")
           $prettyHashSB.Append($hexaNotation) > $null
       }

       $prettyHashSB.ToString() 
       $prettyHashSB.Clear() > $null
   }

   end {
       $sha1.Dispose()
   }
}