
Shader "Custom/Splatmapped UV"
{
	Properties 
	{
		_Color ("Main Color", Color) 								= (0.8, 0.8, 0.8, 0)
		_BlendSoft ("Texture Blend Softness", Range(0, 1))					= 0.1
		_Tex_Splat ("Splat map (RGBA)", 2D) 						= "white" {}
		_Tex_DiffuseR ("Splat Diffuse R (RGB), Height (A)", 2D) 				= "white" {}
		_Tex_DiffuseG ("Splat Diffuse G (RGB), Height (A)", 2D) 				= "white" {}
		_Tex_DiffuseB ("Splat Diffuse B (RGB), Height (A)", 2D) 				= "white" {}
	}
	
	SubShader 
	{
		Tags { "RenderType"="Opaque" }
		LOD 300
		Cull Off
		Lighting Off
		
		
		CGPROGRAM

			#pragma surface surf BlinnPhongSpecMap addshadow
			
			sampler2D _Tex_Splat;
			sampler2D _Tex_DiffuseR;
			sampler2D _Tex_DiffuseG;
			sampler2D _Tex_DiffuseB;

			fixed4 _Color;
			half _DetailTileX;
			half _DetailTileY;
			half _BlendSoft;

			static const float _PI = 3.14159265359f;
			
			struct Input 
			{
				half2 uv_Tex_Splat;
				half2 uv_Tex_Color;
				half2 uv_Tex_DiffuseR;
				half2 uv_Tex_DiffuseG;
				half2 uv_Tex_DiffuseB;
				half2 uv_Tex_DiffuseA;
				// float2 uv_BumpMap;
			};
			
			struct SurfaceOut 
			{
				fixed3 Albedo;
				fixed3 Normal;
				fixed3 Emission;
				half Specular;
				fixed3 Gloss;
				fixed Alpha;
			};

			//compares input against compares. returns 1 if input is greater than ALL compares, else 0
			fixed cutoff( float input, float compare1, float compare2 )
			{
				return ( input > compare1 && input > compare2 ) ? 1 : 0;
			}

			fixed blend_overlay( float3 base, float3 blend )
			{
				return lerp((base*blend*2),(1.0-(2.0*(1.0-base)*(1.0-blend))),round(base));
			}

			void surf (Input IN, inout SurfaceOut o)
			{
				//o.Albedo = 0;
				float3 c = {0, 0, 0};

				//Diffuse
				fixed4 splat = tex2D( _Tex_Splat, IN.uv_Tex_Splat );
				fixed4 dr = tex2D( _Tex_DiffuseR, IN.uv_Tex_DiffuseR );
				fixed4 dg = tex2D( _Tex_DiffuseG, IN.uv_Tex_DiffuseG );
				fixed4 db = tex2D( _Tex_DiffuseB, IN.uv_Tex_DiffuseB );
				
				dr.a *= splat.r;
				dg.a *= splat.g;
				db.a *= splat.b;

				//Combine all alphas to equal 1
				float sum = dr.a + dg.a + db.a;
				sum = max(sum, 0.01f);
				dg.a /= sum;
				db.a /= sum;

				//Cutoff each alpha, comparing against each other
				float dr_cutoff = cutoff( dr.a, dg.a, db.a);
				float dg_cutoff = cutoff( dg.a, db.a, dr.a);
				float db_cutoff = cutoff( db.a, dr.a, dg.a);

				//Lerp between the smooth alpha and cutoff alpha by the softness value
				//Amount to lerp should increase nonlinearly as the difference between the cutoff and smooth increases
				//That way we "round the corners" as we lerp.
				dr.a = lerp( dr_cutoff, dr.a, saturate( _BlendSoft ) );
				dg.a = lerp( dg_cutoff, dg.a, saturate( _BlendSoft ) );
				db.a = lerp( db_cutoff, db.a, saturate( _BlendSoft ) );

				c = saturate((dr.rgb*dr.a + dg.rgb*dg.a + db.rgb*db.a));
				o.Albedo = c *_Color;
				o.Alpha = dr.a * db.a * dg.a;
			}
			
			inline fixed4 LightingBlinnPhongSpecMap (SurfaceOut s, fixed3 lightDir, half3 viewDir, fixed atten)
			{
				half3 h = normalize (lightDir + viewDir);
				fixed diff = max (0, dot (s.Normal, lightDir));
				float nh = max (0, dot (s.Normal, h));
				float spec = pow (nh, s.Specular*128.0);
				fixed4 c;
				c.rgb = (s.Albedo * _LightColor0.rgb) * (atten);
				c.a = s.Alpha * atten;
				return c;
			}

		ENDCG
	}
	
}

