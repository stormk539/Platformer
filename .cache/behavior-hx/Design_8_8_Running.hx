package scripts;

import com.stencyl.graphics.G;
import com.stencyl.graphics.BitmapWrapper;
import com.stencyl.graphics.ScaleMode;

import com.stencyl.behavior.Script;
import com.stencyl.behavior.Script.*;
import com.stencyl.behavior.ActorScript;
import com.stencyl.behavior.SceneScript;
import com.stencyl.behavior.TimedTask;

import com.stencyl.models.Actor;
import com.stencyl.models.GameModel;
import com.stencyl.models.actor.Animation;
import com.stencyl.models.actor.ActorType;
import com.stencyl.models.actor.Collision;
import com.stencyl.models.actor.Group;
import com.stencyl.models.Scene;
import com.stencyl.models.Sound;
import com.stencyl.models.Region;
import com.stencyl.models.Font;
import com.stencyl.models.Joystick;

import com.stencyl.Config;
import com.stencyl.Engine;
import com.stencyl.Input;
import com.stencyl.Key;
import com.stencyl.utils.motion.*;
import com.stencyl.utils.Utils;

import openfl.ui.Mouse;
import openfl.display.Graphics;
import openfl.display.BlendMode;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.events.TouchEvent;
import openfl.net.URLLoader;

import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2Fixture;
import box2D.dynamics.joints.B2Joint;

import com.stencyl.graphics.shaders.BasicShader;
import com.stencyl.graphics.shaders.GrayscaleShader;
import com.stencyl.graphics.shaders.SepiaShader;
import com.stencyl.graphics.shaders.InvertShader;
import com.stencyl.graphics.shaders.GrainShader;
import com.stencyl.graphics.shaders.ExternalShader;
import com.stencyl.graphics.shaders.InlineShader;
import com.stencyl.graphics.shaders.BlurShader;
import com.stencyl.graphics.shaders.SharpenShader;
import com.stencyl.graphics.shaders.ScanlineShader;
import com.stencyl.graphics.shaders.CSBShader;
import com.stencyl.graphics.shaders.HueShader;
import com.stencyl.graphics.shaders.TintShader;
import com.stencyl.graphics.shaders.BloomShader;



class Design_8_8_Running extends ActorScript
{
	public var _PreventRunning:Bool;
	public var _RunKey:String;
	public var _KeyReleased:Bool;
	public var _OldAccel:Float;
	public var _OldMaxSpeed:Float;
	public var _AtFullSpeed:Bool;
	public var _ElapsedTime:Float;
	public var _Acceleration:Float;
	public var _MidRunSpeed:Float;
	public var _MaxRunSpeed:Float;
	public var _RightKey:String;
	public var _LeftKey:String;
	public var _TimeToMaxSpeed:Float;
	public var _CanSlide:Bool;
	public var _RunRightAnimation:String;
	public var _RunLeftAnimation:String;
	public var _SlipRightAnimation:String;
	public var _SlipLeftAnimation:String;
	public var _FullRunRightAnimation:String;
	public var _FullRunLeftAnimation:String;
	public var _AnimationCategory:String;
	
	
	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		nameMap.set("Actor", "actor");
		nameMap.set("Prevent Running?", "_PreventRunning");
		_PreventRunning = false;
		nameMap.set("Run Key", "_RunKey");
		nameMap.set("Key Released?", "_KeyReleased");
		_KeyReleased = true;
		nameMap.set("Old Accel", "_OldAccel");
		_OldAccel = 0.0;
		nameMap.set("Old Max Speed", "_OldMaxSpeed");
		_OldMaxSpeed = 0.0;
		nameMap.set("At Full Speed?", "_AtFullSpeed");
		_AtFullSpeed = false;
		nameMap.set("Elapsed Time", "_ElapsedTime");
		_ElapsedTime = 0.0;
		nameMap.set("Acceleration", "_Acceleration");
		_Acceleration = 100.0;
		nameMap.set("Mid Run Speed", "_MidRunSpeed");
		_MidRunSpeed = 25.0;
		nameMap.set("Max Run Speed", "_MaxRunSpeed");
		_MaxRunSpeed = 35.0;
		nameMap.set("Right Key", "_RightKey");
		nameMap.set("Left Key", "_LeftKey");
		nameMap.set("Time To Max Speed", "_TimeToMaxSpeed");
		_TimeToMaxSpeed = 0.4;
		nameMap.set("Can Slide?", "_CanSlide");
		_CanSlide = true;
		nameMap.set("Run Right Animation", "_RunRightAnimation");
		nameMap.set("Run Left Animation", "_RunLeftAnimation");
		nameMap.set("Slip Right Animation", "_SlipRightAnimation");
		nameMap.set("Slip Left Animation", "_SlipLeftAnimation");
		nameMap.set("Full Run Right Animation", "_FullRunRightAnimation");
		nameMap.set("Full Run Left Animation", "_FullRunLeftAnimation");
		nameMap.set("Animation Category", "_AnimationCategory");
		_AnimationCategory = "Running";
		
	}
	
	override public function init()
	{
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}