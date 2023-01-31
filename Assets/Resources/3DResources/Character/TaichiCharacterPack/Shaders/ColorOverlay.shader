// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/ColorOverlay" 
{
	Properties
	{
		[PerRendererData] _MainTex("Texture", 2D) = "" {}
		_str("Overlay Strength", Float) = 0.45
		_Consistency("Color Consistency", Range(0, 1)) = 0
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent" "Queue" = "Transparent" }

		Lighting Off
		Blend SrcAlpha OneMinusSrcAlpha
        Fog{ Mode Off }
		GrabPass{}

		Pass
		{
			CGPROGRAM

			#pragma vertex vert
			#pragma fragment frag
			#include "UnityCG.cginc"

			sampler2D _GrabTexture;
			sampler2D _MainTex;
			float _str;
			float _Consistency;


			struct appdata_t {
				float4 vertex : POSITION;
				float4 texcoord : TEXCOORD0;
				fixed4 color : COLOR;
			};

			struct v2f {
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
				fixed4 color : COLOR;
			};

			float4 _MainTex_ST;

			v2f vert(appdata_t v) {
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = TRANSFORM_TEX(v.texcoord, _MainTex);
				o.color = v.color;
				return o;
			}

			half4 frag(v2f i) : COLOR
			{
				half4 base = tex2D(_MainTex, i.uv);
				half gray = (base.r + base.g + base.b) / 3;
				half4 overlay = base;

				fixed4 color = i.color;
				float4 effect = lerp(1 - (2 * (1 - base)) * (1 - overlay), (2 * base) * overlay, step(gray, 0.5f));
				float4 final = lerp(base, effect, (overlay.w * _str)) * color;
				float4 ColorOverlay = lerp(final, color, final.a);

				return lerp(final, ColorOverlay, _Consistency);
			}

			ENDCG
		}
	}
	FallBack "Diffuse"
}
