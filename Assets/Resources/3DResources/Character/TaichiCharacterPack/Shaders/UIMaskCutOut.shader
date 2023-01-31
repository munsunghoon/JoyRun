Shader "Custom/UIMaskCutout" {
	Properties {
		[PerRendererData] _MainTex("Sprite Texture", 2D) = "white" {}
		[PerRendererData] _AlphaTex("Sprite Alpha Texture", 2D) = "white" {}

		_Cutoff("Cut Off", Range(0.001, 1)) = 0.5

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
		ColorMask[_ColorMask]
		//Blend DstColor One, DstAlpha One
		//Blend DstColor SrcColor, SrcAlpha DstAlpha
		Blend SrcAlpha OneMinusSrcAlpha

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
			
				float4 _ClipRect;

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

				fixed _Cutoff;
			
				fixed4 frag (v2f i) : SV_Target
				{
					fixed4 col = i.color * tex2D(_MainTex, i.texcoord);
					col.a *= tex2D(_AlphaTex, i.texcoord).r;
	
					col.a *= UnityGet2DClipping(i.worldPosition.xy, _ClipRect);
					clip(col.a - _Cutoff);
					return col;
				}
				ENDCG 
			}
		}	
	}
}
