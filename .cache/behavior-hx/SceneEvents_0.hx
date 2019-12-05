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
import box2D.collision.shapes.B2Shape;

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



class SceneEvents_0 extends SceneScript
{
	public var _IsPunching:Bool;
	public var _score:Float;
	
	
	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		nameMap.set("IsPunching", "_IsPunching");
		_IsPunching = false;
		nameMap.set("score", "_score");
		_score = 0;
		
	}
	
	override public function init()
	{
		
		/* ======================== When Creating ========================= */
		_score = 0;
		Engine.engine.setGameAttribute("Player_Health", 3);
		playSound(getSound(200));
		
		/* ======================== Actor of Type ========================= */
		addWhenTypeGroupKilledListener(getActorType(167), function(eventActor:Actor, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				_score = (_score + 100);
			}
		});
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				g.setFont(getFont(184));
				g.drawString("" + "Score:", 15, 290);
				g.drawString("" + _score, 95, 290);
			}
		});
		
		/* ======================== When Updating ========================= */
		addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if((_score == 600))
				{
					switchScene(GameModel.get().scenes.get(2).getID(), null, createCrossfadeTransition(0.25));
				}
				if(((Engine.engine.getGameAttribute("Player_Health") : Float) == 2))
				{
					getActor(1).setAnimation("Hurt");
				}
				else if(((Engine.engine.getGameAttribute("Player_Health") : Float) == 1))
				{
					getActor(1).setAnimation("Hurt2");
				}
			}
		});
		
		/* ======================== Actor of Type ========================= */
		addWhenTypeGroupKilledListener(getActorType(169), function(eventActor:Actor, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				_score = (_score + 75);
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}