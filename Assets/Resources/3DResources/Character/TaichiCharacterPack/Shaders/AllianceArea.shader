Shader "Custom/AllianceArea"
{
	Properties
	{
		_Color("Color", Color) = (1,1,1,1)
		_MainTex ("Texture", 2D) = "white" {}
		_TileTex("_TileTex", 2D) = "white" {}
		
		_AreaMaskTex("AreaMaskTexture", 2D) = "white" {}
	}
	SubShader
	{
		Tags 
		{
			"Queue" = "Transparent"
			"IgnoreProjector" = "True"
			"RenderType"="Transparent" 
		}
		LOD 100
		Blend SrcAlpha OneMinusSrcAlpha
		Lighting Off 
		ZWrite Off
		
		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			// make fog work
			//#pragma multi_compile_fog

			#include "UnityCG.cginc"

			struct appdata
			{
				fixed4 vertex : POSITION;
				fixed2 uv : TEXCOORD0;
				fixed2 maskUV : TEXCOORD1;

			};

			struct v2f
			{
				fixed2 uv : TEXCOORD0;
				fixed2 maskUV : TEXCOORD1;
				fixed4 vertex : SV_POSITION;
			};

			sampler2D _MainTex;
			fixed4 _MainTex_ST;
			sampler2D _TileTex;
			fixed4 _TileTex_ST;
		
			sampler2D _AreaMaskTex;
			fixed4 _AreaMaskTex_ST;
			fixed4 _Color;
			fixed4 _AreaColor;

			v2f vert(appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = TRANSFORM_TEX(v.uv, _MainTex);
				o.maskUV = TRANSFORM_TEX(v.uv, _AreaMaskTex);

				return o;
			}

			fixed4 frag(v2f i) : SV_Target
			{
				// sample the texture
				fixed4 col = tex2D(_MainTex, i.uv);
				fixed4 tile = tex2D(_TileTex, i.uv);
		
				fixed4 mask = tex2D(_AreaMaskTex, i.maskUV);

				col.rgb = _Color.rgb;
				
				col.a = tile.a * mask.r;
				col.a *= _Color.a;
				return col;
			}
			ENDCG
		}
	}
}

