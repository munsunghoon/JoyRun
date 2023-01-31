Shader "Custom/UIFakeLight" {
	Properties {
		[PerRendererData] _MainTex("Sprite Texture", 2D) = "white" {}
		[PerRendererData] _AlphaTex("Sprite Alpha Texture", 2D) = "white" {}

		_Intensity("Intensity", float) = 15


		[HideInInspector]_StencilComp("Stencil Comparison", Float) = 8
		[HideInInspector]_Stencil("Stencil ID", Float) = 0
		[HideInInspector]_StencilOp("Stencil Operation", Float) = 0
		[HideInInspector]_StencilWriteMask("Stencil Write Mask", Float) = 255
		[HideInInspector]_StencilReadMask("Stencil Read Mask", Float) = 255
		[HideInInspector]_ColorMask("Color Mask", Float) = 15
	}

	Category {
		Tags 
		{ 
			"Queue"="Transparent" 
			"IgnoreProjector"="True" 
			"RenderType"="Transparent" 
			"PreviewType"="Plane" 
		}

		Stencil
		{
			Ref[_Stencil]
			Comp[_StencilComp]
			Pass[_StencilOp]
			ReadMask[_StencilReadMask]
			WriteMask[_StencilWriteMask]
		}

		Cull Back
		Lighting Off
		ZWrite Off
        Fog{ Mode Off }
		ZTest[unity_GUIZTestMode]
		Blend DstColor One
		ColorMask[_ColorMask]
	
		SubShader {
			Pass {
		
				CGPROGRAM
				#pragma vertex vert
				#pragma fragment frag
				#pragma target 2.0
				#pragma multi_compile_particles
				#pragma multi_compile_fog

				#include "UnityCG.cginc"
				#include "UnityUI.cginc"

				struct appdata_t {
					float4 vertex : POSITION;
					fixed4 color : COLOR;
					float2 texcoord : TEXCOORD0;
				};

				struct v2f {
					float4 vertex : SV_POSITION;
					fixed4 color : COLOR;
					float2 texcoord : TEXCOORD0;
					float4 worldPosition : TEXCOORD1;
				};
			
				fixed4 _TextureSampleAdd;
				float4 _ClipRect;
				float _Intensity;

				v2f vert (appdata_t v)
				{
					v2f o;
					o.worldPosition = v.vertex;
					o.vertex = UnityObjectToClipPos(v.vertex);
					o.color = v.color;
					o.texcoord = v.texcoord;
					return o;
				}

				sampler2D _MainTex;
				sampler2D _AlphaTex;
			
				fixed4 frag (v2f i) : SV_Target
				{
					fixed4 col = 2.0f * i.color * tex2D(_MainTex, i.texcoord);
					col.a *= tex2D(_AlphaTex, i.texcoord).r;
	
					col.a *= UnityGet2DClipping(i.worldPosition.xy, _ClipRect);

					#ifdef UNITY_UI_ALPHACLIP
					clip(col.a - 0.001);
					#endif

					fixed diff = saturate(1 - length(i.texcoord - float2(0.5, 0.5)));
					diff = pow(diff, _Intensity);

					col = col * fixed4(diff, diff, diff, 1);

					return col;
				}
				ENDCG 
			}
		}	
	}
}
