#include <stdio.h>
#include "Definitions.h"
#include "Message.h"
#include "Process_File.h"
#include "Process_Stdin.h"

int main(int argc,char* argv[]){
    int idx=1;
    int ok_proc=1;
	if ((argc-1==SINGLE_ARG)&&(Is_Option(argv[POS_SINGLE])))
		Print_Option_Msg(argv[POS_SINGLE]);
	else{
		while (!(UNSUCCESS_EXECUTION(ok_proc))&&(idx<=argc)){
			ok_proc=(Is_Stdin(idx,argc,argv[idx]))?
			(Process_Stdin()):
			(Process_File(argv[idx],argc,idx));
			++idx;
		}
		if (UNSUCCESS_EXECUTION(ok_proc)) return ERROR_MSJ(ok_proc);
	}
    return 0;
}
