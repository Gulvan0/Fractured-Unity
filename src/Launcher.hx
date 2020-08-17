package;

import sys.FileSystem;
import sys.io.FileOutput;
import sys.io.File;
import openfl.net.URLRequest;
import openfl.net.URLLoaderDataFormat;
import openfl.events.Event;
import openfl.net.URLLoader;
import hxassert.Assert;

class Launcher 
{
    private static var created:Bool = false;

    public var retry:Void->Void;
    private var onLoggedIn:Void->Void;
    private var onLoginRequired:Void->Void;
    private var onFail:Void->Void;

    private var exePath:String;

    private function startLoggingIn()
	{
		#if skiplogin
		ConnectionManager.debugLogIn(onLoggedIn);
		#else
		if (FileSystem.exists(Main.exePath() + "logindata.d"))
		{
			var a:Array<String> = File.getContent(Main.exePath() + "logindata.d").split("|");
			ConnectionManager.logIn(a[0], a[1], onLoggedIn);
		}
		else
            onLoginRequired();
		#end
	}

    private function tryConnect():Bool
	{
		try
		{	
			ConnectionManager.init(Main.ip, Main.port);
		}
		catch (e)
		{
			onFail();
			return false;
		}
		return true;
	}

	private function checkVersion(onUpToDate:Void->Void)
	{
		var s = haxe.Http.requestUrl("https://raw.githubusercontent.com/Gulvan0/Fractured-Unity/master/version.txt");
		if (s == Main.version)
			onUpToDate();
		else
		 	updateClient();
	}

	private function updateClient()
	{
		var loader:URLLoader = new URLLoader();
		loader.addEventListener(Event.COMPLETE, function (e:Event) //TODO: Is it working?
		{
			var fo:FileOutput = File.write(exePath + "inst.exe");
			fo.write(loader.data);
			fo.close();
			fo = File.write(exePath + "updated.bool");
			fo.writeString("true");
			fo.close();
			FileSystem.rename(Sys.programPath(), exePath + "FracturedUnity-old.exe");
			Sys.command(exePath + "inst.exe & timeout 5 & " + exePath + "FracturedUnity.exe");
			Sys.exit(1);
		});
		loader.dataFormat = URLLoaderDataFormat.BINARY;
		loader.load(new URLRequest("https://raw.githubusercontent.com/Gulvan0/Fractured-Unity/master/installer.exe?raw=true"));
    }
    
    private function cleanDir()
    {
        var oldexe:String = exePath + "FracturedUnity-old.exe";
		if (FileSystem.exists(oldexe))
			if (Sys.programPath() != oldexe)
				FileSystem.deleteFile(oldexe);
			else
				Sys.exit(0);
		if (FileSystem.exists(exePath + "inst.exe"))
			FileSystem.deleteFile(exePath + "inst.exe");
    }

    private function connectAttempt()
    {
        if (tryConnect())
            #if nocheck
                startLoggingIn();
            #else
                checkVersion(startLoggingIn);
            #end
    }

	public function launch()
	{
		cleanDir();
		connectAttempt();
	}
	
	public function init(onLoggedIn:Void->Void, onLoginRequired:Void->Void, onFail:Void->Void)
	{
		this.onLoggedIn = onLoggedIn;
        this.onLoginRequired = onLoginRequired;
        this.onFail = onFail;
	}
    
    public function new()
    {
        Assert.require(!created);
        retry = connectAttempt;
        exePath = Main.exePath();
        created = true;
    }
}