// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/UIBlur" {
    Properties {
        _blurSizeXY("BlurSizeXY", Range(0,20)) = 0

        [HideInInspector]_StencilComp("Stencil Comparison", Float) = 8
        [HideInInspector]_Stencil("Stencil ID", Float) = 0
        [HideInInspector]_StencilOp("Stencil Operation", Float) = 0
        [HideInInspector]_StencilWriteMask("Stencil Write Mask", Float) = 255
        [HideInInspector]_StencilReadMask("Stencil Read Mask", Float) = 255
        [HideInInspector]_ColorMask("Color Mask", Float) = 15
}
    SubShader 
	{

        // Draw ourselves after all opaque geometry
        Tags { "Queue" = "Transparent" }

         Cull Off 
			Lighting Off 
			ZWrite Off 
			Fog{ Mode Off }

			Stencil
			{
				Ref[_Stencil]
				Comp[_StencilComp]
				Pass[_StencilOp]
				ReadMask[_StencilReadMask]
				WriteMask[_StencilWriteMask]
			}

            ColorMask[_ColorMask]
        // Grab the screen behind the object into _GrabTexture
        GrabPass { }

        // Render the object with the texture generated above
        Pass 
		{
			CGPROGRAM
			#include "UnityCG.cginc"
			#pragma vertex vert
			#pragma fragment frag 

			sampler2D _GrabTexture : register(s0);
			float _blurSizeXY;

			struct data {

				float4 vertex : POSITION;
				float3 normal : NORMAL;
			};

			struct v2f {
				float4 position : POSITION;
				float4 screenPos : TEXCOORD0;
			};

 

			v2f vert(data i){
				v2f o;

				o.position = UnityObjectToClipPos(i.vertex);
				o.screenPos = ComputeGrabScreenPos(o.position);
				return o;

			}

            half4 GetGrabTexture( half4 sum, float added_value, float multiple_value, half depth, half2 screenPos )
            {
                return tex2D( _GrabTexture, float2(screenPos.x + added_value * depth, screenPos.y + added_value * depth)) * multiple_value;
            }
            
            half4 GetGrabTextureX( half4 sum, float added_value, float multiple_value, half depth, half2 screenPos )
            {
                return tex2D( _GrabTexture, float2(screenPos.x + added_value * depth, screenPos.y)) * multiple_value;
            }

            half4 GetGrabTextureY( half4 sum, float added_value, float multiple_value, half depth, half2 screenPos )
            {
                return tex2D( _GrabTexture, float2(screenPos.x, screenPos.y + added_value * depth)) * multiple_value;
            }

            half4 frag( v2f i ) : COLOR

			{
				float depth= _blurSizeXY*0.0005;
				float2 screenPos = i.screenPos.xy;

                float value1 = 4;
                float value2 = 0;

                float addedValue1 = 0.25;
                float addedValue2 = value1 * 0.0015;
                half4 sum = half4(0.0h,0.0h,0.0h,0.0h);  

                sum += GetGrabTexture(sum, value1-=addedValue1, value2 +=addedValue2, depth, screenPos);
                sum += GetGrabTexture(sum, -value1, value2, depth, screenPos);
                sum += GetGrabTexture(sum, value1, -value2, depth, screenPos);
                sum += GetGrabTexture(sum, -value1, -value2, depth, screenPos);
                sum += GetGrabTextureX(sum, value1, value2, depth, screenPos);
                sum += GetGrabTextureX(sum, -value1, value2, depth, screenPos);
                sum += GetGrabTextureY(sum, value1, value2, depth, screenPos);
                sum += GetGrabTextureY(sum, -value1, value2, depth, screenPos);

                sum += GetGrabTexture(sum, value1-=addedValue1, value2 +=addedValue2, depth, screenPos);
                sum += GetGrabTexture(sum, -value1, value2, depth, screenPos);
                sum += GetGrabTexture(sum, value1, -value2, depth, screenPos);
                sum += GetGrabTexture(sum, -value1, -value2, depth, screenPos);
                sum += GetGrabTextureX(sum, value1, value2, depth, screenPos);
                sum += GetGrabTextureX(sum, -value1, value2, depth, screenPos);
                sum += GetGrabTextureY(sum, value1, value2, depth, screenPos);
                sum += GetGrabTextureY(sum, -value1, value2, depth, screenPos);

                sum += GetGrabTexture(sum, value1-=addedValue1, value2 +=addedValue2, depth, screenPos);
                sum += GetGrabTexture(sum, -value1, value2, depth, screenPos);
                sum += GetGrabTexture(sum, value1, -value2, depth, screenPos);
                sum += GetGrabTexture(sum, -value1, -value2, depth, screenPos);
                sum += GetGrabTextureX(sum, value1, value2, depth, screenPos);
                sum += GetGrabTextureX(sum, -value1, value2, depth, screenPos);
                sum += GetGrabTextureY(sum, value1, value2, depth, screenPos);
                sum += GetGrabTextureY(sum, -value1, value2, depth, screenPos);

                sum += GetGrabTexture(sum, value1-=addedValue1, value2 +=addedValue2, depth, screenPos);
                sum += GetGrabTexture(sum, -value1, value2, depth, screenPos);
                sum += GetGrabTexture(sum, value1, -value2, depth, screenPos);
                sum += GetGrabTexture(sum, -value1, -value2, depth, screenPos);
                sum += GetGrabTextureX(sum, value1, value2, depth, screenPos);
                sum += GetGrabTextureX(sum, -value1, value2, depth, screenPos);
                sum += GetGrabTextureY(sum, value1, value2, depth, screenPos);
                sum += GetGrabTextureY(sum, -value1, value2, depth, screenPos);

                sum += GetGrabTexture(sum, value1-=addedValue1, value2 +=addedValue2, depth, screenPos);
                sum += GetGrabTexture(sum, -value1, value2, depth, screenPos);
                sum += GetGrabTexture(sum, value1, -value2, depth, screenPos);
                sum += GetGrabTexture(sum, -value1, -value2, depth, screenPos);
                sum += GetGrabTextureX(sum, value1, value2, depth, screenPos);
                sum += GetGrabTextureX(sum, -value1, value2, depth, screenPos);
                sum += GetGrabTextureY(sum, value1, value2, depth, screenPos);
                sum += GetGrabTextureY(sum, -value1, value2, depth, screenPos);

                sum += GetGrabTexture(sum, value1-=addedValue1, value2 +=addedValue2, depth, screenPos);
                sum += GetGrabTexture(sum, -value1, value2, depth, screenPos);
                sum += GetGrabTexture(sum, value1, -value2, depth, screenPos);
                sum += GetGrabTexture(sum, -value1, -value2, depth, screenPos);
                sum += GetGrabTextureX(sum, value1, value2, depth, screenPos);
                sum += GetGrabTextureX(sum, -value1, value2, depth, screenPos);
                sum += GetGrabTextureY(sum, value1, value2, depth, screenPos);
                sum += GetGrabTextureY(sum, -value1, value2, depth, screenPos);

                sum += GetGrabTexture(sum, value1-=addedValue1, value2 +=addedValue2, depth, screenPos);
                sum += GetGrabTexture(sum, -value1, value2, depth, screenPos);
                sum += GetGrabTexture(sum, value1, -value2, depth, screenPos);
                sum += GetGrabTexture(sum, -value1, -value2, depth, screenPos);
                sum += GetGrabTextureX(sum, value1, value2, depth, screenPos);
                sum += GetGrabTextureX(sum, -value1, value2, depth, screenPos);
                sum += GetGrabTextureY(sum, value1, value2, depth, screenPos);
                sum += GetGrabTextureY(sum, -value1, value2, depth, screenPos);

                sum += GetGrabTexture(sum, value1-=addedValue1, value2 +=addedValue2, depth, screenPos);
                sum += GetGrabTexture(sum, -value1, value2, depth, screenPos);
                sum += GetGrabTexture(sum, value1, -value2, depth, screenPos);
                sum += GetGrabTexture(sum, -value1, -value2, depth, screenPos);
                sum += GetGrabTextureX(sum, value1, value2, depth, screenPos);
                sum += GetGrabTextureX(sum, -value1, value2, depth, screenPos);
                sum += GetGrabTextureY(sum, value1, value2, depth, screenPos);
                sum += GetGrabTextureY(sum, -value1, value2, depth, screenPos);

                sum += GetGrabTexture(sum, value1-=addedValue1, value2 +=addedValue2, depth, screenPos);
                sum += GetGrabTexture(sum, -value1, value2, depth, screenPos);
                sum += GetGrabTexture(sum, value1, -value2, depth, screenPos);
                sum += GetGrabTexture(sum, -value1, -value2, depth, screenPos);
                sum += GetGrabTextureX(sum, value1, value2, depth, screenPos);
                sum += GetGrabTextureX(sum, -value1, value2, depth, screenPos);
                sum += GetGrabTextureY(sum, value1, value2, depth, screenPos);
                sum += GetGrabTextureY(sum, -value1, value2, depth, screenPos);
				
				sum += tex2D( _GrabTexture, float2(screenPos.x, screenPos.y)) *  (value2);
        
				return sum;//*0.25;
                          		
            }
			ENDCG
		}
        
    }

Fallback Off
} 