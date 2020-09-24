package graphic.components.startmenu;

import openfl.display.Sprite;
using graphic.Utils;

class StartMenu extends Sprite
{
    private var loginForm:LoginForm;
    private var cantConnect:CantConnect;

    public function generateLoginForm(onDataLoaded:Void->Void)
	{
		var loginForm:LoginForm = new LoginForm();
		loginForm.onDataLoaded = onDataLoaded;
		loginForm.centre();
		addChild(loginForm);
    }

    public function generateCantConnect(retryCb:Void->Void, ?connectionLost:Bool = false)
	{
		cantConnect = new CantConnect(retryConnecting.bind(retryCb), connectionLost);
		cantConnect.centre();
		addChild(cantConnect);
    }

    private function retryConnecting(retryCb:Void->Void)
    {
        if (cantConnect.stage != null)
            removeChild(cantConnect);
        retryCb();
    }
    
    public function new()
    {
        super();
    }
}