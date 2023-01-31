// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Water/Transparent"
{
	Properties
	{
        _MainColor ("Main Color", Color) = (0.5, 0.5, 0.5, 1)
        _SubColor("Sub Color", Color) = (0.5, 0.5, 0.5, 1)
		_MainTex ("Texture", 2D) = "white" {}
		_SpeedX("Speed X", Float) = 5
		_SpeedY("Speed Y", Float) = 5
		_Power("Distortion Power", Range(0, 1)) = 0.1
		_Opacity("Opacity", Range(0, 1)) = 1

        [Normal]_Bump("Wave Normal", 2D) = "bump"{}
		//[Toggle(CLIP)] _Clip("Clip negalive uv values", Float) = 0
	}

	SubShader
	{
        Tags{ "Queue" = "Transparent" "IgnoreProjector" = "True" "RenderType" = "Transparent" }
		LOD 100

		Blend One OneMinusSrcAlpha

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
            // make fog work
			#pragma multi_compile_fog
			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct v2f
			{
				float2 uv : TEXCOORD0;
				float2 uv1 : TEXCOORD1;
				float4 vertex : SV_POSITION;
				UNITY_FOG_COORDS(2)
			};

            fixed4 _MainColor;
            fixed4 _SubColor;;
			sampler2D _MainTex;
			float4 _MainTex_ST;
			float4 _NoizeTex_ST;
			float _SpeedX;
			float _SpeedY;
			float _Power;
			half _Opacity;
			half _Clip;
            sampler2D _Bump;
            float4 _Bump_ST;
			
			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = TRANSFORM_TEX(v.uv, _MainTex);
				o.uv1 = TRANSFORM_TEX(v.uv, _Bump);
                UNITY_TRANSFER_FOG(o, o.vertex);
				return o;
			}

			fixed4 frag (v2f i) : SV_Target
			{
				half speedX = -_Time.x *_SpeedX;
				half speedY = -_Time.x *-_SpeedX;
                
                float2 waveNormal = tex2D(_Bump, i.uv1.xy + speedX).xy + tex2D(_Bump, float2(i.uv1.x * 0.5 + speedY, i.uv1.y * 0.5)).xy;
                //waveNormal = waveNormal * 2 - 1;
                fixed4 texColor = tex2D(_MainTex, i.uv);
                fixed3 bump = UnpackNormal(tex2D(_Bump, waveNormal));
                //fixed3 bump = UnpackNormal(_Bump_ST);
                
                bump = dot(bump, float3(0.3, 0.59, 0.11));
                                //bumpColor =saturate(dot(texColor.xyz, bump));
                fixed4 bumpColor = saturate(float4(bump.x, bump.y, bump.z, _Opacity));
				//fixed4 col = _MainColor + (bumpColor);
                //fixed4 col = dot( _MainColor, bumpColor);
                //col = _MainColor + col;
                //bumpColor = min(bumpColor, 1 + texColor);
                //float4 col = (texColor * waveNormal.x * waveNormal.y) * lerp(_MainColor * (_MainColor.a * 0.5), _DeepColor * (_DeepColor.a * 0.5), waveNormal.x * waveNormal.y) + (bump.g);
                //float4 col = ((_MainColor * _MainColor.a * bump.r) + (_DeepColor * _DeepColor.a * bump.g));// * (bump.g);
                float bumpAvg = (bumpColor.r + bumpColor.g + bumpColor.b) * 0.4;
                float4 col = saturate(lerp(_SubColor * (_SubColor.a), _MainColor * (_MainColor.a), waveNormal.x * waveNormal.y)) + (bumpColor* bumpColor.a);
                col = col * (texColor);
                //float4 col = lerp(texColor, (_MainColor + (1 - bumpColor)), _Time.x);
                //col = lerp( col, _DeepColor, _Time.x);
                //col *= _MainColor;
                //fixed4 col = bumpColor;
                
                col.a = (texColor.a + _MainColor.a + _SubColor.a) * 0.3f;
                UNITY_APPLY_FOG(i.fogCoord, col);
				return col;
			}
			ENDCG
		}
	}
}
