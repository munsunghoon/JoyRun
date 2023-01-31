Shader "Custom/CharacterStandard"
{
	Properties
	{
		_Cutoff ("Base Alpha cutoff", Range (0,.9)) = .5
		_Color ("Color", Color) = (1,1,1)
		_MainTex ("Texture", 2D) = "white" {}
		_BumpMap ("Bumpmap", 2D) = "bump" {}
		_SpecMap ("Metalic", 2D) = "white" {}
		_Shininess ("Shininess", Range (0.01, 1)) = 0.078125
		_Smoothness ("Smoothness", Range (0.01, 1)) = 0.55
        _Bligntness("Bligntness", Range(0.1, 10)) = 5.0
        _BumpValue("DummyBumpValue", Range(0.1, 1)) = 1.0

        
	}
	
	SubShader 
	{
	
    Tags { "RenderType" = "Opaque" }
		 
		Cull Off
		CGPROGRAM
		 
		#pragma surface surf ColoredSpecular
		 
        half3 _LightDirction;		 
		struct MySurfaceOutput
		{
			half3 Albedo;
			half3 Normal;
			half3 Emission;
            half Alpha;
		};
		 
		inline half4 LightingColoredSpecular (MySurfaceOutput s, half3 lightDir, half3 viewDir, half atten)
		{
		  half3 h = normalize (_LightDirction + viewDir);
		 
		  half diff = max (0, dot (s.Normal, viewDir));
		 
		  float nh = max (0, dot (s.Normal, h));
		 
		  half4 c;
		  c.rgb = ( s.Albedo * ( (_LightColor0.rgb * 0.5f))* diff) * (atten * 2);// + _LightColor0.rgb * specCol) * (atten * 2);
		  c.a = s.Alpha;
		 
		  return c;
		}
		 
 
		struct Input
		{
			float2 uv_MainTex;
			float2 uv_BumpMap;
			float2 uv_Detail;
			float2 uv_SpecMap;
		};
		
		fixed4 _Color;
		sampler2D _MainTex;
		sampler2D _SpecMap;
		sampler2D _BumpMap;
		half _Shininess;
		half _Smoothness;
		float _Cutoff;
        fixed _Bligntness;
        fixed _BumpValue;
		
		void surf (Input IN, inout MySurfaceOutput o)
		{			
			float4 diff = tex2D (_MainTex, IN.uv_MainTex);
			clip(diff.a - _Cutoff);
			o.Albedo = (diff.rgb + 0.5f) * 0.5f * _Color.rgb;
			o.Albedo *= diff.rgb * 2.5f;
			
            o.Normal = UnpackNormal(tex2D(_BumpMap, IN.uv_BumpMap));			
            o.Albedo *= _Bligntness;
            o.Albedo *= max((o.Normal.r + o.Normal.g + o.Normal.b) * 0.35f, _BumpValue);
            
            
		}
		ENDCG
	}
	
	FallBack "Diffuse"
}
