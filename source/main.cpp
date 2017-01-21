#include <fstream>
#include <cstdlib>
#include <unistd.h>

#include <3ds.h>


void about() {
    consoleInit(GFX_BOTTOM, NULL);
	printf(CONSOLE_RED "\n 3DeMore " VERSION_STRING " by Kyraminol\n\n" CONSOLE_RESET);
    printf("  Reset demo use counter quickly.\n\n\n");
    printf(CONSOLE_BLUE " Thanks to:\n\n" CONSOLE_RESET);
	printf("  smealum, steveice10.\n");
    printf("\n\n Commit: " REVISION_STRING);
}


void moardemoplz(){
	Result res = AM_DeleteAllDemoLaunchInfos();
	if (R_FAILED(res))
		printf("\n\n Failed to reset, please report to the thread...");
	else
		printf("\n\n All done!");
	printf("\n\n  Auto exiting...");
}

bool AMnet(){
	Handle amHandle;
	Result res = srvGetServiceHandle(&amHandle, "am:net");
	if(R_SUCCEEDED(res)){
		return true;
	} else {
		return false;
	}
}

int main(int argc, const char* argv[])
{
	gfxInitDefault();
	
	about();
    consoleInit(GFX_TOP, NULL);
	
	if(AMnet()){
		printf("\n Got am:net handle.");
		amInit();
		moardemoplz();
		amExit();
	} else {
		printf("\n Failed to get am:net handle, did you patch svc?");
	}
	
	usleep(3 * 1000 * 1000);
    gfxExit();
	return 0;
}