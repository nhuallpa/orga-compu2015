#include "Definitions.h"

int is_regular(const char* filename){
    struct stat sb;
    if (stat(filename,&sb)== ERROR){
     return ERROR;
    }
    return S_ISREG(sb.st_mode);
}
