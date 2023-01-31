Shader "Custom/TextureMask"
{
	//Properties
	//{
	//	_MainTex ("Texture", 2D) = "white" {}
	//}

	//SubShader
	//{
	//	Tags { "RenderType"="Opaque" }
	//	LOD 100

	//	Pass
	//	{
	//		CGPROGRAM
	//		#pragma vertex vert
	//		#pragma fragment frag
	//		// make fog work
	//		#pragma multi_compile_fog
	//		
	//		#include "UnityCG.cginc"

	//		struct appdata
	//		{
	//			float4 vertex : POSITION;
	//			float2 uv : TEXCOORD0;
	//		};

	//		struct v2f
	//		{
	//			float2 uv : TEXCOORD0;
	//			UNITY_FOG_COORDS(1)
	//			float4 vertex : SV_POSITION;
	//		};

	//		sampler2D _MainTex;
	//		float4 _MainTex_ST;
	//		
	//		v2f vert (appdata v)
	//		{
	//			v2f o;
	//			o.vertex = UnityObjectToClipPos(v.vertex);
	//			o.uv = TRANSFORM_TEX(v.uv, _MainTex);
	//			UNITY_TRANSFER_FOG(o,o.vertex);
	//			return o;
	//		}
	//		
	//		fixed4 frag (v2f i) : SV_Target
	//		{
	//			// sample the texture
	//			fixed4 col = tex2D(_MainTex, i.uv);
	//			// apply fog
	//			UNITY_APPLY_FOG(i.fogCoord, col);
	//			return col;
	//		}
	//		ENDCG
	//	}
	//}

	Properties
	{
		[PerRendererData]_MainTex("Base (RGB)", 2D) = "white" {}
	_Mask("Culling Mask", 2D) = "white" {}
	_Cutoff("Alpha cutoff", Range(0,1)) = 0.1
	}
		SubShader
	{
		Tags{ "Queue" = "Transparent" }
		Lighting Off
		ZWrite Off
        Fog{ Mode Off }
		Blend SrcAlpha OneMinusSrcAlpha
		AlphaTest GEqual[_Cutoff]
		Pass
	{
		SetTexture[_Mask]{ combine texture }
		SetTexture[_MainTex]{ combine texture, previous }
	}
	}
}
