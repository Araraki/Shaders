Shader "Custom/Unlit_SphereInside"
{
	Properties
	{
		_MainTex("Base (RGB)", 2D) = "white" {}
		_Alpha("Alpha", Range(0,1)) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque" }
		LOD 100

		Cull Front
		Lighting Off

		Pass
		{
			SetTexture[_MainTex]
			{
				ConstantColor(0, 0, 0, 1)
				combine constant
			}

			SetTexture[_MainTex]
			{
				ConstantColor(0, 0, 0,[_Alpha])
				combine	texture Lerp(constant) previous
			}
		}
	}
}
/*
// Unlit shader. Simplest possible textured shader.
// - SUPPORTS lightmap
// - no lighting
// - no per-material color

Shader "Custom/Unlit_SphereInside"
{
	Properties
	{
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_Alpha ("Alpha", Range (0,1)) = 1

	}

	SubShader
	{
		Tags { "RenderType"="Opaque" }
		LOD 100

		Cull Front
		Lighting Off
		
		Pass
		{	
			SetTexture [_MainTex]
			{
				ConstantColor ( 0, 0, 0, [_Alpha] )
				combine	texture Lerp(constant) previous
			}
		}
	}
}
*/