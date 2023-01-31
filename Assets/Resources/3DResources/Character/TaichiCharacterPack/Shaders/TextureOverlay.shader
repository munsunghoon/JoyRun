// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/TextureOverlay"
{
	Properties
	{
		[PerRendererData]_MainTex("Screen Blended", 2D) = "" {}
		_Overlay("Overlay Texture", 2D) = "grey" {}
		_OverlayColor("Overlay Color", Color) = (1, 1, 1, 1)

        [HideInInspector]_StencilComp("Stencil Comparison", Float) = 8
		[HideInInspector]_Stencil("Stencil ID", Float) = 0
		[HideInInspector]_StencilOp("Stencil Operation", Float) = 0
		[HideInInspector]_StencilWriteMask("Stencil Write Mask", Float) = 255
		[HideInInspector]_StencilReadMask("Stencil Read Mask", Float) = 255
		[HideInInspector]_ColorMask("Color Mask", Float) = 15
	}

	CGINCLUDE
	#include "UnityCG.cginc"


	struct appdata_t 
	{
		float4 vertex : POSITION;
		float4 texcoord : TEXCOORD0;
		fixed4 color : COLOR;
	};

	struct v2f 
	{
		float4 pos : POSITION;
		float2 uv[2] : TEXCOORD0;
		fixed4 color : COLOR;
	};

	sampler2D _Overlay;
	sampler2D _MainTex;

	half4 _MainTex_TexelSize;
	fixed4 _OverlayColor;

	v2f vert(appdata_t v)
	{
		v2f o;
		o.pos = UnityObjectToClipPos(v.vertex);
		o.uv[0] = v.texcoord.xy;
		#if UNITY_UV_STARTS_AT_TOP
		if (_MainTex_TexelSize.y<0.0)
		o.uv[0].y = 1.0 - o.uv[0].y;
		#endif
		o.uv[1] = v.texcoord.xy;
		o.color = v.color;
		return o;
	}

	//half4 fragAddSub(v2f i) : COLOR
	//{
	//	half4 toAdd = tex2D(_Overlay, i.uv[0]) * _Intensity;
	//	return tex2D(_MainTex, i.uv[1]) + toAdd;
	//}

	//half4 fragMultiply(v2f i) : COLOR
	//{
	//	half4 toBlend = tex2D(_Overlay, i.uv[0]) * _Intensity;
	//	return tex2D(_MainTex, i.uv[1]) * toBlend;
	//}

	//half4 fragScreen(v2f i) : COLOR
	//{
	//	half4 toBlend = (tex2D(_Overlay, i.uv[0]) * _Intensity);
	//	return 1 - (1 - toBlend)*(1 - (tex2D(_MainTex, i.uv[1])));
	//}

	//half4 fragOverlay(v2f i) : COLOR
	//{
	//	half4 m = (tex2D(_Overlay, i.uv[0]));// * 255.0;
	//	half4 color = (tex2D(_MainTex, i.uv[1]));//* 255.0;
	//	float3 check = step(0.5, color.rgb);
	//	float3 result = 0;

	//	result = check * (half3(1,1,1) - ((half3(1,1,1) - 2 * (color.rgb - 0.5)) *  (1 - m.rgb)));
	//	result += (1 - check) * (2 * color.rgb) * m.rgb;

	//	return half4(lerp(color.rgb, result.rgb, (_Intensity)), color.a);
	//}

	//half4 fragAlphaBlend(v2f i) : COLOR
	//{
	//	half4 toAdd = tex2D(_Overlay, i.uv[0]);
	//	return lerp(tex2D(_MainTex, i.uv[1]), toAdd, toAdd.a);
	//}

	/*half4 fragOverlay(half4 a, half4 b) : COLOR
	{
		half4 m = b;
		half4 color = a;
		float3 check = step(0.5, color.rgb);
		float3 result = 0;

		result = check * (half3(1,1,1) - ((half3(1,1,1) - 2 * (color.rgb - 0.5)) *  (1 - m.rgb)));
		result += (1 - check) * (2 * color.rgb) * m.rgb;

		return half4(lerp(color.rgb, result.rgb, (_Intensity)), color.a);
	}*/

	half4 fragBlending(v2f i) : COLOR
	{
		half4 main = tex2D(_MainTex, i.uv[1]);
		half4 overlay = tex2D(_Overlay, i.uv[0]);

		main.a *= i.color.a;
		overlay.a *= _OverlayColor.a;

		half3 rgb = (i.color.rgb * main.rgb * main.a) + (_OverlayColor.rgb * overlay.rgb * overlay.a);

		half4 final;
		final.rgb = rgb;
		final.a = main.a * overlay.a;
		return final;
	}

	ENDCG

	Subshader
	{
        Tags
		{
			"Queue" = "Transparent"
			"IgnoreProjector" = "True"
			"RenderType" = "Transparent"
			"PreviewType" = "Plane"
		}

        Stencil
		{
			Ref[_Stencil]
			Comp[_StencilComp]
			Pass[_StencilOp]
			ReadMask[_StencilReadMask]
			WriteMask[_StencilWriteMask]
		}

		ZTest[unity_GUIZTestMode]
        Cull Off
        ZWrite Off
		Fog{ Mode off }
		Blend SrcAlpha OneMinusSrcAlpha
		//ColorMask RGB
		Pass
		{
			CGPROGRAM
			#pragma fragmentoption ARB_precision_hint_fastest
			#pragma vertex vert
			#pragma fragment fragBlending
			ENDCG
		}
	}
	Fallback off
}
