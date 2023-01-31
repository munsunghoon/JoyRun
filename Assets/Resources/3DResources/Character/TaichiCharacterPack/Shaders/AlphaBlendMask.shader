Shader "Custom/Alpha Blended(Mask)"
{
        Properties
        {
	        _MainTex ("Particle Texture", 2D) = "white" {}

            [HideInInspector]_StencilComp("Stencil Comparison", Float) = 8
            [HideInInspector]_Stencil("Stencil ID", Float) = 0
            [HideInInspector]_StencilOp("Stencil Operation", Float) = 0
            [HideInInspector]_StencilWriteMask("Stencil Write Mask", Float) = 255
            [HideInInspector]_StencilReadMask("Stencil Read Mask", Float) = 255
            [HideInInspector]_ColorMask("Color Mask", Float) = 15
        }

        Category
        {
	        Tags { "Queue"="Transparent" "IgnoreProjector"="True" "RenderType"="Transparent" }
	        Blend SrcAlpha OneMinusSrcAlpha
	        Cull Off Lighting Off ZWrite Off Fog { Mode Off }

            Stencil
			{
				Ref[_Stencil]
				Comp[_StencilComp]
				Pass[_StencilOp]
				ReadMask[_StencilReadMask]
				WriteMask[_StencilWriteMask]
			}
	
	        BindChannels {
		        Bind "Color", color
		        Bind "Vertex", vertex
		        Bind "TexCoord", texcoord
	        }
	
	        SubShader {
		        Pass {
			        SetTexture [_MainTex] {
				        combine texture * primary
			        }
		        }
	        }
        }
}