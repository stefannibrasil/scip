Notes and exercises from [SCIP - Structure and Interpretation of Computer Programs](https://mitpress.mit.edu/sites/default/files/sicp/full-text/book/book.html).

## How to run

This project uses the LISP dialet [CHICKENscheme](https://code.call-cc.org/), a practical and portable scheme system.

If you want to install CHICKEN:

- Visit the [Download](https://code.call-cc.org/) page
- Download the latest CHICKEN release
- Extract the file
- Enter the extracted file directory
- Run `make PLATFORM=<platform> PREFIX=<destination>` # run `make` to see the options
- Run `make PLATFORM=yourplatform check`      
- Verify it installed correctly by typying `csi`. It should get you to the interactive shell
- To exit it, press Ctrl + D