Shader "UI/Unlit/UIGray"
{
	Properties
	{
		[PerRendererData] _MainTex("Sprite Texture", 2D) = "white" {}
        _GradientTex("Gradient Texture", 2D) = "black" {}

        [HideInInspector]_StencilComp("Stencil Comparison", Float) = 8
		[HideInInspector]_Stencil("Stencil ID", Float) = 0
		[HideInInspector]_StencilOp("Stencil Operation", Float) = 0
		[HideInInspector]_StencilWriteMask("Stencil Write Mask", Float) = 255
		[HideInInspector]_StencilReadMask("Stencil Read Mask", Float) = 255
		[HideInInspector]_ColorMask("Color Mask", Float) = 15
	}

	SubShader
	{
		LOD 100

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

		Cull Off
		Lighting Off
		ZWrite Off
        Fog{ Mode Off }
		ZTest[unity_GUIZTestMode]
		Blend SrcAlpha OneMinusSrcAlpha
		

		Pass
		{
		
			CGPROGRAM
#pragma vertex vert
#pragma fragment frag

#include "UnityCG.cginc"
#include "UnityUI.cginc"

#pragma multi_compile __ UNITY_UI_ALPHACLIP

			struct appdata_t
			{
				float4 vertex : POSITION;
				float2 texcoord : TEXCOORD0;
                float2 texcoord2 : TEXCOORD1;
				fixed4 color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct v2f
			{
				float4 vertex : SV_POSITION;
				float2 texcoord : TEXCOORD0;
                float2 texcoord2 : TEXCOORD1;
                float4 worldPosition : TEXCOORD2;
				fixed4 color : COLOR;
				UNITY_VERTEX_OUTPUT_STEREO
			};

			sampler2D _MainTex;
            sampler2D _GradientTex;
			float4 _MainTex_ST;
            float4 _ClipRect;

			v2f vert(appdata_t v)
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
               
                o.worldPosition = v.vertex; 
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.texcoord = TRANSFORM_TEX(v.texcoord, _MainTex);
                o.texcoord2 = v.texcoord2;
                o.color = v.color;

				return o;
			}

			fixed4 frag(v2f i) : COLOR
			{
				fixed4 color = tex2D(_MainTex, i.texcoord) * i.color;

                color.a *= UnityGet2DClipping(i.worldPosition.xy, _ClipRect);

			    #ifdef UNITY_UI_ALPHACLIP
			    clip(color.a - 0.001);
			    #endif
                
                
                fixed4 color2 = tex2D(_GradientTex, i.texcoord2);
                float v_alpha = color.a;
                color.xyz = dot((color.xyz + color2.xyz) * i.color.xyz, float3(0.3, 0.59, 0.11));
                color.a = v_alpha * i.color.a;
                
				return color;
			}
		ENDCG

		}
	}
}