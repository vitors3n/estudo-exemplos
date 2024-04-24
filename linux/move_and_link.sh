#Move arquivos para um destino e deixa um link para o arquivo movido no diretorio de origem.
#!/bin/bash

source_dir="/path/to/source_directory"
destination_dir="/path/to/destination_directory"

if [ ! -d "$destination_dir" ]; then
    mkdir -p "$destination_dir"
fi

find "$source_dir" -type f -size +1G | while read -r file; do
    filename=$(basename "$file")
    rsync -ah --remove-source-files "$file" "$destination_dir"
    ln -s "$destination_dir/$filename" "$source_dir/$filename"
    echo "Moved and linked: $file -> $destination_dir/$filename"
done
