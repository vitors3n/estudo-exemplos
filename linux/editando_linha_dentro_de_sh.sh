# script.sh - antes

#!/bin/bash

# Original script content
echo "Before START"
# START
echo "Between START and END"
# END
echo "After END"

# replace.sh
sed '/# START/,/# END/{//!d; /# START/a\
# New content inserted here\
echo "New line added"' script.sh > temp.sh && mv temp.sh script.sh

# script.sh - depois
#!/bin/bash
# Original script content
echo "Before START"
# START
# New content inserted here
echo "New line added"
# END
echo "After END"

# O comando deleta todas as linhas entre START e END
