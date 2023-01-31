// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/ColorTint"
{
	Properties{
		[PerRendererData] _MainTex("Texture", 2D) = "" {}
		_Consistency("Color Consistency", Range(0, 1)) = 0
    }

    SubShader{
        Tags{ "RenderType" = "Transparent" "Queue" = "Transparent" }
		Lighting Off
        Fog{ Mode Off }
		Blend SrcAlpha OneMinusSrcAlpha
        GrabPass{}

        Pass{

            CGPROGRAM

			#pragma vertex vert
			#pragma fragment frag
			#include "UnityCG.cginc"

            sampler2D _GrabTexture;
            sampler2D _MainTex;
            float _Consistency;
			

            struct appdata_t {
                float4 vertex : POSITION;
                float4 texcoord : TEXCOORD0;
				fixed4 color : COLOR;
            };

            struct v2f {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
				float4 color : COLOR;
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

				fixed4 Color = i.color;
				float4 final = base * Color;
				float4 ColorOverlay = lerp(final, Color, final.a);
               
				return lerp(final, ColorOverlay, _Consistency);
            }

            ENDCG
        }
    }
}